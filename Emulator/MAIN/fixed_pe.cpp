#define SC_INCLUDE_FX
#include "systemc.h"
#include "fixed_mult.cpp"
#include "fixed_in_dff.cpp"
#include "fixed_add.cpp"
#include "fixed_out_dff.cpp"

#define WIDTH 16 

SC_MODULE(processing_element) {
	sc_in<sc_fixed<WIDTH, 9, SC_RND> > in_data, c;
	sc_out<sc_fixed<3*WIDTH, 34, SC_RND> > d_out;
	sc_in<sc_fixed<3*WIDTH, 34, SC_RND> > d_in;
	sc_in<bool> clock;
	sc_in<bool> reset;
	sc_in<bool> wr_en;
	sc_in<bool> out_wr_en;	
	adder *a1;
	multiplier *m1;
	dff3 *in;
	out_dff *out;

	sc_signal<sc_fixed<WIDTH, 9, SC_RND> > b;
                sc_signal<sc_fixed<3*WIDTH, 34, SC_RND> > mult;
                sc_signal<sc_fixed<3*WIDTH, 34, SC_RND> > sum;

//multiplier multiplier1("MULTIPLIER");
//adder adder1("ADDER");
	SC_CTOR(processing_element) {
	//	SC_METHOD(do_processing);
		in = new dff3 ("in");
		in->clock(clock);
		in->reset(reset);
		in->in_data(in_data);
		in->out_q(b);
		in->wr_en(wr_en);

		m1 = new multiplier("m1");
		m1->a(b);
		m1->b(c);
		m1->mult(mult);

		a1 = new adder("a1");
		a1->a(d_in);
		a1->b(mult);
		a1->sum(sum);

		out = new out_dff("out");
		out->clock(clock);
		out->reset(reset);
		out->in_data(sum);
		out->out_q(d_out);
		out->wr_en(out_wr_en);

/*		dff3 dff("IN DFF");
		//sensitive << clock.pos();*/
	}
};


