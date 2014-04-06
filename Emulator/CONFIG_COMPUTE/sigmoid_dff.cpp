#define SC_INCLUDE_FX
#include <systemc.h>
#define WIDTH 16
SC_MODULE(sigmoid_dff) {
	 sc_in<sc_fixed<3*WIDTH, 34, SC_RND> > in_data;
	 sc_in<bool> reset;
	 sc_out<sc_fixed<WIDTH, 9, SC_RND> > out_q;
	 sc_in<bool> clock; // clock port
	 sc_in<bool> wr_en;
	 sc_in<bool> sigmoid_funct_1, sigmoid_funct_2;
	 double in, out;
	 void do_dff_pos ();
	 // Constructor
	 SC_CTOR (sigmoid_dff) {
	 	SC_METHOD (do_dff_pos);
//	 	sensitive_pos << clock << reset;
//		sensitive << reset;
		sensitive << clock.pos();
	 }
};
void sigmoid_dff::do_dff_pos () {
	if (reset.read()) 
		out_q.write(0);
 	else if(wr_en.read()) {
	cout << "@" << sc_time_stamp() <<":: Input to dff " <<in_data.read()<<endl;
		if((sigmoid_funct_1.read() == 0) && (sigmoid_funct_2.read() == 0)) {
			in = in_data.read();
			out = tanh (in);
			out_q.write(out);
		} else if((sigmoid_funct_1.read() == 1) && (sigmoid_funct_2.read() == 0)) 
			out_q.write(in_data.read());
	}	
//	cout<<"@" << sc_time_stamp() <<":: Value of Output dff " <<out_q.read()<<endl;
}

/*int sc_main(int argc, char* argv[]) {
        sc_signal<bool> clock;
        sc_signal<sc_uint<FF_WIDTH> > out_q;
        sc_signal<sc_fixed<3*WIDTH, 34, SC_RND> > in_data;
         sc_signal<bool> reset;
         sc_signal<sc_fixed<WIDTH, 9, SC_RND> > out_q;
         sc_signal<bool> clock; // clock port
         sc_signal<bool> wr_en;
        //sc_signal<sc_fixed<3*WIDTH, 34, SC_RND> > sigmoid_new_in;
        int i = 0;
        sigmoid_dff dff("D-FLIP FLOP");
                dff.clock(clock);
                dff.reset(reset);
                dff.in_data(in_data);
                dff.out_q(out_q);
                dff.wr_en(wr_en);
//      sc_start(1, SC_NS);
        reset = 1;
        cout << "@" << sc_time_stamp() << ":: Asserting reset\n" << endl;
        for(i = 0;i < 5;i++) {
                clock = 0;
                sc_start(1, SC_NS);
                clock = 1;
                sc_start(1, SC_NS);
        }
        reset = 0;
        cout << "@" << sc_time_stamp() << ":: De-assering reset\n" << endl;
        wr_en = 1;
        for(i = 0; i < 1; i++) {
                clock = 0;
                sc_start(1, SC_NS);
                clock = 1;
                sc_start(1, SC_NS);
        }
        in_data = 1.31254;
	for(i = 0; i < 1; i++) {
                clock = 0;
                sc_start(1, SC_NS);
                clock = 1;
                sc_start(1, SC_NS);
        }
//        cout << "@" << sc_time_stamp() << ":: Setting input to FF as 1\n" << endl;
        in_data = 0.2567;
        for(i = 0; i < 1; i++) {
                clock = 0;
                sc_start(1, SC_NS);
                clock = 1;
                sc_start(1, SC_NS);
        }
  //      cout<< "@" << sc_time_stamp() <<":: Setting input to FF as 0\n" << endl;
        for(i = 0;i < 1; i++) {
                clock = 0;
                sc_start(1, SC_NS);
                clock = 1;
                sc_start(1, SC_NS);
        }
        return 0;
}*/

