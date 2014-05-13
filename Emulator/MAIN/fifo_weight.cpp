#define SC_INCLUDE_FX
#include <systemc.h>

# define FIFO_DEPTH 8192

// Global variable

// NOTE - FIFO values to be written statically before it can start - limit is 1000 can be changed
float fifo_weight_data_wr[1000];
float fifo_weight_data_rd;

SC_MODULE(weight_fifo) {
  
  sc_in_clk clock;
  sc_in<bool> reset;
  sc_in<bool> rd_en;
  sc_in<bool> wr_en;
  sc_out<sc_fixed<16, 9, SC_RND> > weight_rd_data;

  void m_drain_packets(void);
  void t_source1(void);
  // Constructor

 sc_fifo<float> packet_fifo;
 // sc_fifo<sc_fixed <16,9,SC_RND> > packet_fifo;
  SC_CTOR(weight_fifo) : packet_fifo (FIFO_DEPTH) {

    SC_METHOD(m_drain_packets);
  //  sensitive << reset;
    sensitive << clock.pos();    
// Synchronous reset

    SC_THREAD(t_source1);
    sensitive << clock.pos(); 

    // Size the packet_fifo to 5 ints.
  //  sc_fifo<int> packet_fifo (FIFO_DEPTH);
  }
  
  // Declare the FIFO
 // sc_fifo<int> packet_fifo;
};

void weight_fifo::m_drain_packets(void) {
  if (reset.read() == 1) {
      // Reset FIFO - by reading all values
   while (packet_fifo.nb_read(fifo_weight_data_rd)) { }
   
    } else if (rd_en.read() == 1) {

  if (packet_fifo.nb_read(fifo_weight_data_rd)) {
    std::cout << sc_time_stamp() << ": weight fifo m_drain_packets(): Received " << fifo_weight_data_rd  << std::endl;
    // Convert to fixed 16 bit data
    weight_rd_data.write(fifo_weight_data_rd);
    // Write the same value to FIFO bcos circular buffer
    packet_fifo.nb_write(fifo_weight_data_rd);

  } else {
    std::cout << sc_time_stamp() << " weight fifo ERROR: m_drain_packets(): FIFO empty." << std::endl;
  }
	}

}

void weight_fifo::t_source1(void) {
  int val = 0;
  while(true) {  // Infinite loop for thread
        
    wait();

     if (reset.read() == 1) {
      // Reset FIFO

   
    } else if (wr_en.read() == 1) {

  if (packet_fifo.nb_write(fifo_weight_data_wr[val])) {
    std::cout << sc_time_stamp() << ": weight fifo t_thread1(): Wrote " << fifo_weight_data_wr[val] << std::endl;
    val++;
  } else {
    std::cout << sc_time_stamp() << " weight fifo ERROR: t_thread1(): FIFO Full." << std::endl;
  }
	}
  }
}

