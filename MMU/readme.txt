In this folder we have the sample MIG files for testing the DDR2 SDRAM on our FPGA. The important files in which changes were done are:
1. mig_new.ucf (Updated the pin locations).
2. ddr2_infrastructure (Changed IBUFG to BUFG for clk200_ibufg).
3. top_level.v: This is where we take differential clock as input and create a single ended clock using IBUFDS.