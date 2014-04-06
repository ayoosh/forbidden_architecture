#define SC_INCLUDE_FX
#include <systemc.h>

#include <fifo_weight.cpp>
#include <fifo_config.cpp>
#include <fifo_input.cpp>
#include <fifo_output.cpp>
#include <fifo_accum.cpp>
#include <fifo_sched.cpp>
#include <fifo_offset.cpp>
#include <all_pe.cpp>
#define MASK_1 0x0001
#define MASK_2 0x0002
#define MASK_3 0x0004
#define MASK_4 0x0008
#define MASK_5 0x0010
#define MASK_6 0x0020
#define MASK_7 0x0040
#define MASK_8 0x0080
#define MASK_9 0x0100
#define MASK_10 0x0200
#define MASK_11 0x0400
#define MASK_12 0x0800
#define MASK_13 0x1000
#define MASK_14 0x2000
#define MASK_15 0x4000
#define MASK_16 0x8000
int sc_main(int argc, char* argv[]) {

	sc_signal<sc_fixed<WIDTH, 9, SC_RND> > in_data1, in_data2, in_data3, in_data4, in_data5, in_data6, in_data7, in_data8;
        sc_signal<sc_fixed<WIDTH, 9, SC_RND> > w1, w2, w3, w4, w5, w6, w7, w8;
        sc_signal<sc_fixed<3*WIDTH, 34, SC_RND> > d_in;
        sc_signal<sc_fixed<3*WIDTH, 34, SC_RND> > d_out;
        sc_signal<bool> clock;
        sc_signal<bool> reset;

        // When enabling input comes from scheduling logic
        sc_signal<bool> wr_en1, wr_en2, wr_en3, wr_en4, wr_en5, wr_en6, wr_en7, wr_en8;
        // Connect to rd_en of weight buffer
        sc_signal<bool> out_wr_en;
	sc_signal<sc_fixed<3*WIDTH, 34, SC_RND> > dout1, dout2, dout3, dout4, dout5, dout6, dout7;

  // Control Signals
  sc_signal<bool>   config_wr_en;
  sc_signal<bool>   config_rd_en;
  sc_signal<bool>   weight_wr_en;
  sc_signal<bool>   weight_rd_en;
  sc_signal<bool>   input_wr_en;
  sc_signal<bool>   input_rd_en;
  sc_signal<bool>   output_wr_en;
  sc_signal<bool>   output_rd_en;
  sc_signal<bool>   accum_wr_en;
  sc_signal<bool>   accum_rd_en;
  sc_signal<bool>   sched_wr_en;
  sc_signal<bool>   sched_rd_en;
  sc_signal<bool>   offset_wr_en;
  sc_signal<bool>   offset_rd_en;

  //New signals created. To be connected later
  sc_signal<bool>   sigmoid_rd_en;
  sc_signal<bool>   sigmoid_wr_en;
  sc_signal<bool>   pe_sel1;
  sc_signal<bool>   pe_sel2;
  sc_signal<bool>   pe_sel3;
  sc_signal<bool>   sigmoid_in_sel1;
  sc_signal<bool>   sigmoid_in_sel2;
  sc_signal<bool>   sigmoid_in_sel3;
  sc_signal<bool>   sigmoid_en;
  sc_signal<sc_fixed<48, 34, SC_RND> >   sigmoid_in;
  sc_signal<bool>   sigmoid_funct_1;
  sc_signal<bool>   sigmoid_funct_2;
  
  // Interface signals
  sc_signal<sc_fixed<16, 9, SC_RND> >  weight_fifo_out_data;
  sc_signal<sc_fixed<16, 9, SC_RND> > input_fifo_out_data;
  sc_signal<sc_fixed<48, 34, SC_RND> > accum_fifo_out_data;
  sc_signal<sc_fixed<48, 34, SC_RND> > accum_fifo_in_data;
  sc_signal<sc_fixed<48, 34, SC_RND> > offset_fifo_out_data;


  config_fifo config_fifo ("config_fifo");
  weight_fifo weight_fifo ("weight_fifo");
  input_fifo input_fifo ("input_fifo");  
  output_fifo output_fifo ("output_fifo"); 
  accum_fifo accum_fifo ("accum_fifo"); 
  sched_fifo sched_fifo ("sched_fifo"); 
  offset_fifo offset_fifo ("offset_fifo");

// PE connections
	all_pe all_pes("PE1_8");
		all_pes.in_data1(in_data1);
		all_pes.in_data2(in_data2);
		all_pes.in_data3(in_data3);
		all_pes.in_data4(in_data4);
		all_pes.in_data5(in_data5);
		all_pes.in_data6(in_data6);
		all_pes.in_data7(in_data7);
		all_pes.in_data8(in_data8);
		all_pes.w1(w1);
		all_pes.w2(w2);
		all_pes.w3(w3);
		all_pes.w4(w4);
		all_pes.w5(w5);
		all_pes.w6(w6);
		all_pes.w7(w7);
		all_pes.w8(w8);
		all_pes.wr_en1(wr_en1);
		all_pes.wr_en2(wr_en2);
		all_pes.wr_en3(wr_en3);
		all_pes.wr_en4(wr_en4);
		all_pes.wr_en5(wr_en5);
		all_pes.wr_en6(wr_en6);
		all_pes.wr_en7(wr_en7);
		all_pes.wr_en8(wr_en8);
		all_pes.d_in(d_in);
		all_pes.d_out(accum_fifo_in_data);
		all_pes.reset(reset);
		all_pes.clock(clock);
		all_pes.out_wr_en(out_wr_en);
		all_pes.dout1(dout1);
		all_pes.dout2(dout2);
		all_pes.dout3(dout3);
		all_pes.dout4(dout4);
		all_pes.dout5(dout5);
		all_pes.dout6(dout6);
		all_pes.dout7(dout7);


// FIFO connections
 
  // Connect the DUT
    config_fifo.clock(clock);
    config_fifo.reset(reset);
    config_fifo.wr_en(config_wr_en);
    config_fifo.rd_en(config_rd_en);
    // Out data not required directly from int32
 //   config_fifo.config_rd_data(config_fifo_out_data);

    // Connect the DUT
    weight_fifo.clock(clock);
    weight_fifo.reset(reset);
    weight_fifo.wr_en(weight_wr_en);
    weight_fifo.rd_en(weight_rd_en);
    weight_fifo.weight_rd_data(weight_fifo_out_data);

    // Connect the DUT
    input_fifo.clock(clock);
    input_fifo.reset(reset);
    input_fifo.wr_en(input_wr_en);
    input_fifo.rd_en(input_rd_en);
    input_fifo.input_rd_data(input_fifo_out_data);

    // Connect the DUT
    output_fifo.clock(clock);
    output_fifo.reset(reset);
    output_fifo.wr_en(output_wr_en);
    output_fifo.rd_en(output_rd_en);

    // Connect the DUT
    accum_fifo.clock(clock);
    accum_fifo.reset(reset);
    accum_fifo.wr_en(accum_wr_en);
    accum_fifo.rd_en(accum_rd_en);
    accum_fifo.accum_fifo_in_data(accum_fifo_in_data);
    accum_fifo.accum_rd_data(accum_fifo_out_data);

    // Connect the DUT
    sched_fifo.clock(clock);
    sched_fifo.reset(reset);
    sched_fifo.wr_en(sched_wr_en);
    sched_fifo.rd_en(sched_rd_en);
    // Out data not required read directly from int16_t
//    sched_fifo.sched_rd_data(sched_fifo_out_data);

    // Connect the DUT
    offset_fifo.clock(clock);
    offset_fifo.reset(reset);
    offset_fifo.wr_en(offset_wr_en);
    offset_fifo.rd_en(offset_rd_en);
    offset_fifo.offset_rd_data(offset_fifo_out_data);











 int i;

  for(i = 0; i < 2000; i++ )
	{
        fifo_sched_data_wr[i] = i;
        }
  

  // Initialize all variables
  /*reset = 0;       // initial value of reset
  accum_wr_en = 0;      // initial value of enable
  accum_rd_en = 0;

  offset_wr_en = 0;      // initial value of enable
  offset_rd_en = 0;

  for (i=0;i<5;i++) {
    clock = 0; 
    sc_start(1, SC_NS);
    clock = 1; 
    sc_start(1, SC_NS);
  }*/

  //Testing 16 MASKS

/*  fifo_sched_data_wr[0] = 1;
  fifo_sched_data_wr[1] = 2;
  fifo_sched_data_wr[2] = 4;
  fifo_sched_data_wr[3] = 8;
  fifo_sched_data_wr[4] = 16;
  fifo_sched_data_wr[5] = 32;
  fifo_sched_data_wr[6] = 64;
  fifo_sched_data_wr[7] = 128;
  fifo_sched_data_wr[8] = 256;
  fifo_sched_data_wr[9] = 512;
  fifo_sched_data_wr[10] = 1024;
  fifo_sched_data_wr[11] = 2048;
  fifo_sched_data_wr[12] = 4096;
  fifo_sched_data_wr[13] = 8192;
  fifo_sched_data_wr[14] = 16384;
  fifo_sched_data_wr[15] = 32768;
*/
  reset = 1;    // Assert the reset
  cout << "@" << sc_time_stamp() <<" Asserting reset\n" << endl;
  for (i=0;i<2;i++) {
    clock = 0; 
    sc_start(1, SC_NS);
    clock = 1; 
    sc_start(1, SC_NS);
  }
  reset = 0;    // De-assert the reset
  cout << "@" << sc_time_stamp() <<" De-Asserting reset\n" << endl;
  for (i=0;i<1;i++) {
    clock = 0; 
    sc_start(1, SC_NS);
    clock = 1; 
    sc_start(1, SC_NS);
  }

  sched_wr_en = 1; //making read enable high for Scheduler buffer 
  
	for(i = 0; i < 2000; i++) {
		clock = 0;
		sc_start(1, SC_NS);
		clock = 1;
		sc_start(1, SC_NS);
	}
  sched_wr_en = 0;
	for(i = 0; i < 1; i++) {
		clock = 0;
		sc_start(1, SC_NS);
		clock = 1;
		sc_start(1, SC_NS);
	}
	//Scheduler logic 
  sched_rd_en = 1;
  for(i = 0; i < 2000; i++) {
	clock = 0;
	sc_start(1, SC_NS);
	clock = 1;
	input_rd_en = ((fifo_sched_data_rd & MASK_1) == 1) ? 1 : 0;	//Input Read Enable
	sigmoid_rd_en = ((fifo_sched_data_rd & MASK_2) == 2) ? 1 : 0;	//Sigmoid Read Enable
	sigmoid_wr_en = ((fifo_sched_data_rd & MASK_3) == 4) ? 1 : 0;	//Sigmoid Write Enable
	output_wr_en = ((fifo_sched_data_rd & MASK_4) == 8) ? 1: 0;	//Output Write Enable
	pe_sel1 = ((fifo_sched_data_rd & MASK_5) == 16) ? 1 : 0;	//PE input select
	pe_sel2 = ((fifo_sched_data_rd & MASK_6) == 32) ? 1 : 0;
	pe_sel3 = ((fifo_sched_data_rd & MASK_7) == 64) ? 1 : 0;
	
	if((pe_sel1 == 0) && (pe_sel2 == 0) && (pe_sel3 == 0)) {
		in_data1 = input_fifo_out_data;
		wr_en1 = ((fifo_sched_data_rd & MASK_8) == 128) ? 1 : 0;
	} else if((pe_sel1 == 1) && (pe_sel2 == 0) && (pe_sel3 == 0)) {
		in_data2 = input_fifo_out_data;
		wr_en2 = ((fifo_sched_data_rd & MASK_8) == 128) ? 1 : 0;
	} else if((pe_sel1 == 0) && (pe_sel2 == 1) && (pe_sel3 == 0)) {
		in_data3 = input_fifo_out_data;
		wr_en3 = ((fifo_sched_data_rd & MASK_8) == 128) ? 1 : 0;
	} else if((pe_sel1 == 1) && (pe_sel2 == 1) && (pe_sel3 == 0)) {
		in_data4 = input_fifo_out_data;
		wr_en4 = ((fifo_sched_data_rd & MASK_8) == 128) ? 1 : 0;
	} else if((pe_sel1 == 0) && (pe_sel2 == 0) && (pe_sel3 == 1)) {
		in_data5 = input_fifo_out_data;
		wr_en5 = ((fifo_sched_data_rd & MASK_8) == 128) ? 1 : 0;
	} else if((pe_sel1 == 1) && (pe_sel2 == 0) && (pe_sel3 == 1)) {
		in_data6 = input_fifo_out_data;
		wr_en6 = ((fifo_sched_data_rd & MASK_8) == 128) ? 1 : 0;
	} else if((pe_sel1 == 0) && (pe_sel2 == 1) && (pe_sel3 == 1)) {
		in_data7 = input_fifo_out_data;
		wr_en7 = ((fifo_sched_data_rd & MASK_8) == 128) ? 1 : 0;
	} else {
		in_data8 = input_fifo_out_data;
		wr_en8 = ((fifo_sched_data_rd & MASK_8) == 128) ? 1 : 0;
	}
	accum_rd_en = ((fifo_sched_data_rd & MASK_9) == 256) ? 1 : 0;	
	accum_wr_en = ((fifo_sched_data_rd & MASK_10) == 512) ? 1 : 0;
	
	sigmoid_in_sel1 = ((fifo_sched_data_rd & MASK_11) == 1024) ? 1 : 0;
	sigmoid_in_sel2 = ((fifo_sched_data_rd & MASK_12) == 2048) ? 1 : 0;
	sigmoid_in_sel3 = ((fifo_sched_data_rd & MASK_13) == 4096) ? 1 : 0;
	sigmoid_en = ((fifo_sched_data_rd & MASK_14) == 8192) ? 1 : 0;
	
	if((sigmoid_in_sel1 == 0) && (sigmoid_in_sel2 == 0) && (sigmoid_in_sel3 == 0) && (sigmoid_en == 1))
		sigmoid_in = dout1;
	else if((sigmoid_in_sel1 == 1) && (sigmoid_in_sel2 == 0) && (sigmoid_in_sel3 == 0) && (sigmoid_en == 1))
		sigmoid_in = dout2;
	else if((sigmoid_in_sel1 == 0) && (sigmoid_in_sel2 == 1) && (sigmoid_in_sel3 == 0) && (sigmoid_en == 1))
		sigmoid_in = dout3;
	else if((sigmoid_in_sel1 == 1) && (sigmoid_in_sel2 == 1) && (sigmoid_in_sel3 == 0) && (sigmoid_en == 1))
		sigmoid_in = dout4;
	else if((sigmoid_in_sel1 == 0) && (sigmoid_in_sel2 == 0) && (sigmoid_in_sel3 == 1) && (sigmoid_en == 1))
		sigmoid_in = dout5;
	else if((sigmoid_in_sel1 == 1) && (sigmoid_in_sel2 == 0) && (sigmoid_in_sel3 == 1) && (sigmoid_en == 1))
		sigmoid_in = dout6;
	else if((sigmoid_in_sel1 == 0) && (sigmoid_in_sel2 == 1) && (sigmoid_in_sel3 == 1) && (sigmoid_en == 1))
		sigmoid_in = dout7;
	else if((sigmoid_in_sel1 == 1) && (sigmoid_in_sel2 == 1) && (sigmoid_in_sel3 == 1) && (sigmoid_en == 1))
		sigmoid_in = accum_fifo_in_data;
	
	sigmoid_funct_1 = ((fifo_sched_data_rd & MASK_15) == 16384) ? 1 : 0;
	sigmoid_funct_2 = ((fifo_sched_data_rd & MASK_16) == 32768) ? 1 : 0;
	
	sc_start(1, SC_NS);
	
	cout << "@" << sc_time_stamp() << "The value of input_read_en is " << input_rd_en.read()  << endl;
	cout << "@" << sc_time_stamp() << "The value of sigmoid_wr_en is " << sigmoid_wr_en.read() << endl;
	cout << "@" << sc_time_stamp() << "The value of sigmoid_rd_en is " << sigmoid_rd_en.read() << endl;
	cout << "@" << sc_time_stamp() << "The value of pe_sel1 is " << pe_sel1.read() << endl;
	cout << "@" << sc_time_stamp() << "The value of pe_sel2 is " << pe_sel2.read() << endl;
	cout << "@" << sc_time_stamp() << "The value of pe_sel3 is " << pe_sel3.read() << endl;
	cout << "@" << sc_time_stamp() << "The value of accum_rd_en is " << accum_rd_en.read() << endl;
	cout << "@" << sc_time_stamp() << "The value of accum_wr_en is " << accum_wr_en.read() << endl;
	cout << "@" << sc_time_stamp() << "The value of sigmoid_in_sel1 is " << sigmoid_in_sel1.read() << endl;
	cout << "@" << sc_time_stamp() << "The value of sigmoid_in_sel2 is " << sigmoid_in_sel2.read() << endl;
	cout << "@" << sc_time_stamp() << "The value of sigmoid_in_sel3 is " << sigmoid_in_sel3.read() << endl;
	cout << "@" << sc_time_stamp() << "The value of sigmoid_en is " << sigmoid_en.read() << endl;
	cout << "@" << sc_time_stamp() << "The value of sigmoid function 1 is " << sigmoid_funct_1.read() << endl;
	cout << "@" << sc_time_stamp() << "The value of sigmoid function 2 is " << sigmoid_funct_2.read() << endl;	
  }
		
  /*cout << "@" << sc_time_stamp() <<" Asserting Enable\n" << endl;
  accum_wr_en = 1;  // Assert enable
  offset_wr_en = 1;
  for (i=0;i<25;i++) {

    clock = 0; 
    sc_start(1, SC_NS);
    clock = 1; 
    sc_start(1, SC_NS);
  
    if(i>6)
    {  accum_rd_en = 1;
    offset_rd_en = 1;
    cout<< "Read value == "<<fifo_offset_data_rd<<endl;
    cout<< "Read value sc_signal == "<<offset_fifo_out_data.read()<<endl;
    }
  }
  cout << "@" << sc_time_stamp() <<" De-Asserting Enable\n" << endl;
  accum_wr_en = 0; // De-assert enable
  accum_rd_en = 0;

  offset_wr_en = 0; // De-assert enable
  offset_rd_en = 0;*/

  cout << "@" << sc_time_stamp() <<" Terminating simulation\n" << endl;
  return 0;// Terminate simulation

 }
