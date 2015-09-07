#!/usr/bin/env perl

use v5.10;
use Mojo::UserAgent;
use Mojo::URL;
use Data::Dump qw/pp/;

my $ua = Mojo::UserAgent->new;
$ua->max_redirects(1);
my $home_url  = Mojo::URL->new('http://workshop.barcelona.pm/barcelona2014/main');
my $login_url = Mojo::URL->new('http://workshop.barcelona.pm/barcelona2014/LOGIN');

# { Referer => "$home_url" }, 
my $tx = $ua->post( $login_url, form => {
    credential_0 => 'diegok',
    credential_1 => 'superman',
    destination  => '/barcelona2014/main' # hidden
});

say pp($ua->cookie_jar);
say $tx->req->url;

say $tx->res->dom->at('.navbar-right a > .hidden-md')->text;

