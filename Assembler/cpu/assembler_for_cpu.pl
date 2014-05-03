use Switch;
#use Strict;

open(DATA, $ARGV[0]) or die "Can't open";
@string = <DATA>;

#start_address is in decimal......................................................
$start_address = hex($ARGV[1]);

open my $overwrite, '>>', 'machine_code.txt' or die "error trying to overwrite: $!";
open my $ref, '>>','reference.txt' or die "error  trying to overwrite: $!";

my @machine_code;

%operations = ( "ADD" => "000000", "SUB" => "000001", "LHW" =>"000010", "LLW" =>"000011",
                "AND" => "000100", "OR" => "000101", "XOR" =>"000110", "NOT" =>"000111",
                "SLL" => "001000", "SRL" => "001001", "SRA" =>"001010", "B" =>"010000",
                "CALL" => "010001", "RET" => "010010", "LOAD" =>"010100", "STORE" =>"010101",
                "MULT" => "010110", "DIV" => "010111", "FADD" =>"011000", "FSUB" =>"011001",
                "FMULT" => "011010", "FDIV" => "011011", "FTOI" =>"011100", "ITOF" =>"011101",
                "SQRT" => "011110", "HALT" => "011111","FLUSH"=> "001100",
                "ENQC0" => "100000", "ENQC1" => "101000", "ENQC2" => "110000", "ENQC3" => "111000",
                "DEQC0" => "100001", "DEQC1" => "101001", "DEQC2" => "110001", "DEQC3" => "111001",
                "ENQD0" => "100100", "ENQD1" => "101100", "ENQD2" => "110100", "ENQD3" => "111100",
                "DEQD0" => "100101", "DEQD1" => "101101", "DEQD2" => "110101", "DEQD3" => "111101");

%registers = ("R0" => "00000", "R1" => "00001", "R2" => "00010", "R3" => "00011","R4" => "00100","R5" => "00101","R6" => "00110","R7" => "00111", "R8" => "01000", "R9" => "01001","R10" => "01010", "R11" => "01011", "R12" => "01100", "R13" => "01101","R14" => "01110","R15" => "01111", "R16" => "10000","R17" => "10001","R18" => "10010","R19" => "10011","R20" => "10100","R21" => "10101","R22" => "10110","R23" => "10111","R24" => "11000","R25" => "11001", "R26" => "11010","R27" => "11011","R28" => "11110", "R29" => "11101", "R30" => "11110", "R31" => "11111");


%branch = ("NEQ"=>"000","EQ"=>"001","GT"=>"010","LT"=>"011","GTE"=>"100","LTE"=>"101","OVFL"=>"110","UNCOND"=>"111");
my %labels;

my $line_entries = 0;
my $line_count= @string;
my $line_number =0;
my $machine_code_line_number =0;

