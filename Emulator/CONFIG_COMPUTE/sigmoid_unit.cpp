#define SC_INCLUDE_FX
#include <systemc.h>
#include "sigmoid_16_dff.cpp"
#include "sigmoid_dff.cpp"

SC_MODULE(sigmoid_unit) {
	sc_in<bool> sigmoid_funct_1, sigmoid_funct_2;
	sc_in<sc_fixed<48, 34, SC_RND> > sigmoid_in;
	sc_in<bool> sigmoid_en;
	sc_in<bool> wr_en;
	sc_out<sc_fixed<16, 9, SC_RND> > sigmoid_out;
	sc_in<bool> clock, reset;

	sigmoid_dff *ff1;
	sigmoid_16_dff *ff2;
	sigmoid_16_dff *ff3;
	
	sc_signal<sc_fixed<16, 9, SC_RND> > ff1_out, ff2_out;
//	bool wr_en = 1; 
	SC_CTOR(sigmoid_unit) {
		ff1 = new sigmoid_dff ("sigmoid_1");
		ff1->clock(clock);
                ff1->reset(reset);
                ff1->in_data(sigmoid_in);
                ff1->out_q(ff1_out);
                ff1->wr_en(sigmoid_en);
		ff1->sigmoid_funct_1(sigmoid_funct_1);
		ff1->sigmoid_funct_2(sigmoid_funct_2);
	
		ff2 = new sigmoid_16_dff ("sigmoid_2");
		ff2->clock(clock);
                ff2->reset(reset);
                ff2->in_data(ff1_out);
                ff2->out_q(ff2_out);
		ff2->wr_en(wr_en);
  //              ff2->wr_en(wr_en);

		ff3 = new sigmoid_16_dff ("sigmoid_3");
		ff3->clock(clock);
                ff3->reset(reset);
                ff3->in_data(ff2_out);
                ff3->out_q(sigmoid_out);
		ff3->wr_en(wr_en);
  //              ff3->wr_en(wr_en);

	}
};
