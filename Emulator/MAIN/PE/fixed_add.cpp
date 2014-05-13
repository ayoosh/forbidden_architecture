#define SC_INCLUDE_FX
#include "systemc.h"

#define WIDTH  16

SC_MODULE(adder) {
  sc_in<sc_fixed<3*WIDTH, 34, SC_RND> > a, b;  
  sc_out<sc_fixed<3*WIDTH, 34, SC_RND> > sum;

  void do_add() {
    sum.write(a.read() + b.read());
//	cout << "@" << sc_time_stamp() << ":: value of sum is " << sum.read() << endl;
	next_trigger(0.5, SC_NS);
  }

  SC_CTOR(adder)       {
    SC_METHOD(do_add);   
    sensitive << a << b; 
  }
};

/*int sc_main(int argc, char* argv[]) {
	sc_signal<sc_uint <WIDTH> > a, b;
	sc_signal<sc_uint <WIDTH> > sum;
	
	adder adder("ADDER");
		adder.a(a);
		adder.b(b);
		adder.sum(sum);
	sc_start (1, SC_NS);
	a = 1;
	sc_start (1, SC_NS);
	cout << "@" << sc_time_stamp() << ":: setting value of a as " << a.read() << endl;
	a = 2;	
	sc_start (1, SC_NS);
	cout << "@" << sc_time_stamp() << ":: setting value of a as " << a.read() << endl;
	a = 3;
	sc_start (1, SC_NS);
	cout << "@" << sc_time_stamp() << ":: setting value of a as " << a.read() << endl;
	b = 4;
	sc_start (1, SC_NS);
	cout << "@" << sc_time_stamp() << ":: setting value of b as " << b.read() << endl;
	a = 5;
	sc_start (1, SC_NS);
	cout << "@" << sc_time_stamp() << ":: setting value of a as " << a.read() << endl;
	a = 1;
	sc_start (1, SC_NS);
	sc_start (1, SC_NS);
	return 0;
}*/
