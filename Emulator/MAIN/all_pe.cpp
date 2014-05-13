#define SC_INCLUDE_FX
#include "systemc.h"
#include "fixed_pe.cpp"

#define WIDTH 16

SC_MODULE(all_pe) {
	sc_in<sc_fixed<WIDTH, 9, SC_RND> > in_data1, in_data2, in_data3, in_data4, in_data5, in_data6, in_data7, in_data8;
	sc_in<sc_fixed<WIDTH, 9, SC_RND> > w1, w2, w3, w4, w5, w6, w7, w8;
	sc_in<sc_fixed<3*WIDTH, 34, SC_RND> > d_in;
	sc_out<sc_fixed<3*WIDTH, 34, SC_RND> > d_out;
	sc_in<bool> clock;
        sc_in<bool> reset;
        sc_in<bool> wr_en1, wr_en2, wr_en3, wr_en4, wr_en5, wr_en6, wr_en7, wr_en8;
        sc_in<bool> out_wr_en;
	
	processing_element *pe1;
	processing_element *pe2;
	processing_element *pe3;
	processing_element *pe4;
	processing_element *pe5;
	processing_element *pe6;
	processing_element *pe7;
	processing_element *pe8;

//	sc_signal<sc_fixed<3*WIDTH, 34, SC_RND> > dout1, dout2, dout3, dout4, dout5, dout6, dout7;
	sc_inout<sc_fixed<3*WIDTH, 34, SC_RND> > dout1, dout2, dout3, dout4, dout5, dout6, dout7;
	SC_CTOR(all_pe) {
		pe1 = new processing_element ("pe1");
		pe1->in_data(in_data1);
                pe1->d_out(dout1);
                pe1->c(w1);
                pe1->d_in(d_in);
                pe1->clock(clock);
                pe1->reset(reset);
                pe1->wr_en(wr_en1);
                pe1->out_wr_en(out_wr_en);

		pe2 = new processing_element ("pe2");
		pe2->in_data(in_data2);
                pe2->d_out(dout2);
                pe2->c(w2);
                pe2->d_in(dout1);
                pe2->clock(clock);
                pe2->reset(reset);
                pe2->wr_en(wr_en2);
                pe2->out_wr_en(out_wr_en);
	
		pe3 = new processing_element ("pe3");
		pe3->in_data(in_data3);
                pe3->d_out(dout3);
                pe3->c(w3);
                pe3->d_in(dout2);
                pe3->clock(clock);
                pe3->reset(reset);
                pe3->wr_en(wr_en3);
                pe3->out_wr_en(out_wr_en);	

		pe4 = new processing_element ("pe4");
                pe4->in_data(in_data4);
                pe4->d_out(dout4);
                pe4->c(w4);
                pe4->d_in(dout3);
                pe4->clock(clock);
                pe4->reset(reset);
                pe4->wr_en(wr_en4);
                pe4->out_wr_en(out_wr_en);

		pe5 = new processing_element ("pe5");
                pe5->in_data(in_data5);
                pe5->d_out(dout5);
                pe5->c(w5);
                pe5->d_in(dout4);
                pe5->clock(clock);
                pe5->reset(reset);
                pe5->wr_en(wr_en5);
                pe5->out_wr_en(out_wr_en);

		pe6 = new processing_element ("pe6");
                pe6->in_data(in_data6);
                pe6->d_out(dout6);
                pe6->c(w6);
                pe6->d_in(dout5);
                pe6->clock(clock);
                pe6->reset(reset);
                pe6->wr_en(wr_en6);
                pe6->out_wr_en(out_wr_en);

		pe7 = new processing_element ("pe7");
                pe7->in_data(in_data7);
                pe7->d_out(dout7);
                pe7->c(w7);
                pe7->d_in(dout6);
                pe7->clock(clock);
                pe7->reset(reset);
                pe7->wr_en(wr_en7);
                pe7->out_wr_en(out_wr_en);

		pe8 = new processing_element ("pe8");
                pe8->in_data(in_data8);
                pe8->d_out(d_out);
                pe8->c(w8);
                pe8->d_in(dout7);
                pe8->clock(clock);
                pe8->reset(reset);
                pe8->wr_en(wr_en8);
                pe8->out_wr_en(out_wr_en);
	}
};
