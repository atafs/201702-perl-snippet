use warnings;
use strict;

#IMPORTS
use LWP::UserAgent;

#VARIABLES
#AVOID: 500 Can't verify SSL peers without knowing which Certificate Authorities to trust
$ENV{'PERL_LWP_SSL_VERIFY_HOSTNAME'} = 0;

my $url = "<url_api>";
my $json = '
{
    "user_id": "18",
    "custom_attributes": {
        "responsive_pages_user4": true
    }
}';

my $req = HTTP::Request->new(POST => $url);
$req->header('Authorization' => 'Bearer <key>');
$req->header('accept' => 'application/json');
$req->header('content-type' => 'application/json');
$req->content($json);

my $ua = LWP::UserAgent->new;
$ua->protocols_allowed( [ 'https'] );

my $resp = $ua->request($req);

if ($resp->is_success) {
    my $message = $resp->decoded_content;
    print "Received reply: $message\n";
}
else {
    print "HTTP GET error code: ", $resp->code, "\n";
    print "HTTP GET error message: ", $resp->message, "\n";
}

#END
print "\n", 'Ended the SCRIPT!!', "\n";
