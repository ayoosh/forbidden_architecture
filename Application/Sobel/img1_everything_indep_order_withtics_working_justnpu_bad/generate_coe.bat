del machine_code.txt
del reference.txt
del img1_everything_indep_order_withtics.txt
del img1_everything_indep_order_withtics.coe
perl ..\..\..\Assembler\cpu\assembler_for_cpu.pl img1_everything_indep_order_withtics.pl
rename machine_code.txt img1_everything_indep_order_withtics.coe
rename reference.txt img1_everything_indep_order_withtics.txt