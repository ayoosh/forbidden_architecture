#define SC_INCLUDE_FX
#include "systemc.h"

#define WIDTH  16

SC_MODULE(multiplier) {
  sc_in<sc_fixed<WIDTH, 9, SC_RND> > a, b;  
  sc_out<sc_fixed<3*WIDTH, 34, SC_RND> > mult;

  void do_mult() {
    mult.write(a.read() * b.read());
//	cout << "@" << sc_time_stamp() << ":: value of mult is " << mult.read() << endl;
	next_trigger(0.5, SC_NS);
  }

  SC_CTOR(multiplier)       {
    SC_METHOD(do_mult);   
    sensitive << a << b; 
  }
};

/*int sc_main(int argc, char* argv[]) {
	sc_signal<sc_uint <WIDTH> > a, b;
	sc_signal<sc_uint <2*WIDTH> > mult;
	
	multiplier multiplier("MULTIPLIER");
		multiplier.a(a);
		multiplier.b(b);
		multiplier.mult(mult);
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
