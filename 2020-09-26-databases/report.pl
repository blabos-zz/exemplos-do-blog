#!/usr/bin/env perl

use v5.32;
use strict;
use warnings;

use DBI;

## postgres connection
my $pg_host = 'localhost';
my $pg_port = '4001';
my $pg_db   = 'pgdb_sample';
my $pg_dsn  = "DBI:Pg:dbname=$pg_db;host=$pg_host;port=$pg_port";
my $pg_user = 'blabos';
my $pg_pass = 'blabos';
my $pg_dbh  = DBI->connect( $pg_dsn, $pg_user, $pg_pass );

## mysql connection
my $my_host = '127.0.0.1';
my $my_port = '4002';
my $my_db   = 'mydb_sample';
my $my_dsn  = "DBI:MariaDB:database=$my_db;host=$my_host;port=$my_port";
my $my_user = 'blabos';
my $my_pass = 'blabos';
my $my_dbh  = DBI->connect( $my_dsn, $my_user, $my_pass );

## getting students from postgres database
my $clients = $pg_dbh->selectall_arrayref(
    'select * from "pgdb_schema"."clients" order by name',
    { Slice => {} },
);

## getting history from mysql database
my $history = $my_dbh->selectall_arrayref(
    'select * from course_history where grade > 5.0',
    { Slice => {} },
);

## let's report!
foreach my $student ( $clients->@* ) {
    my $user    = $student->{user};
    my $name    = $student->{name};
    my $email   = $student->{email};
    my @courses = grep { $_->{student} eq $user } $history->@*;

    say '=' x 80;
    say "Parabéns $name!";
    say "Você foi aprovado(a) no(s) curso(s):";
    say '  * ' . $_->{course} foreach @courses;
}
say '=' x 80;

