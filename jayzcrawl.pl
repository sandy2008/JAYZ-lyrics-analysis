#!/usr/bin/perl -w

use strict;
use WWW::Mechanize;

my $crawllist = "jayzlinks.txt";

open LIST, "< $crawllist";

my $outfile = "lyrics.txt";
open(OUT, '>', $outfile) or die $!;

while (my $line = <LIST>) {
	chomp($line);
    my $mech = WWW::Mechanize->new();

    $mech->get($line);

    $a = $mech->text();
    $a =~ s/.*Search     $//g;
    $a =~ s/.*lyricsJay\-Z Lyrics$//g;
    $a =~ s/    Submit CorrectionsThanks.*$//g;
    print OUT ("$a \n");	
}

