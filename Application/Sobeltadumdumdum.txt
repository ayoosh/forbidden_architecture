# Set Stack Pointer ;
LLW R1 0xFFFF ;
LHW R1 0x020F ;

# Get inputs from SPART and store them to DDR
# R2 - SPART Address
# R3 -  SPART Status address
# R4 - SPART Read Mask
# R5 - SPART Write Mask / 1
# R6 - Number of pixels in the image.
# R7 - Message sent to SPART to receive the data.
# R8 - Value read from SPART status register.
# R9 - Value received through SPART.
# R10 - Offset from the base address.
# R11 - Base address of the set of locations where image will be stored.
# R12 - Stores the received pixel values. Has 4 8-bit gray scale values.
# R13 - Temporary storage for storing the masking operation results that have to be later stored in DDR2.
# R14 - Mask for transferring the gray scale image values from R12 to DDR2.
# R15 - Counter to keep track of number of pixel values (or bytes) sent from R12 to DDR2. Its value is fixed at 4.
# R16 - Output DDR Address

# Set the base address and offset to store image ;
LLW R11 0x0000 ;
# LHW R11 0x0000 ;
LLW R10 0x0000 ;

LLW R2 0x0000 ;
LHW R2 0x0800 ;

LLW R3 0x0001 ;
LHW R3 0x0800 ;

LLW R4 0x0002 ;
LLW R5 0x0001 ;
LLW R14 0x00FF ;

# Send the ASCII of character 'i'. When MATLAB
# detects this, it will start sending the image1.
LLW R7 0x0069 ;

# Number of pixels that will be received from MATLAB.
# Hex value of 640*480 = 307200 is 0x0004B000
# LLW R6 0xB000 ;
# LHW R6 0x0004 ;
# 640*480
LLW R6 0xB000 ;
LHW R6 0x0004 ;

IM1_SPART_TX_NOT_READY_1 LOAD R8 R3 0x00 ;
AND R0 R8 R5 ;
B EQ IM1_SPART_TX_NOT_READY_1 ;

STORE R7 R2 0x0000 ;

# ADD R31 R7 R5 ;
# CALL SPART_SEND ;

# Start receiving image pixel values.
IM1_GET_PIXEL LOAD R8 R3 0x00 ;
AND R0 R8 R4 ;
B EQ IM1_GET_PIXEL ;

# Receive a pixel from matlab and stored in Register R12
LOAD R12 R2 0x00 ;
LLW R15 0x0004 ;
IM1_SEND_PIXELS_TO_DDR2 AND R13 R12 R14 ;
ADD R16 R11 R10 ;
STORE R13 R16 0x0000 ;

# After the pixel value has been stored in DDR2
# do logical right shift on R12 by 8-bits to get the next pixel value.
SRL R12 R12 8 ;

# Increment address offset
ADD R10 R10 R5 ;

# # Decrement image pixel counter
# SUB R6 R6 R5 ;

# If the value of R15 is not zero then keep doing the mask and shift
# operations to send 8-bit gray image pixel values to DDR2.
SUB R15 R15 R5 ;
B GT IM1_SEND_PIXELS_TO_DDR2 ;

# If value of image pixel counter is not zero then
# keep checking spart status register for more image
# pixels from MATLAB.

SUB R0 R10 R6 ;
B LT IM1_GET_PIXEL ;
# Image storage done

# #################################################33
# Now make copies of the image
# Skipping for now. Let the edges be fringed big deal, if you have a problem talk to the HAND of the king

# #################################################3
# Now start Algo part

# Tic Counter Reset
# LLW R2 0x0006 ;
# LHW R2 0x0800 ;
# STORE R0 R2 0x00 ; 

# R2 Input image start addr
# R3 Output Image Algo start addr
# R4 Row Limiter
# R5 Column limiter
# R6 Row iterator
# R7 Column Iterator
# R8 Current Pixel output addr
# R9 Gx, G
# R10 Gy
# R11 Pixel 0,0 Addr 
# R12 Pixel 1,0 Addr
# R13 Pixel 2,0 Addr
# R14  640
# R15 Loaded input value
# R16 - R19  Temporaries
# R20 Partial Product
# R21 1
# R22 2
# R23 128
# R24 255

LLW R2 0x0000 ;
LLW R3 0x0000 ;
LHW R3 0x0040 ;
LLW R4 0x01DF ;
LLW R5 0x027F ;
LLW R6 0x0001 ;
LLW R7 0x0001 ;
LLW R20 0x0000 ;
LLW R21 0x0001 ;
LLW R22 0x0002 ;
LLW R14 0x0280 ;
LLW R23 0x0080 ;
LLW R24 0x00FF ;

