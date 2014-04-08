use Switch;
#use sitrict; 

open my $output_conf, '>>', 'configuration_bansi.coe' or die "error trying to overwrite: $!";
open my $out_sak, '>>', 'configuration_sakshi.txt' or die "error rying to overwrite: $!";


@weight_0= (0x0055, 0x0055,0x0180, 0x0500),
@weight_1= (0x0200),
@weight_2= (),
@weight_3= (),
@weight_4= (),
@weight_5= (),
@weight_6= (),
@weight_7= ();

@sigmoid = (1,0) ;
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

@offset_array=("ffab", "ff56", "ff80", "0080");
$offset_count=$#offset_array; #This is count for offset array

#The following values need to be set before running the code

$input_format = "0000000000000000";
$output_format = "0000000000000000";
$input_count = "0002";
$input = 0x0002; 
$output_count1 = "0001";
$output_count = 0x0001;
$sigmoid_function = 1; # check again
@input_per_layer = (2);
@neurons_per_layer = (1);
$layer_count=1;

%buf = ("sigmoid_function_select_1" => 0x8000, "sigmoid_function_select_0" => 0x4000, "set_offset_enable" => 0x2000,"sigmoid_input_select_2" => 0x1000,
	"sigmoid_input_select_1" => 0x0800 , "sigmoid_input_select_0" => 0x0400, "accumulator_fifo_write_enable" => 0x0200, 
	"accumulator_fifo_read_enable" => 0x0100, "set_pe_write_enable" => 0x0080, "set_pe_in_select_2" => 0x0040, "set_pe_in_select_1" => 0x0020, 
	"set_pe_in_select_0" => 0x0010, "set_output_fifo_write_enable" => 0x0008 , "set_sigmoid_fifo_write_enable" => 0x0004, 
	"set_sigmoid_fifo_read_enable" => 0x0002, "set_input_fifo_enable" => 0x0001, "clear_pe_in_select" => 0xff8f, "clear_pe_write_enable" => 0xFF7F,
	"clear_sigmoid_unit_input_enable"=> 0xdfff, "clear_input_fifo_enable" => 0xfffe,"clear_sigmoid_fifo_write_enable"=> 0xfffd, "clear_sigmoid_fifo_read_enable"=> 0xfffd);  

my @destination;

$cur_layer = 1 ;

$layer_start_address = 0;
$weight_0_start_address =0;
$weight_1_start_address =0;
$weight_2_start_address =0;
$weight_3_start_address =0;
$weight_4_start_address =0;
$weight_5_start_address =0;
$weight_6_start_address =0;
$weight_7_start_address =0;

$layer_sch_count = 0;

for $v(0..8191){
	$o = sprintf("%04x", 0x0000);
	$weight_buf_fin_0[$v] = $o;
	$weight_buf_fin_1[$v] = $o;
	$weight_buf_fin_2[$v] = $o;
	$weight_buf_fin_3[$v] = $o;
	$weight_buf_fin_4[$v] = $o;
	$weight_buf_fin_5[$v] = $o;
	$weight_buf_fin_6[$v] = $o;
	$weight_buf_fin_7[$v] = $o;
	$scheduling_buffer[$v] = $o;
}

$sigmoid_function = $sigmoid[0];
$present_schedule[$layer_sch_count] = 0x0000;
$present_schedule[$layer_sch_count+1] = $present_schedule[$layer_sch_count];
$present_schedule[$layer_sch_count+2] = $present_schedule[$layer_sch_count];
$present_schedule[$layer_sch_count+3] = $present_schedule[$layer_sch_count];
$present_schedule[$layer_sch_count+4] = $present_schedule[$layer_sch_count];


$cur_input = $input_per_layer[0];

for $p(0..($cur_input-1)){
	$present_schedule[$layer_sch_count] = $present_schedule[$layer_sch_count] | $buf{"set_input_fifo_enable"};
	$present_schedule[$layer_sch_count+1] = $present_schedule[$layer_sch_count+1] | $buf{"set_pe_write_enable"};
	$present_schedule[$layer_sch_count+4] = $present_schedule[$layer_sch_count+4] | $buf{"set_sigmoid_fifo_write_enable"};
	$layer_sch_count = $layer_sch_count + 1;
}

$present_schedule[$layer_sch_count] = $present_schedule[$layer_sch_count] & $buf{"clear_input_fifo_enable"};
$present_schedule[$layer_sch_count+1] = $present_schedule[$layer_sch_count+1] & $buf{"clear_pe_write_enable"} & $buf{"clear_input_fifo_enable"} ;
$present_schedule[$layer_sch_count+2] = $present_schedule[$layer_sch_count+2] & $buf{"clear_pe_write_enable"} & $buf{"clear_input_fifo_enable"};
$present_schedule[$layer_sch_count+3] = $present_schedule[$layer_sch_count+3] & $buf{"clear_pe_write_enable"} & $buf{"clear_input_fifo_enable"};

