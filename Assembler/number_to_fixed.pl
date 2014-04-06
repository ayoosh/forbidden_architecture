open(DATA, "weight.txt") or die "Can't open";
@lines = <DATA>;
$n = @lines;
close(DATA);

open my $output_conf, '>>', 'weights_hex.txt' or die "error trying to overwrite: $!";


for $i(0..($n-1)){
	$b = $lines[$i] *(1<<7) ;
	$a = sprintf("%04x", $b);
	print $output_conf "$a \n";
}
