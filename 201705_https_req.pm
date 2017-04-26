use warnings;
use strict;

#IMPORTS
use LWP::UserAgent;
use HTTP::Request;
use Data::Dumper;
use JSON::XS;

# Input data #################################
my $url = "<url>";
my $username = "<username>";
my $password = "<password>";
my $type = "POST";
my $custom_attribute = "custom_attribute";
my $counter = 0;
##############################################

sub main{
    _set_method("18");
}

sub _set_method {
    my ($user_id) = @_;
    confess('no intercom user id') unless $user_id;

    my $req = HTTP::Request->new($type => $url);
    $req->authorization_basic($username, $password);
    $req->header('accept' => 'application/json');
    $req->header('content-type' => 'application/json');
    $req->content(_get_json($user_id));

    my $ua = LWP::UserAgent->new;
    my $resp = $ua->request($req);

    $counter++;
    print "Request number: $counter ";
    if ($resp->is_success) {
        print Dumper($resp);
    } else {
        print "Error in making the request!!"
    }
}

sub _get_json {
    my ($user_id) = @_;

    my $encoder = JSON::XS->new->canonical->utf8->allow_blessed->convert_blessed;
    my $json = $encoder->encode({
        sitemaker_id       => $user_id,
        $custom_attribute  => "true"
    });
    return $json;
}

main();