$layer_sch_count = $layer_sch_count + 3;

#generating offset buffer and weight 0 buffer-------------------------------
for $yuvi(0..$layer_sch_count){
	$present_weight_0[$yuvi] = 0x0000;
	set_sigmoid_function_in();
}

for $u(2..($cur_input+1)){
	$present_schedule[$u-1] = $present_schedule[$u-1] | $buf{"set_offset_enable"};
	$present_weight_0[$u]=$weight_0[$weight_0_addr];
	$weight_0_addr++;
}


#writing into offset and scheduling buffer--------------------------------------
$p=0;
for $pu($layer_start_address..($layer_start_address + $layer_sch_count)){
                $in_hex = sprintf("%04x", $present_schedule[$p]) ;
                $scheduling_buffer[$pu] = $in_hex ;

                $weight_0_hex = sprintf("%04x", $present_weight_0[$p]);
                $weight_buf_fin_0[$pu] = $weight_0_hex;

		$wei = sprintf("%04x", 0x0000);
		$weight_buf_fin_1[$pu] =$wei;
     		$weight_buf_fin_2[$pu] =$wei;
		$weight_buf_fin_3[$pu] =$wei;
		$weight_buf_fin_4[$pu] =$wei;
		$weight_buf_fin_5[$pu] =$wei;
		$weight_buf_fin_6[$pu] =$wei;
		$weight_buf_fin_7[$pu] =$wei;

		print "$pu-$scheduling_buffer[$pu]-$weight_buf_fin_0[$pu]-$weight_buf_fin_1[$pu]-$weight_buf_fin_2[$pu]-$weight_buf_fin_3[$pu]-$weight_buf_fin_4[$pu]-$weight_buf_fin_5[$pu]-$weight_buf_fin_6[$pu]-$weight_buf_fin_7[$pu] \n"; 

		$p++;
}

$layer_start_address = $layer_start_address + $layer_sch_count + 1; #This becomes start address for the next layer

print "Configuration done.................................................................. \n";

#operations from the sigmoid fifo starts here
while($layer_count > 0)
{
	$cur_input = $input_per_layer[$cur_layer-1];

	$cur_neurons = $neurons_per_layer[$cur_layer-1];
	
	$sigmoid_function = $sigmoid[$cur_layer];
	create_schedule_weight_offset();

	$p= 0 ;
	for $s($layer_start_address..($layer_start_address + $layer_sch_count)) {
		$in_hex = sprintf("%04x", $present_schedule[$p]) ;
		$scheduling_buffer[$s] = $in_hex ; 

		$w_0_hex = sprintf("%04x", $present_weight_0[$p]);
		$weight_buf_fin_0[$s] = $w_0_hex;

 	        $w_1_hex = sprintf("%04x", $present_weight_1[$p]);
                $weight_buf_fin_1[$s] = $w_1_hex;

		$w_2_hex = sprintf("%04x", $present_weight_2[$p]);
                $weight_buf_fin_2[$s] = $w_2_hex;

		$w_3_hex = sprintf("%04x", $present_weight_3[$p]);
                $weight_buf_fin_3[$s] = $w_3_hex;

		$w_4_hex = sprintf("%04x", $present_weight_4[$p]);
                $weight_buf_fin_4[$s] = $w_4_hex;
		
		$w_5_hex = sprintf("%04x", $present_weight_5[$p]);
                $weight_buf_fin_5[$s] = $w_5_hex;

		$w_6_hex = sprintf("%04x", $present_weight_6[$p]);
                $weight_buf_fin_6[$s] = $w_6_hex;
		
		$w_7_hex = sprintf("%04x", $present_weight_7[$p]);
                $weight_buf_fin_7[$s] = $w_7_hex;
		
#		print "$s - $scheduling_buffer[$s] - $offset_buffer[$s] - $weight_buf_fin_0[$s] - $weight_buf_fin_1[$s-$values] -$weight_buf_fin_2[$s-$values] -  $weight_buf_fin_3[$s-$values] - $weight_buf_fin_4[$s-$values] - $weight_buf_fin_5[$s-$values] - $weight_buf_fin_6[$s-$values] - $weight_buf_fin_7[$s-$values] \n";  
		$p = $p + 1;
	} 

	
	$layer_start_address = $layer_start_address + $layer_sch_count + 1; #This becomes start address for the next layer
	$layer_count = $layer_count - 1;
	$cur_layer = $cur_layer + 1 ; 
}	


print "Configuration done for all intermediate layers..................................................\n";

