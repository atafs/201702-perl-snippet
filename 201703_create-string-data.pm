#!/usr/bin/perl
#
# The traditional first program.

# Strict and warnings are recommended.
use strict;
use warnings;

use List::MoreUtils qw(any);

# Print a message.
print "i am here!\n";

# ****************************************
my $number = 0;
my $value = 151;
for ($number = 1;$number < $value; $number++) {
  print "export const XXX", $number, " = \'xxx", $number, "\'\n";
}
print "\n\n";

# ****************************************
my $number = 0;
my $value = 151;
for ($number = 1;$number < $value; $number++) {
  print "[XXX", $number, "] : ", $number, ",\n";
}
print "\n\n";
