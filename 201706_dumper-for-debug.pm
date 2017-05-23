$boo = [ 1, [], "abcd", \*foo,
         {1 => 'a', 023 => 'b', 0x45 => 'c'},
         \\"p\q\'r"];

use Data::Dumper;
print STDERR "\n\nI AM HERE ", Dumper($boo), "\n\n";