print "Values for output scaling............................................. \n";
$sigmoid_function = $output_sigmoid;
$layer_sch_count = 0;
$present_schedule[$layer_sch_count] = 0x0000;
$present_schedule[$layer_sch_count+1] = $present_schedule[$layer_sch_count];
$present_schedule[$layer_sch_count+2] = $present_schedule[$layer_sch_count];
$present_schedule[$layer_sch_count+3] = $present_schedule[$layer_sch_count];
$present_schedule[$layer_sch_count+4] = $present_schedule[$layer_sch_count];


$cur_input = $output_count;

for $p(0..($cur_input-1)){
        $present_schedule[$layer_sch_count] = $present_schedule[$layer_sch_count] | $buf{"set_sigmoid_fifo_read_enable"};
        $present_schedule[$layer_sch_count+1] = $present_schedule[$layer_sch_count+1] | $buf{"set_pe_write_enable"};
        $present_schedule[$layer_sch_count+4] = $present_schedule[$layer_sch_count+4] | $buf{"set_output_fifo_write_enable"};
        $layer_sch_count = $layer_sch_count + 1;
}

$present_schedule[$layer_sch_count] = $present_schedule[$layer_sch_count] & $buf{"clear_sigmoid_fifo_read_enable"};
$present_schedule[$layer_sch_count+1] = $present_schedule[$layer_sch_count+1] & $buf{"clear_pe_write_enable"} & $buf{"clear_sigmoid_fifo_read_enable"} ;
$present_schedule[$layer_sch_count+2] = $present_schedule[$layer_sch_count+2] & $buf{"clear_pe_write_enable"} & $buf{"clear_sigmoid_fifo_read_enable"};
$present_schedule[$layer_sch_count+3] = $present_schedule[$layer_sch_count+3] & $buf{"clear_pe_write_enable"} & $buf{"clear_sigmoid_fifo_read_enable"};

$layer_sch_count = $layer_sch_count + 3;

#generating offset buffer and weight 0 buffer-------------------------------
for $doni(0..$layer_sch_count){
        $present_weight_0[$doni] = 0x0000;
	set_sigmoid_function_2();
}

for $u(2..($cur_input+1)){
	$present_schedule[$u-1] = $present_schedule[$u-1] | $buf{"set_offset_enable"};
        $present_weight_0[$u]=$weight_0[$weight_0_addr];
        $weight_0_addr++;
}

 
$p= 0 ;
for $s($layer_start_address..($layer_start_address + $layer_sch_count)) {
        $in_hex = sprintf("%04x", $present_schedule[$p]) ;
        $scheduling_buffer[$s] = $in_hex ;

        $w_0_hex = sprintf("%04x", $present_weight_0[$p]);
        $weight_buf_fin_0[$s] = $w_0_hex;

	$weig = sprintf("%04x", 0x0000);
	$weight_buf_fin_1[$s] = $weig;
	$weight_buf_fin_2[$s] = $weig;
	$weight_buf_fin_3[$s] = $weig;
	$weight_buf_fin_4[$s] = $weig;
	$weight_buf_fin_5[$s] = $weig;
	$weight_buf_fin_6[$s] = $weig;
	$weight_buf_fin_7[$s] = $weig;
        $p++;

}

$layer_start_address = $layer_start_address + $layer_sch_count + 1;

for $yt(0..($layer_start_address-1)){
	$weight_buf_final_0[$yt] = $weight_buf_fin_0[$yt];
	$weight_buf_final_1[$yt] = $weight_buf_fin_1[$yt];
	$weight_buf_final_2[$yt] = $weight_buf_fin_2[$yt];
	$weight_buf_final_3[$yt] = $weight_buf_fin_3[$yt];
	$weight_buf_final_4[$yt] = $weight_buf_fin_4[$yt];
	$weight_buf_final_5[$yt] = $weight_buf_fin_5[$yt];
	$weight_buf_final_6[$yt] = $weight_buf_fin_6[$yt];
	$weight_buf_final_7[$yt] = $weight_buf_fin_7[$yt];

	$schedule[$yt] = $scheduling_buffer[$yt];

	print "$yt - $schedule[$yt]-$weight_buf_final_0[$yt]-$weight_buf_final_1[$yt]-$weight_buf_final_2[$yt]-$weight_buf_final_3[$yt]-$weight_buf_final_4[$yt]-$weight_buf_final_5[$yt]-$weight_buf_final_6[$yt]-$weight_buf_final_7[$yt]\n";
}

