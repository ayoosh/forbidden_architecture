del machine_code.txt
del reference.txt
del Sobel_1img_Final_50mhz.txt
del Sobel_1img_Final_50mhz.coe
perl ..\..\..\Assembler\cpu\assembler_for_cpu.pl Sobel_1img_Final_50mhz.pl
rename machine_code.txt Sobel_1img_Final_50mhz.coe
rename reference.txt Sobel_1img_Final_50mhz.txt