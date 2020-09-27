#!/usr/bin/env perl

use v5.30;
use strict;
use warnings;

use Text::CSV qw( csv );

my $data = csv( 'in' => 'data.csv', 'headers' => 'auto' );

foreach my $row ( $data->@* ) {
    my $greetings =
      !!$row->{'pronoun'}
      ? "Olá $row->{'pronoun'} $row->{'name'}!!!"
      : "Ei $row->{'name'}!!!";

    say $greetings;
}