$ui =sprintf("%04x", 0x0000);
$weight_buf_final_0[$layer_start_address] = $ui;
$weight_buf_final_1[$layer_start_address] = $ui;
$weight_buf_final_2[$layer_start_address] = $ui;
$weight_buf_final_3[$layer_start_address] = $ui;
$weight_buf_final_4[$layer_start_address] = $ui;
$weight_buf_final_5[$layer_start_address] = $ui;
$weight_buf_final_6[$layer_start_address] = $ui;
$weight_buf_final_7[$layer_start_address] = $ui;
$schedule[$layer_start_address] = $ui;

$weight_buf_fin_count_0  = $#weight_buf_final_0;
$weight_buf_fin_count_1  = $#weight_buf_final_1;
$weight_buf_fin_count_2  = $#weight_buf_final_2;
$weight_buf_fin_count_3  = $#weight_buf_final_3;
$weight_buf_fin_count_4  = $#weight_buf_final_4;
$weight_buf_fin_count_5  = $#weight_buf_final_5;
$weight_buf_fin_count_6  = $#weight_buf_final_6;
$weight_buf_fin_count_7  = $#weight_buf_final_7;
$scheduling_buffer_count = $#schedule;	

#-----------------------------------------------------------------
#From here its about picking values from the arrays and creating the output array of 32 bit

print $output_conf "memory_initialization_radix=16;\nmemory_initialization_vector=\n";


#first will be all 32 1s
$destination[0]="83ffffff"; #first 6 bits are 100000 in enqc0
#print $destination[$line_number];
#print "\n";

print $output_conf "$destination[$line_number], \n";
print $out_sak "$destination[$line_number]\n";

$line_number =$line_number+1;

#-----------------------------------------------------------------
#input format - First 6 bits stay the same then, then 4 bits for enable logic= 9 , then bits dummy, then valid 16 bits 
$inter="100000"."1001"."000000".$input_format ; 
$parameter = 7;
convert();
#print $destination[$line_number];
#print "\n";
#
#
print $output_conf "$destination[$line_number], \n";
print $out_sak "$destination[$line_number]\n";


$line_number =$line_number+1;

#----------------------------------------------------------------
#output format - First 6 bits stay the same then, then 4 bits for enable logic = 10, then bits dummy, then valid 16 bits 
$inter="100000"."1010"."000000".$output_format ; 
$parameter = 7;
convert();
#print $destination[$line_number];
#print "\n";
#
print $output_conf "$destination[$line_number], \n";
print $out_sak "$destination[$line_number]\n";

$line_number =$line_number + 1;


#---------------------------------------------------------------
#input count - First 6 bits stay the same then, then 4 bits for enable logic = 11, then bits dummy, then valid 16 bits
$inter="100000"."1011"."000000".$input_count ; 
$parameter = 3;
convert();
#print $destination[$line_number];
#print "\n";
#
print $output_conf "$destination[$line_number], \n";
print $out_sak "$destination[$line_number] \n";

$line_number =$line_number+1;

#--------------------------------------------------------------
#output count - First 6 bits stay the same then, then 4 bits for enable logic = 11, then bits dummy, then valid 16 bits
$inter="100000"."1100"."000000".$output_count1 ;  
$parameter = 3;
convert();
#print $destination[$line_number];
#print "\n";
#
print $output_conf "$destination[$line_number], \n";
print $out_sak "$destination[$line_number]\n";

$line_number =$line_number+1;

#-------------------------------------------------------------
#Writing into the weight buffers starts here
print "Writing into weight buffers \n";
#writing weight buffers 
$common = "100000";
$common1 = "000000";

#for weight buffer 0
for $wb_count(0..$weight_buf_fin_count_0)
{
	$inter = "";
	$inter= $common."0000".$common1.$weight_buf_final_0[$wb_count];
	$parameter = 3;
	convert();
	#print $destination[$line_number];
	#print "\n";
	print $output_conf "$destination[$line_number], \n";
	print $out_sak "$destination[$line_number]\n";

	$line_number =$line_number+1;
}
print "Writing into WB0 successful !! \n";
#-----------------------------------------------------------------
#for weight buffer 1
for $wb_count(0..$weight_buf_fin_count_1)
{
        $inter= $common."0001".$common1.$weight_buf_final_1[$wb_count];
	$parameter = 3;
	convert();
 	#      print $destination[$line_number];
        #print "\n";
        print $output_conf "$destination[$line_number], \n";
	print $out_sak "$destination[$line_number]\n";

        $line_number =$line_number+1;
}
print "Writing into WB1 successful !! \n";

#------------------------------------------------------------------
#for weight buffer 2
for $wb_count(0..$weight_buf_fin_count_2)
{
        $inter= $common."0010".$common1.$weight_buf_final_2[$wb_count];
        $parameter = 3;
        convert();
#        print $destination[$line_number];
#        print "\n";
	print $output_conf "$destination[$line_number], \n";
	print $out_sak "$destination[$line_number]\n";


        $line_number =$line_number+1;
}
print "Writing into WB2 successful !! \n";

