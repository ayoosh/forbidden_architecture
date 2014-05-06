del machine_code.txt
del reference.txt
del inversek2j_npu_1value.coe
del inversek2j_npu_1value.txt
perl ..\..\..\Assembler\cpu\assembler_for_cpu.pl inversek2j_npu_1value.pl
rename machine_code.txt inversek2j_npu_1value.coe
rename reference.txt inversek2j_npu_1value.txt
REM rename machine_code.txt Img_commanded_Show.coe