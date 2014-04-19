open(DATA, "weight_8_accum.txt") or die "Can't open";
@lines = <DATA>;
$n = @lines;
close(DATA);

open my $output_conf, '>', 'weights_hex.txt' or die "error trying to overwrite: $!";

print "type cast to integer ---- 4 value hex ------ substring ----- final \n";
for $i(0..($n-1)){
	$b = $lines[$i] *(1<<7) ;
	$b = int($b);
	print "$b----";
	$t = sprintf("%x", $b);
	$a = sprintf("%04x", $b);
	print "$a----";
	$c = substr($a, 0, 4);
	print "$c----";
	if($c eq "ffff"){
		$a = substr($a,12,4);}
	print "$a \n";
print $output_conf "$a \n";
}
