drop schema if exists "pgdb_schema" cascade;

create schema "pgdb_schema" authorization blabos;

create table "pgdb_schema"."clients" (
    "id"                bigserial primary key,
    "user"              varchar(31) not null unique,
    "name"              varchar(255) not null,
    "email"             varchar(255) not null unique
);

insert into "pgdb_schema"."clients"
    ("user", "name", "email")
values
    ('blabos',      'Blabos de Blebe',      'blabos@gmail.com'),
    ('fulano',      'Fulano de Tal',        'fulano.tal@email.com'),
    ('beltrano',    'Beltrano de Souza',    'beltro@examle.com');

