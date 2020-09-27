#!/usr/bin/env perl

use v5.30;
use strict;
use warnings;

use Text::CSV qw( csv );

my $data = [
    { 'name' => 'Fulana de Tal',     'pronoun' => 'Sra.', 'age' => 35, },
    { 'name' => 'Beltrano da Silva', 'pronoun' => 'Sr.',  'age' => 24, },
    { 'name' => 'Ciclano Augusto',   'pronoun' => undef,  'age' => 42, },
];

csv( 'in' => $data, 'out' => 'data.csv' );