#--------------------------------------------------------------------
#for weight buffer 3
for $wb_count(0..$weight_buf_fin_count_3)
{
        $inter= $common."0011".$common1.$weight_buf_final_3[$wb_count];
        $parameter = 3;
        convert();
       # print $destination[$line_number];
       # print "\n";
        print $output_conf "$destination[$line_number], \n";
	print $out_sak "$destination[$line_number]\n";

        $line_number =$line_number+1;
}
print "Writing into WB3 successful !! \n";

#--------------------------------------------------------------------
#for weight buffer 4
for $wb_count(0..$weight_buf_fin_count_4)
{
        $inter= $common."0100".$common1.$weight_buf_final_4[$wb_count];
        $parameter = 3;
        convert();
#        print $destination[$line_number];
#        print "\n";
	print $output_conf "$destination[$line_number], \n";
	print $out_sak "$destination[$line_number]\n";

        $line_number =$line_number+1;
}
print "Writing into WB4 successful !! \n";

#----------------------------------------------------------------------
#for weight buffer 5
for $wb_count(0..$weight_buf_fin_count_5)
{
        $inter= $common."0101".$common1.$weight_buf_final_5[$wb_count];
        $parameter = 3;
        convert();
#        print $destination[$line_number];
#        print "\n";
	print $output_conf "$destination[$line_number], \n";
	print $out_sak "$destination[$line_number]\n";

        $line_number =$line_number+1;
}

print "Writing into WB5 successful !! \n";

#---------------------------------------------------------------------
#for weight buffer 6
for $wb_count(0..$weight_buf_fin_count_6)
{
        $inter= $common."0110".$common1.$weight_buf_final_6[$wb_count];
        $parameter = 3;
        convert();
#        print $destination[$line_number];
#        print "\n";
	print $output_conf "$destination[$line_number], \n";
	print $out_sak "$destination[$line_number]\n";

        $line_number =$line_number+1;
}
print "Writing into WB6 successful !! \n";

#--------------------------------------------------------------------
#for weight buffer 7
for $wb_count(0..$weight_buf_fin_count_7)
{
        $inter= $common."0111".$common1.$weight_buf_final_7[$wb_count];
        $parameter = 3;
        convert();
#        print $destination[$line_number];
#        print "\n";
	print $output_conf "$destination[$line_number], \n";
	print $out_sak "$destination[$line_number]\n";

        $line_number =$line_number+1;
}

print "Writing into WB7 successful !! \n";

#----------------------------------------------------------------
print "Scheduling array starts here -------  \n";

#print $output_conf "Writing into scheduling array starts here \n";

#scheduling buffer array to machine code  
for $sch_count(0..$scheduling_buffer_count)
{
        $inter= $common."1101".$common1.$schedule[$sch_count];
        $parameter = 3;
        convert();
        #print $destination[$line_number];
        #print "\n";
        print $output_conf "$destination[$line_number], \n";
	print $out_sak "$destination[$line_number]\n";

        $line_number =$line_number+1;
}
print "Scheduling logic written successfully !!\n";

#print $output_conf "Writing into schedule ends \n";

#-------------------------------------------------------
print "\n Offset array starts here \n";
#offset buffer array to machine code
for $off_count(0..$offset_count)
{
        $inter= $common."1110".$common1.$offset_array[$off_count];
        $parameter = 3;
        convert();
       # print $destination[$line_number];
       # print "\n";
	print $output_conf "$destination[$line_number], \n";
	print $out_sak "$destination[$line_number]\n";

        $line_number =$line_number+1;
}

print $output_conf "00000000;";
print "Offset buffer written successfully !!";
#------------------------------------------------------------
print "Hurray !! End of code \n \n";

sub set_output_pe()
{
        $in_cur = $cur_input;
	$pe_select = $in_cur % 8;
	
	if($pe_select == 0){
		$pe_select = 7;
	}
	else{
		$pe_select = $pe_select - 1 ;
	}

	print "\n PE chosen =  $pe_select \n";

	switch($pe_select){
	case 0  {  }
	case 1  { $present_schedule[$layer_sch_count] = $present_schedule[$layer_sch_count] | $buf{"sigmoid_input_select_0"}; }
	case 2  { $present_schedule[$layer_sch_count] = $present_schedule[$layer_sch_count] | $buf{"sigmoid_input_select_1"}; }
	case 3  { $present_schedule[$layer_sch_count] = $present_schedule[$layer_sch_count] | $buf{"sigmoid_input_select_1"} | $buf{"sigmoid_input_select_0"}; }
	case 4  { $present_schedule[$layer_sch_count] = $present_schedule[$layer_sch_count] | $buf{"sigmoid_input_select_2"}; }
	case 5  { $present_schedule[$layer_sch_count] = $present_schedule[$layer_sch_count] | $buf{"sigmoid_input_select_2"} | $buf{"sigmoid_input_select_0"}; }
	case 6  { $present_schedule[$layer_sch_count] = $present_schedule[$layer_sch_count] | $buf{"sigmoid_input_select_2"} | $buf{"sigmoid_input_select_1"}; }
	case 7  { $present_schedule[$layer_sch_count] = $present_schedule | $buf{"sigmoid_input_select_2"} | $buf{"sigmoid_input_select_1"} | $buf{"sigmoid_input_select_0"}; }
	}
}