while($line_number<$line_count)
{
        $destination = "";
        @instruction = split(/ /,$string[$line_number]); #instruction holds each component of an instrucion

        $component_count = @instruction; #component_count holds the number of component in the instruction
        $current_entry = 0;

	print "Component count -- $component_count \n";	
	if(exists $operations{$instruction[0]})
        {
                $current_entry = 0;
        }

        elsif(($instruction[0] eq "#"))
	{
		$error = $line_number+1;
		print "Comment or blank space detected at line number $error\n\n";
		$line_number++;
		goto end; 
	}
	elsif(($component_count ==1)){
		$error = $line_number+1;
		print "Blank line detected \n\n";
		$line_number++;
		goto end;
	} 
	else  
        {
                $current_entry = 1;
                print "Key detected: $instruction[0] \n";
		$labels{"$instruction[0]"} = $machine_code_line_number;
        }

	$destination = "";
        $destination=("$operations{$instruction[$current_entry]}");
        
	unless(exists $operations{$instruction[$current_entry]}){
		$error = $line_number +1;
		die "Opcode doesn't exist --- Error at line number $error\n";
	}		
	

	$opcode = $instruction[$current_entry];
	switch($opcode) {
		# These opcodes follow same patterns
                case "ADD"  { append_1(); }
                case "SUB"  { append_1(); }
                case "OR"   { append_1(); }
                case "AND"  { append_1(); }
                case "XOR"  { append_1(); }
                case "FADD" { append_1(); }
                case "FSUB" { append_1(); }
                case "FMULT"{ append_1(); }
                case "FDIV" { append_1(); }
                case "MULT" { append_1(); }
                case "DIV"  { 
                    $error = $line_number + 1;
                	die "Division instruction at the line $error\n ";
                 }
		#Correct till here - expecte operands are 3---------------------------------------------------------------------------

                case "NOT"  { append_2(); }
		case "FTOI" { append_2(); }
		case "ITOF" { append_2(); }
		case "SQRT" { append_2(); }
		#expected operands are 2 -----------------------------------


                case "SLL"  { append_3(); }
                case "SRL"  { append_3(); }
                case "SRA"  { append_3(); }
		#expected offset in decimal-------------------------------------

		case "B"{ $result = $instruction[$current_entry]." ".$instruction[$current_entry+1]." ".$instruction[$current_entry+2]. " ".";"; }	
			
		case "CALL" { $result = $instruction[$current_entry]." ".$instruction[$current_entry+1]." ".";"}
		#expected address in hex---------------------------------------------------

		case "LOAD" { append_6(); }
		case "STORE" { append_6(); }
		#offsets in hex--------------------------------------------------------

		case "RET" { append_7(); }
		case "FLUSH" { append_7(); }		
		case "HALT" { 
            $error = $line_number + 1;
            die "HALT instruction at the line $error\n ";
        }
		#no operands needed------------------------------------------------------
		
		case "ENQC0" { append_5(); }
		case "ENQC1" { append_5(); }
		case "ENQC2" { append_5(); }
		case "ENQC3" { append_5(); }

		case "DEQC0" {append_9(); }
		case "DEQC0" {append_9(); }
		case "DEQC0" {append_9(); }
		case "DEQC0" {append_9(); }
		
		case "ENQD0" {append_9(); }
		case "ENQD1" {append_9(); }
		case "ENQD2" {append_9(); }
		case "ENQD3" {append_9(); }

		case "DEQD0" {append_9(); }
		case "DEQD1" {append_9(); }
		case "DEQD2" {append_9(); }
		case "DEQD3" {append_9(); }

		case "LHW" { append_10(); }
		case "LLW" { append_10(); }

	#needs 
	}

	print "Source is $string[$line_number]";	
	$machine_code[$machine_code_line_number] = $result;
        print "The machine code is $machine_code[$machine_code_line_number] \n \n";

	print $ref "$machine_code[$machine_code_line_number] --- ";

	@inst = split(/ /,$string[$line_number]);
	$acc = @inst ; 
	for($y=0;$y < $acc-1;$y = $y+1) {
		print $ref "$inst[$y] ";		
	}
	print $ref "\n";
	$line_number++;
	$machine_code_line_number++;
end:
}

print "End of phase 1 ....................................... \n";


$line_number = 0;
$line_count = $machine_code_line_number;

while($line_number < $machine_code_line_number){
	$destination = "";
        @instruction = split(/ /,$machine_code[$line_number]); #instruction holds each component of an instrucion

	#print "$instruction[0] --- $instruction[1] \n";
	unless(($instruction[0] eq "B") || ($instruction[0] eq "CALL")){
		$line_number++;	
	} 
	else{
		if($instruction[0] eq "B"){
			$destination = $operations{$instruction[0]}.$branch{$instruction[1]}."00";
			unless(exists $branch{$instruction[1]}){
				die "Incorrect condition to branch -- $instruction[1]\n";
			}
		
			unless(exists $labels{$instruction[2]}) {
				die "Invalid label or label doesn't exist--- $instruction[2]\n ";
			}
			$off = $labels{$instruction[2]}; 
			$offset = $off - $line_number-1;
			$dest = sprintf("%021b",$offset);
			if($offset>=0){	$destination = $destination.$dest;}
			else{ $destination = $destination.substr($dest, 43,21); }
			#print "$destination \n";
			print "$destination \n";
			$parameter = 7;
			convert();
			#print "$result\n\n\n";
			$machine_code[$line_number] = $result;
			$line_number++
		}
		else{
			 $destination = $operations{$instruction[0]};
			 unless(exists $labels{$instruction[1]}) {
                                die "Invalid label... $instruction[1]\n ";
                         }
			 $offset = $labels{$instruction[1]} + $start_address ;
			 $off = sprintf("%026b", $offset);
			 $destination = $destination.$off;
			 $parameter = 7;
	                 convert();
			 $machine_code[$line_number] = $result;
		                        $line_number++
		}	
	}
}

print "\n\n\n";
$counti = $#machine_code;
print $overwrite "memory_initialization_radix=16;\nmemory_initialization_vector=\n";

for $i(0..$counti){
	print $overwrite "$machine_code[$i],\n";
}

print $overwrite "00000000;";

sub append_1 {
	unless(exists $registers{$instruction[$current_entry+1]} && exists $registers{$instruction[$current_entry+2]} && exists $registers{$instruction[$current_entry+3]}){
	$error = $line_number + 1;
	die "Fatal error, Unexpected operands at line number $error \n";
}
	$destination = $destination.$registers{$instruction[$current_entry+1]};
        $destination = $destination.$registers{$instruction[$current_entry+2]};
        $destination = $destination.$registers{$instruction[$current_entry+3]}."00000000000";
	$parameter = 7;
	convert();
}



