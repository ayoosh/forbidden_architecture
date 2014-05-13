#define SC_INCLUDE_FX
#include <systemc.h>

# define ACCUM_FIFO_DEPTH 2048

// Global variable

// NOTE - FIFO values to be written statically before it can start - limit is 1000 can be changed
double fifo_accum_data_rd;



SC_MODULE(accum_fifo) {
  
  sc_in_clk clock;
  sc_in<bool> reset;
  sc_in<bool> rd_en;
  sc_in<bool> wr_en;
  sc_in<sc_fixed<48, 34, SC_RND> > accum_fifo_in_data;
  sc_out<sc_fixed<48, 34, SC_RND> > accum_rd_data;

  void m_drain_packets(void);
  void t_source1(void);
  // Constructor

 sc_fifo<double> packet_fifo;
 // sc_fifo<sc_fixed <16,9,SC_RND> > packet_fifo;
  SC_CTOR(accum_fifo) : packet_fifo (ACCUM_FIFO_DEPTH) {

    SC_METHOD(m_drain_packets);
  //  sensitive << reset;
    sensitive << clock.pos();    
// Synchronous reset

    SC_THREAD(t_source1);
    sensitive << clock.pos(); 

  }
  
  // Declare the FIFO
 // sc_fifo<int> packet_fifo;
};

void accum_fifo::m_drain_packets(void) {
  if (reset.read() == 1) {
      // Reset FIFO - by reading all values
   while (packet_fifo.nb_read(fifo_accum_data_rd)) { }
   
    } else if (rd_en.read() == 1) {

  if (packet_fifo.nb_read(fifo_accum_data_rd)) {
    // Reading as double and converting to fixed 48 bit since reading 48 fixed not supported
    accum_rd_data.write(fifo_accum_data_rd);

    std::cout << sc_time_stamp() << ": accum fifo m_drain_packets(): Received " << fifo_accum_data_rd  << std::endl;

  } else {
    std::cout << sc_time_stamp() << " accum fifo ERROR: m_drain_packets(): FIFO empty." << std::endl;
  }
	}

}

void accum_fifo::t_source1(void) {
  int val = 0;
  while(true) {  // Infinite loop for thread
        
    wait();

     if (reset.read() == 1) {
      // Reset FIFO
   
    } else if (wr_en.read() == 1) {

  if (packet_fifo.nb_write(accum_fifo_in_data.read())) {
    std::cout << sc_time_stamp() << ": accum fifo t_thread1(): Wrote " << accum_fifo_in_data.read() << std::endl;
    val++;
  } else {
    std::cout << sc_time_stamp() << " accum fifo ERROR: t_thread1(): FIFO Full." << std::endl;
  }
	}
  }
}

