create table course_history (
    id                    bigint primary key auto_increment,
    course                varchar(31) not null unique,
    student               varchar(31) not null,
    grade                 decimal(3,1) not null default 0.0
);

insert into course_history
    (course, student, grade)
values
    ('Introduction to Perl',        'blabos',   10.0),
    ('Mastering Regexes',           'blabos',    7.0),
    ('Basics of Machine Learning',  'fulano',    9.5),
    ('COBOL for Dummies',           'beltrano',  8.7),
    ('Advanced Hello World',        'fulano',    4.4);

