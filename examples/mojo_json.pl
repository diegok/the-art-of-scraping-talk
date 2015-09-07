#!/usr/bin/env perl

use v5.10;
use Mojo::UserAgent;
use Mojo::URL;

my $ua = Mojo::UserAgent->new;
my $api_url = Mojo::URL->new('http://api.metacpan.org/v0/release/_search');

my $res = $ua->get( $api_url->clone->query(q => 'author:DIEGOK') )->res;

say $res->json->{hits}{hits}[1]{_source}{archive};

# Mojo::JSON::Pointer (rfc6901)
say $res->json('/hits/hits/1/_source/archive');