sub set_sigmoid_function()
{
	switch($sigmoid_function){
	case 0 {}
	case 1 {$present_schedule[$layer_sch_count] = $present_schedule[$layer_sch_count] | 0x4000 ; }
	case 2 {$present_schedule[$layer_sch_count] = $present_schedule[$layer_sch_count] | 0x8000 ;}
	case 3 {$present_schedule[$layer_sch_count] = $present_schedule[$layer_sch_count] | 0xc000 ;}
	}
}

sub set_sigmoid_function_in()
{
        switch($sigmoid_function){
        case 0 {}
        case 1 {$present_schedule[$yuvi] = $present_schedule[$yuvi] | 0x4000 ; }
        case 2 {$present_schedule[$yuvi] = $present_schedule[$yuvi] | 0x8000 ;}
        case 3 {$present_schedule[$yuvi] = $present_schedule[$yuvi] | 0xc000 ;}
        }
}
sub set_sigmoid_function_2()
{
        switch($output_sigmoid){
        case 0 {}
        case 1 {$present_schedule[$doni] = $present_schedule[$doni] | 0x4000 ; }
        case 2 {$present_schedule[$doni] = $present_schedule[$doni] | 0x8000 ;}
        case 3 {$present_schedule[$doni] = $present_schedule[$doni] | 0xc000 ;}
        }
}

sub create_schedule_weight_offset(){
	$in_cur = $cur_input;
	$loop_count =int(($cur_input/8)) + 1;
	if(($cur_input%8) ==0){
		$loop_count--;}
	$loop_count1 =int(($cur_input/8));

	$neuron_cur = $cur_neurons;
	$layer_sch_count=0;
	$present_schedule[$layer_sch_count] = 0x0000 ;

	set_output_pe(); #for every layer, select the output pe at which the the values become available
        set_sigmoid_function(); #for every layer, sigmoid 

	$present_schedule[$layer_sch_count + 1] = $present_schedule[$layer_sch_count];

	#input side
	while($loop_count > 0 ) {
		if($in_cur > 8){
	  
	#logic needs to be checked
			for $i(0..7){
				$present_schedule[$layer_sch_count] = $present_schedule[$layer_sch_count] | $buf{"set_sigmoid_fifo_read_enable"};
				select_pe();
				$present_schedule[$layer_sch_count+1] = $present_schedule[$layer_sch_count+1] | $buf{"set_pe_write_enable"};
				$layer_sch_count = $layer_sch_count + 1;
				$present_schedule[$layer_sch_count+1] = $present_schedule[$layer_sch_count];
				$in_cur = $in_cur - 1;
			}
			
			$j=0;
			do{
				$present_schedule[$layer_sch_count+1] = $present_schedule[$layer_sch_count+1] & $buf{"clear_pe_write_enable"};
				$layer_sch_count = $layer_sch_count + 1;	
				$present_schedule[$layer_sch_count+1] = $present_schedule[$layer_sch_count];
				$j++;
			}while($j<=($neuron_cur-8));
		
		}

		else{
			for $i(0.. ($in_cur-1)){
				$present_schedule[$layer_sch_count] = $present_schedule[$layer_sch_count] | $buf{"set_sigmoid_fifo_read_enable"};
				select_pe();
				$present_schedule[$layer_sch_count+1] = $present_schedule[$layer_sch_count+1] | $buf{"set_pe_write_enable"};
                                $layer_sch_count = $layer_sch_count + 1;
				$present_schedule[$layer_sch_count+1] = $present_schedule[$layer_sch_count];
			}
		}
		

	$loop_count = $loop_count-1;
	}
	
	$layer_sch_count = $layer_sch_count + 1;
	#pe_select, sigmoid enable and sigmoid fifo write enable
	#reset layer sch count
	#start reading the value of the pe enable and wait for nth pe enable where n is the number of inputs to that layer. From the next cycle, enable
	# sigmoid input
	
	$present_schedule[$layer_sch_count] = $present_schedule[$layer_sch_count-1];
	$present_schedule[$layer_sch_count+1] = $present_schedule[$layer_sch_count-1];
	
	$present_schedule[$layer_sch_count] =  $present_schedule[$layer_sch_count] & 0xff02; #clear unnecesary elements
	$present_schedule[$layer_sch_count+1] =  $present_schedule[$layer_sch_count+1] & 0xff02;

	print "There are $neuron_cur neurons now \n";	
	for $k($layer_sch_count..($layer_sch_count+$neuron_cur-1)){
		print "I am in this";
		$present_schedule[$layer_sch_count+2] = $present_schedule[$layer_sch_count+2] | $buf{"set_sigmoid_fifo_write_enable"} ;
		#$layer_sch_count = $layer_sch_count + 1 ;
	}
	
	$layer_sch_count = $layer_sch_count+$neuron_cur+1;

	#logic for accumulator write-----------------------------------
	if($cur_input >8){
		$p=0;
		for $a(0..$loop_count1){	
			while(($present_schedule[$p] & 0x00F0)!= 0x00f0){
				$p++;	
				if($p==$layer_sch_count){ 
					goto endc;}
			}
			$p++;
		
			for $f($p..($p+$neuron_cur-1)){
				$present_schedule[$f] = $present_schedule[$f] | 0x0200;
			}
			$p=$p + $neuron_cur-1;	
		}	
		endc:
		$p=3;
        
		for $a(0..$loop_count1){
                	while(($present_schedule[$p] & 0x00F0)!= 0x0080){
                        	$p++;
	                        if($p==$layer_sch_count){
        	                        goto endx;}
                	}
                
	                for $f($p..($p+$neuron_cur-1)){
        	                $present_schedule[$f] = $present_schedule[$f] | 0x0100;
                	}
	                $p=$p + $neuron_cur-1;
        	}

	        endx:
	}

	#preparing the offset array by clearing the array
	for $b(0..$layer_sch_count){
		$present_weight_0[$b]=0;
		$present_weight_1[$b]=0;
		$present_weight_2[$b]=0;
		$present_weight_3[$b]=0;
		$present_weight_4[$b]=0;
		$present_weight_5[$b]=0;
		$present_weight_6[$b]=0;
		$present_weight_7[$b]=0;
	}


	#logic for offset enable
	for $b(1..$neuron_cur){
		$present_schedule[$b] = $present_schedule[$b] | $buf{"set_offset_enable"};
	}

	set_weight_0();
	set_weight_1();
	set_weight_2();
	set_weight_3();
	set_weight_4();
	set_weight_5();
	set_weight_6();
	set_weight_7();
}

