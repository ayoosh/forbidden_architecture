del machine_code.txt
del ImgDisplay.coe
perl ..\Assembler\cpu\assembler_for_cpu.pl Bootloader.txt 0x00000000
rename machine_code.txt ImgDisplay.coe