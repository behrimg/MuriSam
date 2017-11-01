#!/bin/perl
#use strict;
#use warnings;

open(PLUSSTRAND, "<", "PlusStrand.txt");
my @plus=<PLUSSTRAND>;
close PLUSSTRAND;
open(MINUSSTRAND, "<", "MinusStrand.txt");
my @minus=<MINUSSTRAND>;
close MINUSSTRAND;
open (COVERAGE, ">Coverage.txt");

my $j;
my $reads;
my $lc= 0;
open my $file, "<", "PlusStrand.txt" or die($!);
$lc++ while <$file>;
close $file;
for($j=0;$j<$lc;$j+=1)
{
$reads=$plus[$j]+$minus[$j];
#print COVERAGE "$reads \n";
print COVERAGE "$reads\n"
}
close COVERAGE;