sub select_pe(){
   $present_schedule[$layer_sch_count+1] = $present_schedule[$layer_sch_count+1] & $buf{"clear_pe_in_select"}; 
   switch($i){
	  case 0 { $present_schedule[$layer_sch_count+1] = $present_schedule[$layer_sch_count+1] & 0xFF8F }
	  case 1 { $present_schedule[$layer_sch_count+1] = $present_schedule[$layer_sch_count+1] | $buf{"set_pe_in_select_0"}; }
   	  case 2 { $present_schedule[$layer_sch_count+1] = $present_schedule[$layer_sch_count+1] | $buf{"set_pe_in_select_1"}; }
   	  case 3 { $present_schedule[$layer_sch_count+1] = $present_schedule[$layer_sch_count+1] | $buf{"set_pe_in_select_1"} | $buf{"set_pe_in_select_0"}; }
   	  case 4 { $present_schedule[$layer_sch_count+1] = $present_schedule[$layer_sch_count+1] | $buf{"set_pe_in_select_2"}; }
   	  case 5 { $present_schedule[$layer_sch_count+1] = $present_schedule[$layer_sch_count+1] | $buf{"set_pe_in_select_2"} | $buf{"set_pe_in_select_0"}; }
          case 6 { $present_schedule[$layer_sch_count+1] = $present_schedule[$layer_sch_count+1] | $buf{"set_pe_in_select_2"} | $buf{"set_pe_in_select_1"}; }
          case 7 { $present_schedule[$layer_sch_count+1] = $present_schedule[$layer_sch_count+1] | $buf{"set_pe_in_select_2"} | $buf{"set_pe_in_select_1"} | 								$buf{"set_pe_in_select_0"}; }
	}
}

sub convert{
        $destination[$line_number]= "";
	$result = "";
        for $j(0..$parameter)
        {
                $number = substr($inter, ($j*4), 4);
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
                case "1010" {   $result = $result."a"; }
                case "1011" {   $result = $result."b"; }
                case "1100" {   $result = $result."c"; }
                case "1101" {   $result = $result."d"; }
                case "1110" {   $result = $result."e"; }
                case "1111" {   $result = $result."f"; }
                }
        }

	 if($parameter == 3)
        {
                $result = $result.substr($inter, 16, 4);
        }

	$destination[$line_number]= $result;
}