# Start by updating addresses
SOBEL_IM1_ALGO MULT R8 R6 R14 ;
ADD R8 R8 R7 ;
ADD R12 R8 R2 ;
SUB R12 R12 R21 ;
ADD R13 R12 R14 ;
SUB R11 R12 R14 ;
ADD R8 R8 R3 ; # ALL Addresses updated

# Calculate Gx
LOAD R15 R11 0x0000 ;
ADD R0 R0 R0 ;
MULT R20 R15 R21 ;
SUB R9 R0 R20 ;

LOAD R15 R11 0x0002 ;
ADD R0 R0 R0 ;
MULT R20 R15 R21 ;
ADD R9 R9 R20 ;

LOAD R15 R12 0x0000 ;
ADD R0 R0 R0 ;
MULT R20 R15 R22 ;
SUB R9 R9 R20 ;

LOAD R15 R12 0x0002 ;
ADD R0 R0 R0 ;
MULT R20 R15 R22 ;
ADD R9 R9 R20 ;

LOAD R15 R13 0x0000 ;
ADD R0 R0 R0 ;
MULT R20 R15 R21 ;
SUB R9 R9 R20 ;

LOAD R15 R13 0x0002 ;
ADD R0 R0 R0 ;
MULT R20 R15 R21 ;
ADD R9 R9 R20 ;

# Calculate Gy
LOAD R15 R11 0x0000 ;
ADD R0 R0 R0 ;
MULT R20 R15 R21 ;
ADD R10 R0 R20 ;

LOAD R15 R11 0x0001 ;
ADD R0 R0 R0 ;
MULT R20 R15 R22 ;
ADD R10 R10 R20 ;

LOAD R15 R11 0x0002 ;
ADD R0 R0 R0 ;
MULT R20 R15 R21 ;
ADD R10 R10 R20 ;

LOAD R15 R13 0x0000 ;
ADD R0 R0 R0 ;
MULT R20 R15 R21 ;
SUB R10 R10 R20 ;

LOAD R15 R13 0x0001 ;
ADD R0 R0 R0 ;
MULT R20 R15 R22 ;
SUB R10 R10 R20 ;

LOAD R15 R13 0x0002 ;
ADD R0 R0 R0 ;
MULT R20 R15 R21 ;
SUB R10 R10 R20 ;

# Calculate G
ADD R0 R0 R0 ;
MULT R9 R9 R9 ;
ADD R0 R0 R0 ;
MULT R10 R10 R10 ;
ADD R0 R0 R0 ;
ADD R9 R9 R10 ;
ADD R0 R0 R0 ;
ITOF R9 R9 ;
ITOF R0 R0 ;
ADD R0 R0 R0 ;
ADD R0 R0 R0 ;
ADD R0 R0 R0 ;
SQRT R9 R9 ;
SQRT R0 R0 ;
ADD R0 R0 R0 ;
ADD R0 R0 R0 ;
FTOI R9 R9 ;
FTOI R0 R0 ;
ADD R0 R0 R0 ;

SUB R0 R9 R23 ;
B LT SOBEL_IM1_ALGO_0 ;
STORE R24 R8 0x00 ;
B UNCOND SOBEL_IM1_ALGO_255 ;
SOBEL_IM1_ALGO_0 STORE R0 R8 0x00 ;

# Increment iterators and jumps ;
SOBEL_IM1_ALGO_255 ADD R7 R7 R21 ;
SUB R0 R7 R5 ;
B LT SOBEL_IM1_ALGO ;
ADD R7 R0 R21 ;
ADD R6 R6 R21 ;
SUB R0 R6 R4 ;
B LT SOBEL_IM1_ALGO ;

# Tic Counter store value
# LLW R2 0x0006 ;
# LHW R2 0x0800 ;
# LOAD R3 R2 0x00 ;
# LLW R2 0x3000 ;
# LHW R2 0x00C0 ;
# STORE R3 R2 0x00 ;

# Sobel Algo ends for Image 1 !!!!!
# ###################################################################

# ###################################################################
# Sobel NPU For Image 1
# Tic Counter Reset
# LLW R2 0x0006 ;
# LHW R2 0x0800 ;
# STORE R0 R2 0x00 ; 

# R2 Input image start addr
# R3 Output Image Algo start addr
# R4 Row Limiter
# R5 Column limiter
# R6 Row iterator
# R7 Column Iterator
# R8 Current Pixel output addr
# R11 Pixel 0,0 Addr 
# R12 Pixel 1,0 Addr
# R13 Pixel 2,0 Addr
# R14  640
# R16 Dequed output value
# R21 1
# R22 - R30 Inputs


LLW R2 0x0000 ;
LLW R3 0x0000 ;
LHW R3 0x0060 ;
LLW R4 0x01DF ;
LLW R5 0x027F ;
LLW R6 0x0001 ;
LLW R7 0x0001 ;
LLW R14 0x0280 ;
LLW R20 0x0000 ;
LLW R21 0x0001 ;


