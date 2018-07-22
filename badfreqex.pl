#!/usr/bin/perl/ -w

my $tweets = "lyrics1.xml";

open TWEET, "< $tweets";

my $negative = "racism.txt";

open NEGATIVE, "< $negative";

$out = "posout.txt";
open(OUT, '>', $out);

my %neg = ();

my $negnum = 0;
my $total = 0;

while (my $line = <NEGATIVE>) {
	chomp($line);
	$neg{$line} = "1";
}


while (my $line = <TWEET>){
	$line = lc($line);
	$total = $total + 1;
	@words = split(' ', $line);
	foreach $word (@words){
		if (exists($neg{$word})){
			$negnum = $negnum + 1;
			print OUT "$word ";
		}
	}
}
print "Racism is $negnum \n";
print "Tweets is $total \n";
	
