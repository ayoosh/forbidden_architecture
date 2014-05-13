#define SC_INCLUDE_FX
#include <systemc.h>
#define WIDTH 16
SC_MODULE(dff3) {
	 sc_in<sc_fixed<WIDTH, 9, SC_RND> > in_data;
	 sc_in<bool> reset;
	 sc_in<bool> wr_en;
	 sc_out<sc_fixed<WIDTH, 9, SC_RND> > out_q;
	 sc_in<bool> clock; // clock port
	 void do_dff_pos ();
	 // Constructor
	 SC_CTOR (dff3) {
	 	SC_METHOD (do_dff_pos);
//	 	sensitive_pos << clock << reset;
//		sensitive << reset;
		sensitive << clock.pos();
	 }
};
void dff3::do_dff_pos () {
	if (reset.read()) 
		out_q.write(0);
 	else if(wr_en.read())
		out_q.write(in_data.read());
	cout<<"@" << sc_time_stamp() <<":: Value of Input dff " <<out_q.read()<<endl;
}
/*int sc_main(int argc, char* argv[]) {
	sc_signal<bool> clock;
	sc_signal<sc_uint<FF_WIDTH> > in_data;
	sc_signal<bool> reset;
	sc_signal<sc_uint<FF_WIDTH> > out_q;
	int i = 0;
	dff3 dff("D-FLIP FLOP");
		dff.clock(clock);
		dff.reset(reset);
		dff.in_data(in_data);
		dff.out_q(out_q);
	
	sc_start(1, SC_NS);
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
	in_data = 1;
	cout << "@" << sc_time_stamp() << ":: Setting input to FF as 1\n" << endl;
	for(i = 0;i < 3; i++) {
		clock = 0;
		sc_start(1, SC_NS);
		clock = 1;
		sc_start(1, SC_NS);
	}
	in_data = 0;
	cout<< "@" << sc_time_stamp() <<":: Setting input to FF as 0\n" << endl;
	for(i = 0;i < 5; i++) {
		clock = 0;
		sc_start(1, SC_NS);
		clock = 1;
		sc_start(1, SC_NS);
	}
	return 0;
}*/