# Start by updating addresses
SOBEL_IM1_NPU MULT R8 R7 R14 ;
ADD R8 R8 R6 ;
ADD R12 R8 R2 ;
SUB R12 R12 R21 ;
ADD R13 R12 R14 ;
SUB R11 R12 R14 ;
ADD R8 R8 R3 ; # ALL Addresses updated


LOAD R22 R11 0x0000 ;
LOAD R23 R12 0x0000 ;
LOAD R24 R13 0x0000 ;
LOAD R25 R11 0x0001 ;
LOAD R26 R12 0x0001 ;
LOAD R27 R13 0x0001 ;
LOAD R28 R11 0x0002 ;
LOAD R29 R12 0x0002 ;
LOAD R30 R13 0x0002 ;

ENQD0 R22 ;
ENQD0 R23 ;
ENQD0 R24 ;
ENQD0 R25 ;
ENQD0 R26 ;
ENQD0 R27 ;
ENQD0 R28 ;
ENQD0 R29 ;
ENQD0 R30 ;

DEQD0 R16 ;

SUB R0 R16 R17 ;
B LT SOBEL_IM1_NPU_0 ;
STORE R18 R8 0x00 ;
B UNCOND SOBEL_IM1_NPU_255 ;
SOBEL_IM1_NPU_0 STORE R0 R8 0x00 ;

# Increment iterators and jumps
SOBEL_IM1_NPU_255 ADD R7 R7 R21 ;
SUB R0 R7 R5 ;
B LT SOBEL_IM1_NPU ;
ADD R7 R0 R21 ;
ADD R6 R6 R21 ;
SUB R0 R6 R4 ;
B LT SOBEL_IM1_NPU ;

# Tic Counter store value
# LLW R2 0x0006 ;
# LHW R2 0x0800 ;
# LOAD R3 R2 0x00 ;
# LLW R2 0x3001 ;
# LHW R2 0x00C0 ;
# STORE R3 R2 0x00 ;



# ############################################
COMMAND_TX LLW R2 0x0000 ;
LHW R2 0x0800 ;

LLW R3 0x0001 ;
LHW R3 0x0800 ;

LLW R4 0x0002 ;
LLW R5 0x0001 ;

LOAD R6 R3 0x00 ;
AND R0 R6 R5 ;
B EQ COMMAND_TX ;
LLW R6 0x0064 ;
STORE R6 R2 0x0000 ;

COMMAND_GET LOAD R6 R3 0x00 ;
AND R0 R6 R4 ;
B EQ COMMAND_GET ;
LOAD R6 R2 0x0000 ;

# Insert all comparisons to display different things
LLW R7 0x0073 ;
SUB R0 R6 R7 ;
B EQ SHOW_ORIGINAL ;

LLW R7 0x0074 ;
SUB R0 R6 R7 ;
B EQ SHOW_ALGO ;

LLW R7 0x0075 ;
SUB R0 R6 R7 ;
B EQ SHOW_NPU ;

# If not matches anything just jump to getting commands
B UNCOND COMMAND_GET ;

# #################################################################################################################
SHOW_ORIGINAL ADD R0 R0 R0 ;
# FLUSH ;

LLW R2 0x0000 ;
LHW R2 0x0000 ;

LLW R3 0x0001 ;

LLW R4 0x0004 ;
LHW R4 0x0800 ;

LLW R5 0x0005 ;
LHW R5 0x0800 ;

STORE R2 R4 0x00 ;
ADD R0 R0 R0 ;
STORE R3 R5 0x00 ;
B UNCOND COMMAND_GET ;

# ###############3

SHOW_ALGO ADD R0 R0 R0 ;
# FLUSH ;

LLW R2 0x0000 ;
LHW R2 0x0040 ;

LLW R3 0x0001 ;

LLW R4 0x0004 ;
LHW R4 0x0800 ;

LLW R5 0x0005 ;
LHW R5 0x0800 ;

STORE R2 R4 0x00 ;
ADD R0 R0 R0 ;
STORE R3 R5 0x00 ;
B UNCOND COMMAND_GET ;

# ########################

SHOW_NPU ADD R0 R0 R0 ;
# FLUSH ;

LLW R2 0x0000 ;
LHW R2 0x0060 ;

LLW R3 0x0001 ;

LLW R4 0x0004 ;
LHW R4 0x0800 ;

LLW R5 0x0005 ;
LHW R5 0x0800 ;

STORE R2 R4 0x00 ;
ADD R0 R0 R0 ;
STORE R3 R5 0x00 ;
B UNCOND COMMAND_GET ;
# ###################