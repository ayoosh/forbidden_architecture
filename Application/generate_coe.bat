del machine_code.txt
del Sobel_1img_full.coe
perl ..\Assembler\cpu\assembler_for_cpu.pl Sobel_1img_full.txt 0x04000000
rename machine_code.txt Sobel_1img_full.coe