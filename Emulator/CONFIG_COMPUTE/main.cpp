#define SC_INCLUDE_FX
#include <systemc.h>

#include <fifo_weight.cpp>
#include <fifo_config.cpp>
#include <fifo_input.cpp>
#include <fifo_output.cpp>
#include <fifo_accum.cpp>
#include <fifo_sched.cpp>
#include <fifo_offset.cpp>
#include <sigmoid_unit.cpp>
#include <all_pe.cpp>
//#include <fixed_in_dff.cpp>
#include <fstream>
#include <iostream>
#include <string>
#include <fifo_sigmoid.cpp>


#define MASK_26 0x03FFFFFF


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

using namespace std;

// Hex to Binary
string GetBinaryStringFromHexString (string sHex)
		{
			string sReturn = "";
			for (int i = 0; i < sHex.length (); ++i)
			{
				switch (sHex [i])
				{
					case '0': sReturn.append ("0000"); break;
					case '1': sReturn.append ("0001"); break;
					case '2': sReturn.append ("0010"); break;
					case '3': sReturn.append ("0011"); break;
					case '4': sReturn.append ("0100"); break;
					case '5': sReturn.append ("0101"); break;
					case '6': sReturn.append ("0110"); break;
					case '7': sReturn.append ("0111"); break;
					case '8': sReturn.append ("1000"); break;
					case '9': sReturn.append ("1001"); break;
					case 'a': sReturn.append ("1010"); break;
					case 'b': sReturn.append ("1011"); break;
					case 'c': sReturn.append ("1100"); break;
					case 'd': sReturn.append ("1101"); break;
					case 'e': sReturn.append ("1110"); break;
					case 'f': sReturn.append ("1111"); break;
				}
			}
			return sReturn;
		}



// Binary to Decimal
unsigned int bin2dec(char* str) {
 unsigned int n = 0;
 int size = strlen(str) - 1;
        int count = 0;
 while ( *str != '\0' ) {
  if ( *str == '1' ) 
      n = n + pow(2, size - count );
  count++; 
  str++;
 }
 return n;
}

// 16 bit conversion to decimal

uint16_t bin2dec_16(char* str) {
 uint16_t n = 0;
 int size = strlen(str) - 1;
        int count = 0;
 while ( *str != '\0' ) {
  if ( *str == '1' ) 
      n = n + pow(2, size - count );
  count++; 
  str++;
 }
 return n;
}