sub append_2 {
	unless(exists $registers{$instruction[$current_entry+1]} && exists $registers{$instruction[$current_entry+2]}){
        $error = $line_number + 1;
        die "Fatal error, Unexpected operands at line number $error \n";
}

        $destination = $destination.$registers{$instruction[$current_entry+1]};
        $destination = $destination.$registers{$instruction[$current_entry+2]}."0000000000000000";
	$parameter = 7;
	convert();
}


                                                                   
sub append_3 {
	$shift = $instruction[$current_entry+3] + 0.0 ;
	$error = $line_number + 1;
	print "Shift value is $shift \n";
	unless(($shift<=31) && ($shift>=0)){
		die "Fatal error - shift value out of range at line $error \n";
	} 
	unless(exists $registers{$instruction[$current_entry+1]} && exists $registers{$instruction[$current_entry+2]} && $shift<32){
        	die "Fatal error, Unexpected operands at line number $error \n";
	}
	$append = sprintf("%05b",$shift);
	$destination = $destination.$registers{$instruction[$current_entry+1]};
        $destination = $destination.$registers{$instruction[$current_entry+2]}."00000000000".$append;
	$parameter = 7;
	convert();
}

sub append_5{
	$hexi = hex($instruction[$current_entry+1]);
	$app = sprintf("%026b",$hexi); 
	$destination = $destination. $app;
	$parameter = 7;
	convert();

}	

sub append_6{
	unless(exists $registers{$instruction[$current_entry+1]} && exists $registers{$instruction[$current_entry+2]}){
        $error = $line_number + 1;
        die "Fatal error, Unexpected operands at $error \n";
}
	$destination = $destination.$registers{$instruction[$current_entry+1]}.$registers{$instruction[$current_entry+2]};
	$hexi = hex($instruction[$current_entry+3]);
        $app = sprintf("%016b",$hexi);
        $destination = $destination. $app;
        $parameter = 7;

	convert();
}

sub append_7{
	$upn = substr($instruction[$current_entry+1],0,1);
	unless(";" eq $upn ){
        $error = $line_number + 1;
        die "Fatal error, Unexpected operands at $error \n";
}
	$destination = $destination."00000000000000000000000000";
	$parameter= 7;
	convert();
}

sub append_9{
unless(exists $registers{$instruction[$current_entry+1]}){
        $error = $line_number + 1;
        die "Fatal error, Unexpected operands at $error \n";
}
	$destination = $destination.$registers{$instruction[$current_entry+1]}."000000000000000000000";
	$parameter = 7;
	convert();
}

sub append_10{
	unless(exists $registers{$instruction[$current_entry+1]}){
        	$error = $line_number + 1;
        	die "Fatal error, Unexpected operands at $error \n";
	}

        $destination = $destination.$registers{$instruction[$current_entry+1]}."00000";

        $hexi = hex($instruction[$current_entry+2]);
        $app = sprintf("%016b",$hexi);
        $destination = $destination. $app;
        $parameter = 7;
	convert();
}


sub convert{
        $result = "";

        for $j(0..$parameter)
        {
                $number = substr($destination, ($j*4), 4);
                switch($number)
                {
                case "0000" {   $result = $result."0"; }
                case "0001" {   $result = $result."1"; }
                case "0010" {   $result = $result."2"; }
                case "0011" {   $result = $result."3"; }
                case "0100" {   $result = $result."4"; }
                case "0101" {   $result = $result."5"; }
                case "0110" {   $result = $result."6"; }
                case "0111" {   $result = $result."7"; }
                case "1000" {   $result = $result."8"; }
                case "1001" {   $result = $result."9"; }
                case "1010" {   $result = $result."A"; }
                case "1011" {   $result = $result."B"; }
                case "1100" {   $result = $result."C"; }
                case "1101" {   $result = $result."D"; }
                case "1110" {   $result = $result."E"; }
                case "1111" {   $result = $result."F"; }
      		}
	}
	if( $parameter == 6) {
		$result= $result.substr($destination, 28,2);
	}
	if ($parameter == 0)
	{
		$dummy = substr($destination,4, 3);
		switch($dummy)
		{
		case "010" { $inter = "4"; }
		case "011" { $inter = "5"; }
		case "012" { $inter = "6"; }
		case "013" { $inter = "7"; }
		#call till here
		case "100" { $inter = "8"; }
		case "101" { $inter = "9"; }
		case "102" { $inter = "A"; }
		case "103" { $inter = "B"; }
		#return till here
		case "000" { $inter = "0"; }
		case "001" { $inter = "1"; }
		case "002" { $inter = "2"; }
		case "003" { $inter = "3"; }
		}
		$result = $result.$inter.substr($destination,7,6);
	}
	if($parameter == 3)
	{
		$result = $result.substr($destination, 16, 4);
	}
}
