#!/usr/bin/env perl

use v5.32;
use strict;
use warnings;

use DBI;
use Text::CSV_XS qw( csv );

## conexão ao postgres
my $pg_host = 'localhost';
my $pg_port = '4001';
my $pg_db   = 'pgdb_sample';
my $pg_dsn  = "DBI:Pg:dbname=$pg_db;host=$pg_host;port=$pg_port";
my $pg_user = 'blabos';
my $pg_pass = 'blabos';
my $pg_dbh  = DBI->connect( $pg_dsn, $pg_user, $pg_pass );

## conexão ao mariadb
my $my_host = '127.0.0.1';
my $my_port = '4002';
my $my_db   = 'mydb_sample';
my $my_dsn  = "DBI:MariaDB:database=$my_db;host=$my_host;port=$my_port";
my $my_user = 'blabos';
my $my_pass = 'blabos';
my $my_dbh  = DBI->connect( $my_dsn, $my_user, $my_pass );

## pegando a lista de estudantes no postgres
my $clients = $pg_dbh->selectall_arrayref(
    'select * from "pgdb_schema"."clients" order by name',
    { Slice => {} },
);

## pegando o histórico no mariadb
my $history = $my_dbh->selectall_arrayref(
    'select * from course_history where grade > 5.0',
    { Slice => {} },
);

## gerando o relatório!
my @rows = ();
foreach my $student ( $clients->@* ) {
    my @courses =
      map  { $_->{course} }                         ## 3. pega o nome do curso
      grep { $_->{student} eq $student->{user} }    ## 2. filtra deste aluno
      $history->@*;                                 ## 1. pega todos os cursos

    ## estrutura de dados para o csv
    push @rows,
      {
        name    => $student->{name},
        email   => $student->{email},
        courses => join( ', ', @courses ),
      };

    ## apenas mostrando na tela
    say '=' x 80;
    say "Parabéns $student->{name} por sua aprovação em:";
    say '  * ' . $_ foreach @courses;
}

## uma última linha na tela
say '=' x 80;

## gerando o arquivo csv
csv( in => \@rows, out => 'report.csv' );

