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
my @numbers = qw(8 2 5 3 1 7);
my @big_numbers = grep { $_ > 4 } @numbers;
print "@big_numbers\n";      # (8, 5, 7)

# ****************************************
my @names = qw(Americo Tomas Ana Batalha Hugo);
my @grep = grep { lc($_) eq 'ana' } @names;
print "@grep\n";

# ****************************************
if (any { 'Foo' eq $_ } qw(Foo Bar Baz)) {
   print "Visitor Foo is in the guest list\n";
} else {
   print "Visitor Foo is NOT in the guest list\n";
}
