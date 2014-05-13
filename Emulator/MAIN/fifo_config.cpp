#define SC_INCLUDE_FX
#include <systemc.h>

# define CONFIG_FIFO_DEPTH 8

// Global variable

// NOTE - FIFO values to be written statically before it can start - limit is 1000 can be changed
int fifo_config_data_wr[3000];
int fifo_config_data_rd;

SC_MODULE(config_fifo) {
  
  sc_in_clk clock;
  sc_in<bool> reset;
  sc_in<bool> rd_en;
  sc_in<bool> wr_en;

  void m_drain_packets(void);
  void t_source1(void);
  // Constructor

 sc_fifo<int> packet_fifo;
 // sc_fifo<sc_fixed <16,9,SC_RND> > packet_fifo;
  SC_CTOR(config_fifo) : packet_fifo (CONFIG_FIFO_DEPTH) {

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

void config_fifo::m_drain_packets(void) {
  if (reset.read() == 1) {
      // Reset FIFO - by reading all values
   while (packet_fifo.nb_read(fifo_config_data_rd)) { }
   
    } else if (rd_en.read() == 1) {

  if (packet_fifo.nb_read(fifo_config_data_rd)) {
    std::cout << sc_time_stamp() << ": config fifo m_drain_packets(): Received " << fifo_config_data_rd  << std::endl;

  } else {
    std::cout << sc_time_stamp() << " config fifo ERROR: m_drain_packets(): FIFO empty." << std::endl;
  }
	}

}

void config_fifo::t_source1(void) {
  int val = 0;
  while(true) {  // Infinite loop for thread
        
    wait();

     if (reset.read() == 1) {
      // Reset FIFO
   
    } else if (wr_en.read() == 1) {

  if (packet_fifo.nb_write(fifo_config_data_wr[val])) {
    std::cout << sc_time_stamp() << ": config fifo t_thread1(): Wrote " << fifo_config_data_wr[val] << std::endl;
    val++;
  } else {
    std::cout << sc_time_stamp() << " config fifo ERROR: t_thread1(): FIFO Full." << std::endl;
  }
	}
  }
}

