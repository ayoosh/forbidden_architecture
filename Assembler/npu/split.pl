#Have to read from the file then first set goes to the offset then weight0. Next for every layer, according to cur layer, get offset buf values then, read read into the weight buffers.  Repeat for every layer. Once done, write into offset buffer and weight buffers
use Switch;
#use sitrict;

open my $output_conf, '>>', 'configuration_bansi.coe' or die "error trying to overwrite: $!";
open my $out_sak, '>>', 'configuration_sakshi.txt' or die "error rying to overwrite: $!";

open(DATA, "weights_sobel.txt") or die "Can't open";
@lines = <DATA>;
$n = @lines;
close(DATA);

for $i(0..($n-1)){
        $b = $lines[$i] *(1<<7) ;
        $a = sprintf("%04x", $b);
        $c = substr($a, 0, 4);
        if($c eq "ffff"){
                $a = substr($a,12,4);}
	$lines[$i] = $a;
}

@weight_0;
@weight_1;
@weight_2;
@weight_3;
@weight_4;
@weight_5;
@weight_6;
@weight_7;

@sigmoid = (0,0,0) ;
$output_sigmoid=1 ;

@weight_0_addr=0;
@weight_1_addr=0;
@weight_2_addr=0;
@weight_3_addr=0;
@weight_4_addr=0;
@weight_5_addr=0;
@weight_6_addr=0;
@weight_7_addr=0;

@weight_buf_fin_0;
@weight_buf_fin_1;
@weight_buf_fin_2;
@weight_buf_fin_3;
@weight_buf_fin_4;
@weight_buf_fin_5;
@weight_buf_fin_6;
@weight_buf_fin_7;

@scheduling_buffer;
$sch_count= 0 ;
@schedule;
$schedule_buffer_count;

@offset_array;
$offset_count=$#offset_array; #This is count for offset array

#The following values need to be set before running the code

$input_format = "0000000000000000";
$output_format = "0000000000000000";
$input_count = "0009";
$input = 0x0009;
$output_count1 = "0001";
$output_count = 0x0001;
$sigmoid_function = 1; # check again
@input_per_layer = (9,8,4);
@neurons_per_layer = (8,4,1);
$layer_count=3;
$layer_count_for_split = 3;
$pe_pointer =0;
$cur_layer = 1;
$cur_layer_for_split = 0;

#The following values need to be set before running the code
$array_count = 0;

#offset for input scaling...................................................
for $i(0..($input-1))
{
	$index = $#offset_array;
	$mis = substr($lines[$array_count], 0, 4);
	$offset_array[$index+1] = $mis;
	$array_count++;
}

#weights for input scaling...............................................
for $j(0..($input-1))
{
        $index = $#weight_0;
        $mis = substr($lines[$array_count], 0, 4);
	$weight_0[$index+1] = $mis;
        $array_count++;
}


#for so many values equal to the number of layers..........................
while($layer_count_for_split > 0){
	$pe_pointer =0;
	$current_input = $input_per_layer[$cur_layer_for_split];	
	$current_neuron = $neurons_per_layer[$cur_layer_for_split];

	#grab offsets..................................
	for $y(0..($current_neuron-1)){
		$index = $#offset_array;
	        $mis = substr($lines[$array_count], 0, 4);
        	$offset_array[$index+1] = $mis;
        	$array_count++;
	}

	#grab weights.................................
	
	while($current_input >0){	
		
		for $sp(0..($current_neuron-1)){
			if($pe_pointer == 0){
				$index = $#weight_0;
			        $mis = substr($lines[$array_count], 0, 4);
			        $weight_0[$index+1] = $mis;
			        $array_count++;
			}
			if($pe_pointer == 1){
                                $index = $#weight_1;
                                $mis = substr($lines[$array_count], 0, 4);
                                $weight_1[$index+1] = $mis;
                                $array_count++;
                        }
			if($pe_pointer == 2){
                                $index = $#weight_2;
                                $mis = substr($lines[$array_count], 0, 4);
                                $weight_2[$index+1] = $mis;
                                $array_count++;
                        }
			if($pe_pointer == 3){
                                $index = $#weight_3;
                                $mis = substr($lines[$array_count], 0, 4);
                                $weight_3[$index+1] = $mis;
                                $array_count++;
                        }
			if($pe_pointer == 4){
                                $index = $#weight_4;
                                $mis = substr($lines[$array_count], 0, 4);
                                $weight_4[$index+1] = $mis;
                                $array_count++;
                        }
			if($pe_pointer == 5){
                                $index = $#weight_5;
                                $mis = substr($lines[$array_count], 0, 4);
                                $weight_5[$index+1] = $mis;
                                $array_count++;
                        }
			if($pe_pointer == 6){
                                $index = $#weight_6;
                                $mis = substr($lines[$array_count], 0, 4);
                                $weight_6[$index+1] = $mis;
                                $array_count++;
                        }
			if($pe_pointer == 7){
                                $index = $#weight_7;
                                $mis = substr($lines[$array_count], 0, 4);
                                $weight_7[$index+1] = $mis;
                                $array_count++;
                        }
		}
		$current_input--;
		$pe_pointer++;
		if($pe_pointer == 8){
			$pe_pointer = 0;
		}
	}
	$cur_layer_for_split++;
	$layer_count_for_split--;
}

for $i(0..($output_count-1))
{
        $index = $#offset_array;
        $mis = substr($lines[$array_count], 0, 4);
        $offset_array[$index+1] = $mis;
        $array_count++;
}

#weights for input scaling...............................................
for $j(0..($output_count-1))
{
        $index = $#weight_0;
        $mis = substr($lines[$array_count], 0, 4);
        $weight_0[$index+1] = $mis;
        $array_count++;
}













$weighti = $#offset_array;
for $rt(0..$weighti){
        print "OF : $offset_array[$rt] \n";
}

$weighti = $#weight_0;
for $rt(0..$weighti){
	print "W0 : $weight_0[$rt] \n";
}

$weighti = $#weight_1;
for $rt(0..$weighti){
        print "W1 : $weight_1[$rt] \n";
}

$weighti = $#weight_2;
for $rt(0..$weighti){
        print "W2 : $weight_2[$rt] \n";
}

$weighti = $#weight_3;
for $rt(0..$weighti){
        print "W3 : $weight_3[$rt] \n";
}

$weighti = $#weight_4;
for $rt(0..$weighti){
        print "W4 : $weight_4[$rt] \n";
}

$weighti = $#weight_5;
for $rt(0..$weighti){
        print "W5 : $weight_5[$rt] \n";
}

$weighti = $#weight_6;
for $rt(0..$weighti){
        print "W6 : $weight_6[$rt] \n";
}

$weighti = $#weight_7;
for $rt(0..$weighti){
        print "W7 : $weight_7[$rt] \n";
}

