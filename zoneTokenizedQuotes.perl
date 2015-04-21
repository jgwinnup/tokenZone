#!/usr/bin/perl

# Mark moses-tokenized quotes with zone boundaries

use strict;
use utf8;

while(my $row = <STDIN>) {

    my @outwords = ();

    #do just quotes for now
    my $quotecnt = 0;

    my @words = split /\s+/, $row;

    foreach my $word (@words) {

	if($word eq "&quot;") {

	    #start quote?
	    if($quotecnt == 0) {
		push(@outwords, "<zone>");
		push(@outwords, $word);
		$quotecnt++;
	    }
	    else {
		push(@outwords, $word);
		push(@outwords, "</zone>");
		$quotecnt--;
		
	    }

	}
	else {
	    push(@outwords, $word);
	}
    }
    
    print join (" ", @outwords);
}