int sc_main(int argc, char* argv[]) {

	sc_signal<sc_fixed<WIDTH, 9, SC_RND> > in_data1, in_data2, in_data3, in_data4, in_data5, in_data6, in_data7, in_data8;
        //sc_signal<sc_fixed<WIDTH, 9, SC_RND> > w1, w2, w3, w4, w5, w6, w7, w8;
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
  sc_signal<bool>   weight1_wr_en;
  sc_signal<bool>   weight_rd_en;

  sc_signal<bool>   weight2_wr_en;
  sc_signal<bool>   weight3_wr_en;
  sc_signal<bool>   weight4_wr_en;
  sc_signal<bool>   weight5_wr_en;
  sc_signal<bool>   weight6_wr_en;
  sc_signal<bool>   weight7_wr_en;
  sc_signal<bool>   weight8_wr_en;

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
  sc_signal<bool>   sigmoid_unit_wr_en;


  // Interface signals
  sc_signal<sc_fixed<16, 9, SC_RND> >  weight1_fifo_out_data;
  sc_signal<sc_fixed<16, 9, SC_RND> >  weight2_fifo_out_data;
  sc_signal<sc_fixed<16, 9, SC_RND> >  weight3_fifo_out_data;
  sc_signal<sc_fixed<16, 9, SC_RND> >  weight4_fifo_out_data;
  sc_signal<sc_fixed<16, 9, SC_RND> >  weight5_fifo_out_data;
  sc_signal<sc_fixed<16, 9, SC_RND> >  weight6_fifo_out_data;
  sc_signal<sc_fixed<16, 9, SC_RND> >  weight7_fifo_out_data;
  sc_signal<sc_fixed<16, 9, SC_RND> >  weight8_fifo_out_data;

  sc_signal<sc_fixed<16, 9, SC_RND> > input_fifo_out_data;
  sc_signal<sc_fixed<48, 34, SC_RND> > accum_fifo_out_data;
  sc_signal<sc_fixed<48, 34, SC_RND> > accum_fifo_in_data;
  sc_signal<sc_fixed<48, 34, SC_RND> > offset_fifo_out_data;
  sc_signal<sc_fixed<16, 9, SC_RND> > sigmoid_fifo_in_data;
  sc_signal<sc_fixed<16, 9, SC_RND> > sigmoid_fifo_out_data;

  config_fifo config_fifo ("config_fifo");

  weight_fifo weight_fifo1 ("weight_fifo1");
  weight_fifo weight_fifo2 ("weight_fifo2");
  weight_fifo weight_fifo3 ("weight_fifo3");
  weight_fifo weight_fifo4 ("weight_fifo4");
  weight_fifo weight_fifo5 ("weight_fifo5");
  weight_fifo weight_fifo6 ("weight_fifo6");
  weight_fifo weight_fifo7 ("weight_fifo7");
  weight_fifo weight_fifo8 ("weight_fifo8");

  input_fifo input_fifo ("input_fifo");  
  output_fifo output_fifo ("output_fifo"); 
  accum_fifo accum_fifo ("accum_fifo"); 
  sched_fifo sched_fifo ("sched_fifo"); 
  offset_fifo offset_fifo ("offset_fifo");
  sigmoid_fifo sigmoid_fifo ("sigmoid_fifo");



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
		all_pes.w1(weight1_fifo_out_data);
		all_pes.w2(weight2_fifo_out_data);
		all_pes.w3(weight3_fifo_out_data);
		all_pes.w4(weight4_fifo_out_data);
		all_pes.w5(weight5_fifo_out_data);
		all_pes.w6(weight6_fifo_out_data);
		all_pes.w7(weight1_fifo_out_data);
		all_pes.w8(weight1_fifo_out_data);
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
		all_pes.out_wr_en(weight_rd_en);
		all_pes.dout1(dout1);
		all_pes.dout2(dout2);
		all_pes.dout3(dout3);
		all_pes.dout4(dout4);
		all_pes.dout5(dout5);
		all_pes.dout6(dout6);
		all_pes.dout7(dout7);

	sigmoid_unit su("SIGMOID UNIT");
		su.sigmoid_funct_1(sigmoid_funct_1);
		su.sigmoid_funct_2(sigmoid_funct_2);
		su.sigmoid_in(sigmoid_in);
		su.sigmoid_en(sigmoid_en);
		su.sigmoid_out(sigmoid_fifo_in_data);
		su.clock(clock);
		su.reset(reset);
		su.wr_en(sigmoid_unit_wr_en);
// FIFO connections
 
  // Connect the DUT
    config_fifo.clock(clock);
    config_fifo.reset(reset);
    config_fifo.wr_en(config_wr_en);
    config_fifo.rd_en(config_rd_en);
    // Out data not required directly from int32
 //   config_fifo.config_rd_data(config_fifo_out_data);

    // Connect the DUT
    weight_fifo1.clock(clock);
    weight_fifo1.reset(reset);
    weight_fifo1.wr_en(weight1_wr_en);
    weight_fifo1.rd_en(weight_rd_en);
    weight_fifo1.weight_rd_data(weight1_fifo_out_data);


    weight_fifo2.clock(clock);
    weight_fifo2.reset(reset);
    weight_fifo2.wr_en(weight2_wr_en);
    weight_fifo2.rd_en(weight_rd_en);
    weight_fifo2.weight_rd_data(weight2_fifo_out_data);

    weight_fifo3.clock(clock);
    weight_fifo3.reset(reset);
    weight_fifo3.wr_en(weight3_wr_en);
    weight_fifo3.rd_en(weight_rd_en);
    weight_fifo3.weight_rd_data(weight3_fifo_out_data);

    weight_fifo4.clock(clock);
    weight_fifo4.reset(reset);
    weight_fifo4.wr_en(weight4_wr_en);
    weight_fifo4.rd_en(weight_rd_en);
    weight_fifo4.weight_rd_data(weight4_fifo_out_data);

    weight_fifo5.clock(clock);
    weight_fifo5.reset(reset);
    weight_fifo5.wr_en(weight5_wr_en);
    weight_fifo5.rd_en(weight_rd_en);
    weight_fifo5.weight_rd_data(weight5_fifo_out_data);

    weight_fifo6.clock(clock);
    weight_fifo6.reset(reset);
    weight_fifo6.wr_en(weight6_wr_en);
    weight_fifo6.rd_en(weight_rd_en);
    weight_fifo6.weight_rd_data(weight6_fifo_out_data);

    weight_fifo7.clock(clock);
    weight_fifo7.reset(reset);
    weight_fifo7.wr_en(weight7_wr_en);
    weight_fifo7.rd_en(weight_rd_en);
    weight_fifo7.weight_rd_data(weight7_fifo_out_data);

    weight_fifo8.clock(clock);
    weight_fifo8.reset(reset);
    weight_fifo8.wr_en(weight8_wr_en);
    weight_fifo8.rd_en(weight_rd_en);
    weight_fifo8.weight_rd_data(weight8_fifo_out_data);

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
    output_fifo.output_fifo_in_data(sigmoid_fifo_in_data);
    // Connect the DUT
    accum_fifo.clock(clock);
    accum_fifo.reset(reset);
    accum_fifo.wr_en(accum_wr_en);
    accum_fifo.rd_en(accum_rd_en);
    accum_fifo.accum_fifo_in_data(accum_fifo_in_data);
    accum_fifo.accum_rd_data(accum_fifo_out_data);

    // Connect the DUT
    sigmoid_fifo.clock(clock);
    sigmoid_fifo.reset(reset);
    sigmoid_fifo.wr_en(sigmoid_wr_en);
    sigmoid_fifo.rd_en(sigmoid_rd_en);
    sigmoid_fifo.sigmoid_fifo_in_data(sigmoid_fifo_in_data);
    sigmoid_fifo.sigmoid_rd_data(sigmoid_fifo_out_data);

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

////////////// START of CONFIGURATION ///////////////////////////

unsigned int temp1;
int temp2;
int config_count = 0;
int i;

uint16_t fixed_16uns;
int16_t fixed_16;

float factor = 1 << 7;
float value_fixed;

  ifstream config_file;
  config_file.open ("config.txt");

 string line;
 if (config_file.is_open())
  {
    while ( getline (config_file,line) )
    {
      cout << line << '\n';
      string temp = GetBinaryStringFromHexString(line);
      char* chr = strdup(temp.c_str());
      temp1 = bin2dec(chr);
     
      chr = chr + 16;

      fixed_16uns = bin2dec_16(chr);
      fixed_16 = fixed_16uns;  // converting to signed
      value_fixed = fixed_16 / factor;
      cout<<fixed_16uns<<"   "<<fixed_16<<"   "<<value_fixed<<endl;
      // Taking last 26 bit
      temp2 = (temp1 & MASK_26); 
     
      fifo_config_data_wr[config_count] = temp2;
      cout <<fifo_config_data_wr[config_count] << "\n\n";
      config_count++;
    }
    config_file.close();
  }

  else cout << "Unable to open file"; 

// Configuration Array stored

// Write it in FIFO and parallely read from configuration FIFO also so that values are stored.

  // Initialize all variables
  reset = 0;       // initial value of reset
  config_wr_en = 0;      // initial value of enable

weight1_wr_en = 0;
weight_rd_en = 0;

weight2_wr_en = 0;
weight3_wr_en = 0;
weight4_wr_en = 0;
weight5_wr_en = 0;
weight6_wr_en = 0;
weight7_wr_en = 0;
weight8_wr_en = 0;

input_wr_en = 0;
input_rd_en = 0;
output_wr_en = 0;
output_rd_en = 0;
accum_wr_en = 0;
accum_rd_en = 0;
sched_wr_en = 0;
sched_rd_en = 0;
offset_wr_en = 0;
offset_rd_en = 0;

  for (i=0;i<1;i++) {
    clock = 0; 
    sc_start(1, SC_NS);
    clock = 1; 
    sc_start(1, SC_NS);
  }
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
  for (i=0;i<2;i++) {
    clock = 0; 
    sc_start(1, SC_NS);
    clock = 1; 
    sc_start(1, SC_NS);
  }
  cout << "@" << sc_time_stamp() <<" Asserting Enable\n" << endl;
  config_wr_en = 1;  // Assert enable

  int weight1_count = 0;
  int weight2_count = 0;
int weight3_count = 0;
int weight4_count = 0;
int weight5_count = 0;
int weight6_count = 0;
int weight7_count = 0;
int weight8_count = 0;
int offset_count = 0;
int sched_count = 0;
int number_input;
int number_output;
bool input_f = 0;
bool output_f = 0;
int input_scaling;
int output_scaling;

  for (i=0;i<config_count+2;i++) {   // It reads the last value in +1 and then in next clock +2 values of buffers are written
    
    int fifo_count ;
    fifo_count = config_fifo.packet_fifo.num_free();
    if( fifo_count == CONFIG_FIFO_DEPTH )
    config_rd_en = 0; // FIFO empty
    else
    config_rd_en = 1;

    if(i == config_count)
    config_wr_en = 0; // Prevent last junk value from being written in config FIFO
 
    clock = 0; 
    sc_start(1, SC_NS);
    clock = 1; 
    sc_start(1, SC_NS);
  
  // Decode FIFO config rd_data if rd_en high
   if(config_rd_en)
	{
       // Decode fifo_config_data_rd
        cout<<" Config fifo read value = "<< fifo_config_data_rd <<endl;
        
      fixed_16uns = fifo_config_data_rd & 0x0000FFFF;
      fixed_16 = fixed_16uns;  // converting to signed
      value_fixed = fixed_16 / factor;  // 16 bit fixed value

 
        // weight buffers
                int addr = fifo_config_data_rd & 0x01C00000;
 	
        	if(!(fifo_config_data_rd & 0x02000000) && (addr == 0x00000000))  // if 26th bit not set
                {
                weight_fifo1.fifo_weight_data_wr[weight1_count++] = value_fixed;  // last 16 bit goes in weight buffer
                weight1_wr_en = 1;
                }
                else
                weight1_wr_en = 0;

		if(!(fifo_config_data_rd & 0x02000000) && (addr == 0x00400000))  // if 26th bit not set
                {
                weight_fifo2.fifo_weight_data_wr[weight2_count++] = value_fixed;  // last 16 bit goes in weight buffer
                weight2_wr_en = 1;
                }
                else
                weight2_wr_en = 0;

		if(!(fifo_config_data_rd & 0x02000000) && (addr == 0x00800000))  // if 26th bit not set
                {
                weight_fifo3.fifo_weight_data_wr[weight3_count++] = value_fixed;  // last 16 bit goes in weight buffer
                weight3_wr_en = 1;
                }
                else
                weight3_wr_en = 0;

		if(!(fifo_config_data_rd & 0x02000000) && (addr == 0x00C00000))  // if 26th bit not set
                {
                weight_fifo4.fifo_weight_data_wr[weight4_count++] = value_fixed;  // last 16 bit goes in weight buffer
                weight4_wr_en = 1;
                }
                else
                weight4_wr_en = 0;


        	if(!(fifo_config_data_rd & 0x02000000) && (addr == 0x01000000))  // if 26th bit not set
                {
                weight_fifo5.fifo_weight_data_wr[weight5_count++] = value_fixed;  // last 16 bit goes in weight buffer
                weight5_wr_en = 1;
                }
                else
                weight5_wr_en = 0;

		if(!(fifo_config_data_rd & 0x02000000) && (addr == 0x01400000))  // if 26th bit not set
                {
                weight_fifo6.fifo_weight_data_wr[weight6_count++] = value_fixed;  // last 16 bit goes in weight buffer
                weight6_wr_en = 1;
                }
                else
                weight6_wr_en = 0;

		if(!(fifo_config_data_rd & 0x02000000) && (addr == 0x01800000))  // if 26th bit not set
                {
                weight_fifo7.fifo_weight_data_wr[weight7_count++] = value_fixed;  // last 16 bit goes in weight buffer
                weight7_wr_en = 1;
                }
                else
                weight7_wr_en = 0;

		if(!(fifo_config_data_rd & 0x02000000) && (addr == 0x01C00000))  // if 26th bit not set
                {
                weight_fifo8.fifo_weight_data_wr[weight8_count++] = value_fixed;  // last 16 bit goes in weight buffer
                weight8_wr_en = 1;
                }
                else
                weight8_wr_en = 0;

                // offset buffer
   	    	if((fifo_config_data_rd & 0x02000000) && (addr == 0x01800000))  // if 26th set
                {
                fifo_offset_data_wr[offset_count++] = value_fixed;  // last 16 bit goes in weight buffer
                offset_wr_en = 1;
                }
                else
                offset_wr_en = 0;
 

     		// Scheduler buffer
   	    	if((fifo_config_data_rd & 0x02000000) && (addr == 0x01400000))  // if 26th set
                {
                fifo_sched_data_wr[sched_count++] = fixed_16;  // last 16 bit goes in weight buffer
                sched_wr_en = 1;
                }
                else
                sched_wr_en = 0;
 
		// Input count
   	    	if((fifo_config_data_rd & 0x02000000) && (addr == 0x00C00000))  // if 26th set
                {
		number_input = fixed_16;
                }

		// Output count
   	    	if((fifo_config_data_rd & 0x02000000) && (addr == 0x01000000))  // if 26th set
                {
		number_output = fixed_16;
                }

		// Input Format
   	    	if((fifo_config_data_rd & 0x02000000) && (addr == 0x00400000))  // if 26th set
                {
		input_f = (fixed_16 & 0x8000);
                input_scaling = (fixed_16 & 0x7FFF);
                cout<<"Input format = "<<input_f<<"  Scaling ="<<input_scaling<<endl;
                }

		// Output Format
   	    	if((fifo_config_data_rd & 0x02000000) && (addr == 0x00800000))  // if 26th set
                {
		output_f = (fixed_16 & 0x8000);
                output_scaling = (fixed_16 & 0x7FFF);
                cout<<"Output format = "<<output_f<<"  Scaling ="<<output_scaling<<endl;
                }

 
	}
 
  }
  // Deassert enable of all
  config_wr_en = 0;  // De-Assert enable
  config_rd_en = 0;  // De-Assert enable

weight1_wr_en = 0;
weight_rd_en = 0;

weight2_wr_en = 0;
weight3_wr_en = 0;
weight4_wr_en = 0;
weight5_wr_en = 0;
weight6_wr_en = 0;
weight7_wr_en = 0;
weight8_wr_en = 0;

input_wr_en = 0;
input_rd_en = 0;
output_wr_en = 0;
output_rd_en = 0;
accum_wr_en = 0;
accum_rd_en = 0;
sched_wr_en = 0;
sched_rd_en = 0;
offset_wr_en = 0;
offset_rd_en = 0;

// Reading Input file based on format


float temp_float;
int input_count = 0;

  ifstream input_file;
  input_file.open ("input.txt");
      cout << "\n\nReading Input FILE \n\n";
	cout << "Input scaling is " << input_scaling << endl;
	cout << "Input format is " << input_f << endl;
 if (input_file.is_open())
  {
    while ( getline (input_file,line) )
    {
      cout << line << '\n';
      string temp = GetBinaryStringFromHexString(line);
      char* chr = strdup(temp.c_str());
      // if integer format then use this - take care of unsigned representation 
      temp1 = bin2dec(chr);

      temp2 = temp1;  // unsigned to sign representation 
      cout<<" Unsigned = "<<temp1<<" signed = "<<temp2<<endl;
      // if float covert to 32-bit single precision float
      float f = 0.0 ;
      if ( (temp1 & 0x7FFFFFFF) != 0 ) {
      f = ldexp( ((temp1 & 0x007FFFFF) | 0x00800000),
      (int)((temp1 & 0x7F800000) >> 23) - 126 - 24 ) ;
      }
      if ( (temp1 & 0x80000000) != 0 ) {
      f = -f ;
      }
      
 /// Include Scaling factor here
	///**************************Temporarily changing the value of input_scaling to 1... Modify it later /////////////////////////
	input_scaling = 1; 
      cout <<f << "\n\n";
      if(input_f)
      fifo_input_data_wr[input_count] = f/input_scaling;   // Store float
      else
      fifo_input_data_wr[input_count] = temp2/input_scaling; // Store 2's compelment integer

      input_count++;
    }
    input_file.close();
  }

  else cout << "Unable to open file"; 
int k;
for(k = 0; k < weight1_count; k++)
cout<<weight_fifo1.fifo_weight_data_wr[k]<<"   ";
cout<<"\n\nWeight1\n\n\n";

for(k = 0; k < weight2_count; k++)
cout<<weight_fifo2.fifo_weight_data_wr[k]<<"   ";
cout<<"\n\nWeight2\n\n\n";

for(k = 0; k < weight3_count; k++)
cout<<weight_fifo3.fifo_weight_data_wr[k]<<"   ";
cout<<"\n\nWeight3\n\n\n";

for(k = 0; k < weight4_count; k++)
cout<<weight_fifo4.fifo_weight_data_wr[k]<<"   ";
cout<<"\n\nWeight4\n\n\n";

for(k=0; k< offset_count; k++)
cout<<fifo_offset_data_wr[k]<<"   ";
cout<<"\n\nOffset\n\n\n";

char c;
c=getchar();

///////////// END of CONFIGURATION /////////////////////////////

// ALL EN LOW at this point

//////////////////// WRITING to INPUT FIFO ////////////////////
input_wr_en = 1;

if(input_count < number_input)
cout<<"ERROR - Input is less than number of desired inputs"<<endl;

int input_c_count = 0;
// Done writing to input FIFO
int output_count = 0;
  sched_rd_en = 1;
  sigmoid_unit_wr_en = 1;
  for(i = 0; i < 46; i++) {

        if(input_wr_en)
        	input_c_count++;
        if(output_wr_en)
		output_count++;
        
	//Stall Logic
	int input_fifo_count = input_fifo.packet_fifo.num_free(); 
	int output_fifo_count = output_fifo.packet_fifo.num_free();
	if(((input_rd_en == 1) && (input_fifo_count == INPUT_FIFO_DEPTH) && (input_c_count < number_input)) || ((output_wr_en == 1) && (output_fifo_count == 0)) && (output_count < number_output)) {
		sched_rd_en = 0;
		weight_rd_en = 0;
		sigmoid_unit_wr_en = 0;
		fifo_sched_data_rd = 0; 				//Not sure if this is required in case of stall	
	} else if(((input_fifo_count != INPUT_FIFO_DEPTH) && (input_c_count < number_input)) || ((output_fifo_count != 0)) && (output_count < number_output)) {
		sched_rd_en = 1;
		weight_rd_en = 1;
		sigmoid_unit_wr_en = 1;
	}
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
		in_data1 = (sigmoid_rd_en == 1) ? sigmoid_fifo_out_data : input_fifo_out_data;
		wr_en1 = ((fifo_sched_data_rd & MASK_8) == 128) ? 1 : 0;
	} else if((pe_sel1 == 1) && (pe_sel2 == 0) && (pe_sel3 == 0)) {
		in_data2 = (sigmoid_rd_en == 1) ? sigmoid_fifo_out_data : input_fifo_out_data;
		wr_en2 = ((fifo_sched_data_rd & MASK_8) == 128) ? 1 : 0;
	} else if((pe_sel1 == 0) && (pe_sel2 == 1) && (pe_sel3 == 0)) {
		in_data3 = (sigmoid_rd_en == 1) ? sigmoid_fifo_out_data : input_fifo_out_data;
		wr_en3 = ((fifo_sched_data_rd & MASK_8) == 128) ? 1 : 0;
	} else if((pe_sel1 == 1) && (pe_sel2 == 1) && (pe_sel3 == 0)) {
		in_data4 = (sigmoid_rd_en == 1) ? sigmoid_fifo_out_data : input_fifo_out_data;
		wr_en4 = ((fifo_sched_data_rd & MASK_8) == 128) ? 1 : 0;
	} else if((pe_sel1 == 0) && (pe_sel2 == 0) && (pe_sel3 == 1)) {
		in_data5 = (sigmoid_rd_en == 1) ? sigmoid_fifo_out_data : input_fifo_out_data;
		wr_en5 = ((fifo_sched_data_rd & MASK_8) == 128) ? 1 : 0;
	} else if((pe_sel1 == 1) && (pe_sel2 == 0) && (pe_sel3 == 1)) {
		in_data6 = (sigmoid_rd_en == 1) ? sigmoid_fifo_out_data : input_fifo_out_data;
		wr_en6 = ((fifo_sched_data_rd & MASK_8) == 128) ? 1 : 0;
	} else if((pe_sel1 == 0) && (pe_sel2 == 1) && (pe_sel3 == 1)) {
		in_data7 = (sigmoid_rd_en == 1) ? sigmoid_fifo_out_data : input_fifo_out_data;
		wr_en7 = ((fifo_sched_data_rd & MASK_8) == 128) ? 1 : 0;
	} else {
		in_data8 = (sigmoid_rd_en == 1) ? sigmoid_fifo_out_data : input_fifo_out_data;
		wr_en8 = ((fifo_sched_data_rd & MASK_8) == 128) ? 1 : 0;
	}
	accum_rd_en = ((fifo_sched_data_rd & MASK_9) == 256) ? 1 : 0;	
	accum_wr_en = ((fifo_sched_data_rd & MASK_10) == 512) ? 1 : 0;
	offset_rd_en = ((fifo_sched_data_rd & MASK_9) == 256) ? 0 : 1;	
	d_in = (accum_rd_en == 1) ? accum_fifo_out_data : offset_fifo_out_data; 
	sigmoid_in_sel1 = ((fifo_sched_data_rd & MASK_11) == 1024) ? 1 : 0;
	sigmoid_in_sel2 = ((fifo_sched_data_rd & MASK_12) == 2048) ? 1 : 0;
	sigmoid_in_sel3 = ((fifo_sched_data_rd & MASK_13) == 4096) ? 1 : 0;
	sigmoid_en = ((fifo_sched_data_rd & MASK_14) == 8192) ? 1 : 0;
	
	if((sigmoid_in_sel1 == 0) && (sigmoid_in_sel2 == 0) && (sigmoid_in_sel3 == 0) && (sigmoid_en == 1))
		sigmoid_in = dout1.read();
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
	cout << "@" << sc_time_stamp() << "The value of output_wr_en is " << output_wr_en.read()  << endl;	
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
	cout << "@" << sc_time_stamp() << "The value of sigmoid_in is " << sigmoid_in.read() << endl;
	cout << "@" << sc_time_stamp() << "The value of sigmoid_en is " << sigmoid_en.read() << endl;
	cout << "@" << sc_time_stamp() << "The value of sigmoid function 1 is " << sigmoid_funct_1.read() << endl;
	cout << "@" << sc_time_stamp() << "The value of sigmoid function 2 is " << sigmoid_funct_2.read() << endl;
	cout << "@" << sc_time_stamp() << "The value of weight1 output is " << weight1_fifo_out_data << endl;
	cout << "@" << sc_time_stamp() << "The value of d_in is " << d_in.read() << endl;
	cout << "@" << sc_time_stamp() << "The value of offset buffer is " << offset_fifo_out_data << endl;
	cout << "@" << sc_time_stamp() << "The value of in_data1 is " << in_data1.read() << endl;
	cout << "@" << sc_time_stamp() << "The value of dout1 is " << dout1.read() << endl;	
 	cout << "@" << sc_time_stamp() << "The value of sigmoid unit output " << sigmoid_fifo_in_data.read() << endl; 
	//cout << "@" << sc_time_stamp() << "The value of sched_count is " << sched_count << endl;
	cout << "@" << sc_time_stamp() << "The value of fifo_output_rd is " << fifo_output_data_rd << endl;
	cout << "@" << sc_time_stamp() << "The value of weight_rd_en is " << weight_rd_en << endl;
	cout << "@" << sc_time_stamp() << "The value of fifo_offset_data_rd is " << fifo_offset_data_rd << endl;
	cout << "@" << sc_time_stamp() << "The value of offset count is " << offset_count << endl;
	cout << "@" << sc_time_stamp() << "The value of sigmoid fifo output is " << sigmoid_fifo_out_data << endl;
	char d;
	d=getchar();
  }
	
	 cout << "@" << sc_time_stamp() << "The value of fifo_output_rd is " << fifo_output_data_rd << endl;

  cout << "@" << sc_time_stamp() <<" Terminating simulation\n" << endl;
  return 0;// Terminate simulation

 }