sub set_weight_0(){
	$count = 0;
	
start0:
	while(($present_schedule[$count] & 0x00f0) != 0x0080)
	{
		$count++;
		if($count>= $layer_sch_count){ 
			goto end0;}
	}
	$count++;

	for $c($count..($count+$neuron_cur-1)){
		$present_weight_0[$c] = $weight_0[$weight_0_addr];
		$weight_0_addr++;
	}
	$count = $count + $neuron_cur-1 ;

	if($count < $layer_sch_count){
		goto start0;	}
end0:
}

sub set_weight_1(){
        $count = 0;
        
start1:
        while(($present_schedule[$count] & 0x00f0) != 0x0090)
        {
                $count++;
                if($count>= $layer_sch_count){
                        goto end1;}
        }
        $count++;

        for $c($count..($count+$neuron_cur-1)){
                $present_weight_1[$c] = $weight_1[$weight_1_addr];
                $weight_1_addr++;
        }
        $count = $count + $neuron_cur-1 ;
        
        if($count < $layer_sch_count) {
                goto start1;}
        end1:
#	print "Present weight_address 1 is $weight_1_addr \n";
}

sub set_weight_2(){
        $count = 0;
        
start2:
        while(($present_schedule[$count] & 0x00f0) != 0x00a0)
        {
                $count++;
                if($count> $layer_sch_count){
                        goto end2;}
        }
        $count++;

        for $c($count..($count+$neuron_cur-1)){
                $present_weight_2[$c] = @weight_2[$weight_2_addr];
                $weight_2_addr++;
        }
        $count = $count + $neuron_cur-1 ;
        
        if($count < $layer_sch_count){
                goto start2;}
        end2:
}

sub set_weight_3(){
        $count = 0;
        
start3:
        while(($present_schedule[$count] & 0x00f0) != 0x00b0)
        {
                $count++;
                if($count> $layer_sch_count){
                        goto end3;}
        }
        $count++;

        for $c($count..($count+$neuron_cur-1)){
                $present_weight_3[$c] = @weight_3[$weight_3_addr];
                $weight_3_addr++;
        }
        $count = $count + $neuron_cur-1 ;
        
        if($count < $layer_sch_count){
                goto start3;}
        end3:
}

sub set_weight_4(){
        $count = 0;
        
start4:
        while(($present_schedule[$count] & 0x00f0) != 0x00c0)
        {
                $count++;
                if($count> $layer_sch_count){
                        goto end4;}
        }
        $count++;

        for $c($count..($count+$neuron_cur-1)){
                $present_weight_4[$c] = @weight_4[$weight_4_addr];
                $weight_4_addr++;
        }
        $count = $count + $neuron_cur-1 ;
        
        if($count < $layer_sch_count){
                goto start4;}
        end4:
}

sub set_weight_5(){
        $count = 0;
        
start5:
        while(($present_schedule[$count] & 0x00f0) != 0x00d0)
        {
                $count++;
                if($count> $layer_sch_count){
                        goto end5;}
        }
        $count++;

        for $c($count..($count+$neuron_cur-1)){
                $present_weight_5[$c] = @weight_5[$weight_5_addr];
                $weight_5_addr++;
        }
        $count = $count + $neuron_cur-1 ;
        
        if($count < $layer_sch_count){
                goto start5;}
        end5:
}

sub set_weight_6(){
        $count = 0;
        
start6:
        while(($present_schedule[$count] & 0x00f0) != 0x00e0)
        {
                $count++;
                if($count> $layer_sch_count){
                        goto end6;}
        }
        $count++;

        for $c($count..($count+$neuron_cur-1)){
                $present_weight_6[$c] = @weight_6[$weight_6_addr];
                $weight_6_addr++;
        }
        $count = $count + $neuron_cur-1 ;
        
        if($count < $layer_sch_count) {
                goto start6;}
        end6:
}

sub set_weight_7(){
        $count = 0;
        
start7:
        while(($present_schedule[$count] & 0x00f0) != 0x00f0)
        {
                $count++;
                if($count> $layer_sch_count) {
                        goto end7; }
        }
        $count++;

        for $c($count..($count+$neuron_cur-1)){
                $present_weight_7[$c] = @weight_7[$weight_7_addr];
                $weight_7_addr++;
        }
        $count = $count + $neuron_cur-1 ;
        
        if($count < $layer_sch_count) {
                goto start7; }
end7:
#	for $kf(0..$layer_sch_count)
#	{
#		$ug = sprintf("%04x", $present_weight_7[$kf]);
#		print "Weight 7 == $ug \n";
#	}
}


