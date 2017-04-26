use warnings;
use strict;

use DBI;

# Script: run one time to <...>
# http://www.perl.com/pub/1999/10/DBI.html

my $user = "<user>";
my $passwd = "<passwd>";

# Connect to Sybase DB
$dbh = DBI->connect("dbi:Sybase:moonfruitSybaseDB", $user, $passwd) or die "Couldn't connect to database: " . DBI->errstr;

# Prepare the query (? to be filled in later)
my $sth = $dbh->prepare('SELECT <column> FROM <table> WHERE <attribute> = ?') or die "Couldn't prepare statement: " . $dbh->errstr;

# Query for all the users with responsive sites

# Post request to intercom_service to create/update custom attribute has_responsive_page


print "\n", 'Ended the SCRIPT!!', "\n";
