#!perl
use strict;
use warnings;
use MogileFS::Client;
use LWP::UserAgent;

my $client = MogileFS::Client->new(
    domain => "foo",
    hosts => ["127.0.0.1:7001"],
);
die unless $client;

my $key   = "bar/buz/1";
my $class = "foo-default";

my $fh = $client->new_file($key, $class) or die $client->errstr;
$fh->print("hello world.") or die $client->errstr;
$fh->close or die $client->errstr;

my @urls = $client->get_paths($key);
print join("\n", @urls), "\n";

my $ua = LWP::UserAgent->new;
$ua->no_proxy('127.0.0.1');
my $res = $ua->get($urls[0]);
if ($res->is_success) {
    print $res->content, "\n";
} else {
    die $res->status_line;
}
