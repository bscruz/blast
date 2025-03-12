#!/pkg/bin/perl -w

# Program kmerfirst.pl
# This program finds all the overlapping k-mers of the input string. It builds
# an associative array where each key is one distinct k-mer in the string,
# and the associated value is the starting position where that
#k-mer is FIRST found.  Compare this to kmer2.pl
$dna = 'didyoseeasteelrvlashorwasitaflagthere';

$file = 'perlblastdata.txt';
$myoutfile = 'data.txt';

open (OUTFO, "> $myoutfile");
open (INFO, $file);  
$k= 4;
%q_kmers = ();
$i = 1;
while ( $line = <INFO>) {
    chomp $line;


    
    while (length($line) >= $k) {
	$line =~ m/(.{$k})/; 
	my $kmer = $1;
	print OUTFO "$1, $i \n";
	if (! defined $q_kmers{$kmer}) {     #defined is a function that returns true
                                  # if a value has already been assigned to
                                  # $kmer{$1}, otherwise it returns false. 
                                  # the ! character is the negation, so
                                  # if $kmer{$1} has no value, then it will
                                  # be assigned the value of $i, the position
                                  # where the k-mer is first found.
	    $q_kmers{$kmer} = $i;       
	}
	$i++;
	$line = substr($line, 1, length($line) -1);
    }

    foreach $kmerkey (keys(%q_kmers)) {
	print OUTFO "The first occurrence of string $kmerkey is in position 
 	$q_kmers{$kmerkey}\n";
    }

}
close(INFO);
my $myfile = 'perlblastdata.txt';
open my $fh, '<', $myfile or die;
my $file_content = do { local $/; <$fh> };


# Now split the file content into individual characters



close $fh;
my @string2 = split(//, $file_content);
print "Characters in the file content: @string2\n";


$j = 1;
while (length($dna) >= $k){
    $dna =~ m/(.{$k})/;
    my $kmer = $1;
    if (exists $q_kmers{$kmer}) {
	print "The 4-mer '$kmer' from S is found in Q at position $q_kmers{$1}\n";
	$q_kmers{$1} = $j;
    



    }
    $j++;
    $dna = substr($dna, 1, length($dna) -1);

}
close(OUTFO);
