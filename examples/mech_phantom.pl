#!/usr/bin/env perl

use strict;
use WWW::Mechanize::PhantomJS;
use FindBin;

my $mech = WWW::Mechanize::PhantomJS->new( launch_exe => "$FindBin::Bin/phantomjs.osx" );
$mech->get('http://google.com');
$mech->eval_in_page('alert("Hello PhantomJS")');
my $png= $mech->content_as_png();

open my $fh, '>', 'test.png';
print $fh $png;
