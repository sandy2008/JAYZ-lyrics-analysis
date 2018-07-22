#!/usr/bin/perl -w

use strict;
use WWW::Mechanize;


my $mech = WWW::Mechanize->new();

my $urlToSpider = "https://www.azlyrics.com/j/jayz.html";
$mech->get($urlToSpider);



print "\nThe url that will be spidered is $urlToSpider\n";

print "\nThe links found on the url's starting page\n";

my @foundLinks = $mech->find_all_links();

foreach my $linkList(@foundLinks) {

    unless ($linkList->[0] =~ /^http?:\/\//i || $linkList->[0] =~ /^https?:\/\//i) {

        $linkList->[0] = "$urlToSpider" . $linkList->[0];
    }

    print "$linkList->[0]";
    print "\n";
}