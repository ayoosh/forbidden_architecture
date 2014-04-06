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

int sc_main(int argc, char* argv[]) {
	sc_signal<sc_fixed<WIDTH, 9, SC_RND> > in_data1, in_data2, in_data3, in_data4, in_data5, in_data6, in_data7, in_data8;
        sc_signal<sc_fixed<WIDTH, 9, SC_RND> > w1, w2, w3, w4, w5, w6, w7, w8;
        sc_signal<sc_fixed<3*WIDTH, 34, SC_RND> > d_in;
        sc_signal<sc_fixed<3*WIDTH, 34, SC_RND> > d_out;
        sc_signal<bool> clock;
        sc_signal<bool> reset;
        sc_signal<bool> wr_en1, wr_en2, wr_en3, wr_en4, wr_en5, wr_en6, wr_en7, wr_en8;
        sc_signal<bool> out_wr_en;
	sc_signal<sc_fixed<3*WIDTH, 34, SC_RND> > dout1, dout2, dout3, dout4, dout5, dout6, dout7;

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
		all_pes.d_out(d_out);
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
	
	int i = 0;
	reset = 1;
	cout << "@" << sc_time_stamp() << "::Asserting reset" << endl;
	for(i = 0; i < 1; i++) {
		clock = 0;
                sc_start(1, SC_NS);
                clock = 1;
                sc_start(1, SC_NS);
        }
	
	reset = 0;
	
cout << "@" << sc_time_stamp() << "::Deasserting reset" << endl;
	for(i = 0; i < 1; i++) {
                clock = 0;
                sc_start(1, SC_NS);
                clock = 1;
                sc_start(1, SC_NS);
        }
	out_wr_en = 1;	
	wr_en1 = 1;
	in_data1 = 2;

	for(i = 0; i < 1; i++) {
                clock = 0;
                sc_start(1, SC_NS);
                clock = 1;
                sc_start(1, SC_NS);
        }
	wr_en1 = 0;
	wr_en2 = 1;
        in_data2 = 3;
	w1 = 3.5;
	d_in = 10;
	w2 = w3 = w4 = w5 = w6 = w7 = w8 = 0;
	for(i = 0; i < 1; i++) {
		clock = 0;
                sc_start(1, SC_NS);
                clock = 1;
                sc_start(1, SC_NS);
        }
	
	wr_en2 = 0;
	wr_en3 = 1;
	in_data3 = 3;
	d_in = 20;
	w1 = 3;
	w2 = 2;
	w3 = w4 = w5 = w6 = w7 = w8 = 0;
	for(i = 0; i < 1; i++) {
		clock = 0;
		sc_start(1, SC_NS);
                clock = 1;
                sc_start(1, SC_NS);
        }

	wr_en3 = 0;
	wr_en4 = 1;
	in_data4 = 2;
	d_in = 10;
	w1 = 1;
	w2 = 1;
	w3 = 3;
	w4 = w5 = w6 = w7 = w8 = 0;
	for(i = 0; i < 1; i++) {
                clock = 0;
                sc_start(1, SC_NS);
                clock = 1;
                sc_start(1, SC_NS);
        }
	wr_en4 = 0;
	wr_en5 = 1;
        in_data5 = 2;
        d_in = 10;
        w1 = 1;
        w2 = 1;
        w3 = 1;
	w4 = 3;
	w5 = w6 = w7 = w8 = 0;
	for(i = 0; i < 1; i++) {
                clock = 0;
                sc_start(1, SC_NS);
                clock = 1;
                sc_start(1, SC_NS);
        }
	wr_en5 = 0;
        wr_en6 = 1;
        in_data6 = 2;
        d_in = 10;
        w1 = 1;
        w2 = 1;
        w3 = 1;
        w4 = 1;
	w5 = 3;
	w6 = w7 = w8 = 0;
	for(i = 0; i < 1; i++) {
                clock = 0;
                sc_start(1, SC_NS);
                clock = 1;
                sc_start(1, SC_NS);
        }
	wr_en6 = 0;
        wr_en7 = 1;
        in_data7 = 2;
        d_in = 10;
        w1 = 1;
        w2 = 1;
        w3 = 1;
        w4 = 1;
        w5 = 1;	
	w6 = 3;
	w7 = w8 = 0;
	for(i = 0; i < 1; i++) {
                clock = 0;
                sc_start(1, SC_NS);
                clock = 1;
                sc_start(1, SC_NS);
        }
	wr_en7 = 0;
        wr_en8 = 1;
        in_data8 = 2;
        d_in = 10;
        w1 = 1;
        w2 = 1;
        w3 = 1;
        w4 = 1;
        w5 = 1;
        w6 = 1;
	w7 = 3;
        w8 = 0;
	for(i = 0; i < 1; i++) {
                clock = 0;
                sc_start(1, SC_NS);
                clock = 1;
                sc_start(1, SC_NS);
        }
	wr_en8 = 0;
	d_in = 0;
	w1 = 1;
        w2 = 1;
        w3 = 1;
        w4 = 1;
        w5 = 1;
        w6 = 1;
        w7 = 1;
	w8 = 3;
	for(i = 0; i < 2; i++) {
                clock = 0;
                sc_start(1, SC_NS);
                clock = 1;
                sc_start(1, SC_NS);
        }
cout << "@" << sc_time_stamp() << " dout1 value is : " << dout1 << endl;		
//cout << "@" << sc_time_stamp() << " dout2 value is : " << dout2 << endl;
//cout << "@" << sc_time_stamp() << " dout3 value is : " << dout3 << endl;
};
