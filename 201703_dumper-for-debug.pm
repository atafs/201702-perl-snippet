use Data::Dumper;

package Foo;
sub new {bless {'a' => 1, 'b' => sub { return "foo" }}, $_[0]};

package Fuz;                       # a weird REF-REF-SCALAR object
sub new {bless \($_ = \ 'fu\'z'), $_[0]};

package main;
$foo = Foo->new;
$fuz = Fuz->new;
$boo = [ 1, [], "abcd", \*foo,
         {1 => 'a', 023 => 'b', 0x45 => 'c'},
         \\"p\q\'r", $foo, $fuz];

########
# simple usage
########

$bar = eval(Dumper($boo));
print($@) if $@;
print Dumper($boo), Dumper($bar);  # pretty print (no array indices)
