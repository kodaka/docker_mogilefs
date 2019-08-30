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

my $key_prefix = "bar/";

my($after, $keys) = $client->list_keys($key_prefix);
print $after, "\n";
print "---\n";
print join("\n", @$keys), "\n";
