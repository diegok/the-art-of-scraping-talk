#!/usr/bin/env perl

use v5.10;
use WWW::Mechanize;

my $mech = WWW::Mechanize->new();
$mech->agent_alias('Mac Safari');

$mech->get('https://metacpan.org/');
$mech->submit_form(
    form_number => 1,
    fields      => { q => 'diegok', },
);

$mech->follow_link( text_regex => qr/WWW::EZTV/ );
say $mech->content;

