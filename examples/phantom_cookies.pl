#!/usr/bin/env perl
use strict;
use v5.10;
use Mojo::UserAgent;
use Mojo::JSON  qw(decode_json);
use File::Which qw(which);

my $phantomjs_bin = which('phantomjs') || die 'Unable to find phantomjs binary';
my $ua = Mojo::UserAgent->new;

my $cookies = decode_json(`$phantomjs_bin cookies.js`);
for my $ck ( @$cookies ) {
    $ua->cookie_jar->add(
        Mojo::Cookie::Response->new(
            expires => $_->{expiry},
            map { $_ => $ck->{$_} }
             qw ( name value domain path secure httponly ),
        )
    );
}

say $_->name for @{$ua->cookie_jar->all};
