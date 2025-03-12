#!/bin/perl

print "Enter a string";
$promoter=<>;

chomp($promoter)
if ($promoter=~ m/(TATA[AT]A[AT])[ATCG]{17}([CT]{4}CA[AG]{4})/) {
    print "match E. Coli \n";
} elsif ($promoter=~ m/(TTTACA)[ATCG]{18}(TATGTT)/) {
    print "match lactose promoter \n";
} else {
    print "No match found.\n";
}
