#!/usr/bin/env perl

use v5.16;
use Mojo::UserAgent;

my $ua = Mojo::UserAgent->new;

# Scrape the latest headlines from a news site with CSS selectors
say $ua->get('blogs.perl.org')
   ->res->dom->find('h2 > a')->map('text')->join("\n");

