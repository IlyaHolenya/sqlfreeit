create database freeIT 

use freeIT

create table students
(studentID int not null identity,
studentName varchar(30) not null,
studentSurname varchar(30) not null,
studentSecondName varchar(30),
groupID int,
constraint pk_students primary key (studentID)
)

create table teachers
(teacherID int not null identity,
teacherName varchar(30) not null,
teacherSurname varchar(30) not null,
teacherSecondName varchar(30),
constraint pk_teachers primary key (teacherID)
)

create table groups
(groupID int not null identity,
groupName varchar(30) not null,
groupCourse int not null,
constraint pk_groups primary key (groupID)
)

create table tplan
(groupID int,
teacherID int,
subjectID int,
constraint pk_tplan primary key (groupID, teacherID, subjectID)
)

create table subjects
(subjectID int not null identity,
subjectName varchar(30) not null,
subjectHourse int not null,
constraint pk_subjects primary key (subjectID)
)
alter table students
add 
constraint fk_groups foreign key (groupID)
references groups (groupID)

alter table tplan
add
constraint fk_tplan_teachers foreign key (teacherID)
references teachers (teacherID)

alter table tplan
add
constraint fk_tplan_subjects foreign key (subjectID)
references subjects (subjectID)

alter table tplan
add
constraint fk_tplan_groups foreign key (groupID)
references groups (groupID)

insert into groups (groupName, groupCourse)
values ('PO134', 1),
('PO135', 1),
('PO235', 2),
('PO335', 3);

insert into students (studentName, studentSurname, studentSecondName, groupID)
values ('P.', 'Fedorenko', 'R.', 1),
('O.', 'Zingel', '', 1),
('P.', 'Miheenok', 'G.', 1),
('N.', 'Savickaja', '', 2),
('M.', 'Kovalchuk', 'E.', 2),
('N.', 'Zabolotnaja', 'G.', 3),
('T.', 'Kovrigo', 'R.', 3);

insert into teachers (teacherName, teacherSurname, teacherSecondName)
values ('N.', 'Safronenko', ''),
('N.', 'Zaitseva', 'U.'),
('P.', 'Lisopad', 'G.'),
('K.', 'Kluev', 'N.'),
('P.', 'Rogachevskij', 'N.'),
('N.', 'Makarov', 'G.');

insert into subjects (subjectName, subjectHourse)
values ('Physics', 200),
('Mathematics', 120),
('Algorithmization', 70),
('Designing a Database', 130),
('Visual programming tools', 90),
('Object-oriented programming', 70);

insert into tplan (groupID, teacherID, subjectID)
values (1, 1, 4),
(1, 2, 5),
(2, 3, 6),
(2, 4, 7),
(3, 5, 8),
(3, 6, 9);

update students set groupID = 1 where groupID = 2;

delete from groups where groupName = 'PO135';

alter table students drop column studentSecondName;
alter table teachers drop column teacherSecondName;

