#define SC_INCLUDE_FX
#include <systemc.h>

# define OFFSET_FIFO_DEPTH 512

// Global variable

// NOTE - FIFO values to be written statically before it can start - limit is 1000 can be changed
float fifo_offset_data_wr[3000];
float fifo_offset_data_rd;



SC_MODULE(offset_fifo) {
  
  sc_in_clk clock;
  sc_in<bool> reset;
  sc_in<bool> rd_en;
  sc_in<bool> wr_en;
  sc_out<sc_fixed<48, 34, SC_RND> > offset_rd_data;



  void m_drain_packets(void);
  void t_source1(void);
  // Constructor

 sc_fifo<float> packet_fifo;
 // sc_fifo<sc_fixed <16,9,SC_RND> > packet_fifo;
  SC_CTOR(offset_fifo) : packet_fifo (OFFSET_FIFO_DEPTH) {

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

void offset_fifo::m_drain_packets(void) {
  if (reset.read() == 1) {
      // Reset FIFO - by reading all values
   while (packet_fifo.nb_read(fifo_offset_data_rd)) { }
   
    } else if (rd_en.read() == 1) {

  if (packet_fifo.nb_read(fifo_offset_data_rd)) {
    std::cout << sc_time_stamp() << ": offset fifo m_drain_packets(): Received " << fifo_offset_data_rd  << std::endl;
    // Convert the value to fixed representation
    offset_rd_data.write(fifo_offset_data_rd);
    // Write the same value to FIFO bcos circular buffer
    packet_fifo.nb_write(fifo_offset_data_rd);

  } else {
    std::cout << sc_time_stamp() << " offset fifo ERROR: m_drain_packets(): FIFO empty." << std::endl;
  }
	}

}

void offset_fifo::t_source1(void) {
  int val = 0;
  while(true) {  // Infinite loop for thread
        
    wait();

     if (reset.read() == 1) {
      // Reset FIFO

   
    } else if (wr_en.read() == 1) {

  if (packet_fifo.nb_write(fifo_offset_data_wr[val])) {
    std::cout << sc_time_stamp() << ": offset fifo t_thread1(): Wrote " << fifo_offset_data_wr[val] << std::endl;
    val++;
  } else {
    std::cout << sc_time_stamp() << " offset fifo ERROR: t_thread1(): FIFO Full." << std::endl;
  }
	}
  }
}

