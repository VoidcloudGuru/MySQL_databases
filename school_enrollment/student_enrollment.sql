use school_enrollment;

-- Student enrolments

create table students(id int primary key auto_increment, admission_no varchar(10) unique,
name varchar(50), school_id varchar(10));

insert into students(admission_no, name, school_id) values
('001', 'Namagembe Stella', '102'), -- p1
('002', 'Kyeyune Frank', '102'), 
('003', 'Benard Gwalijjo', '102'), -- p2
('004', 'Namutebi Isabel', '102'), 
('005', 'Kaaya Frank', '102'), -- p3
('006', 'Abigail Adwok', '102'),
('007', 'Stacia Mayanja', '102'), -- p4
('008', 'Annet Namugenyi', '102'),
('009', 'Dunkan Abujju', '102'), -- p5
('010', 'Fred Jeremiah', '102'),
('011', 'Anita Buyambi', '102'), -- p6
('012', 'Derrick Kamya', '102'),
('013', 'Amina Nakamya', '102'), -- p7
('014', 'Ssekitoleko Ian', '102'),
('0001', 'Alupo Jane', '104'), -- S1
('0002', 'Akram Ssempijja', '104'),
('0003', 'Gwen Nakabiri', '104'), -- s2
('0004', 'Alfred Ssekyanzi', '104'), 
('0005', 'Jannet Ampurire', '104'), -- s3
('0006', 'Mark Kyankwazi', '104'),
('0007', 'Gift Aluka', '104'), -- s4
('0008', 'Kamukama Francis', '104');

select * from students;

create table student_enrolments(student_id int, stream_id int, 
term_id int, roll_no varchar(10), status enum('Active', 'Inactive'),
foreign key (student_id) references students(id));

insert into student_enrolments(student_id, stream_id, term_id, roll_no, status)
values
(1, 1, 1, 'P1001', 'Active'),
(2, 1, 1, 'P1002', 'Active'),
(3, 2, 1, 'P2003', 'Active'),
(4, 2, 1, 'P2004', 'Active'),
(5, 3, 2, 'P3005', 'Active'),
(6, 3, 2, 'P3006', 'Inactive'),
(7, 4, 1, 'P4007', 'Active'),
(8, 4, 1, 'P4008', 'Active'),
(9, 5, 2, 'P5009', 'Active'),
(10, 5, 1, 'P5010', 'Inactive'),
(11, 6, 2, 'P6011', 'Active'),
(12, 6, 2, 'P6012', 'Active'),
(13, 7, 3, 'P7013', 'Active'),
(14, 7, 3, 'P7014', 'Active'),
(15, 8, 1, 'S10001', 'Active'),
(16, 8, 1, 'S10002', 'Active'),
(17, 9, 2, 'S20003', 'Inactive'),
(18, 9, 1, 'S20004', 'Active'),
(19, 10, 1, 'S30005', 'Inactive'),
(20, 10, 1, 'S30006', 'Active'),
(21, 11, 3, 'S40007', 'Active'),
(22, 11, 3, 'S40008', 'Active');

select * from student_enrolments;

-- P4-P7
create table primary_subjects(subject_id int primary key auto_increment, subject_name varchar(50));
 insert into primary_subjects(subject_name) values
 ('English'),
 ('Math'),
 ('Science'),
 ('SST');

 select * from primary_subjects;
 
create table primary_assesment_types(assessment_type_id int primary key auto_increment,
assesment_type varchar(30));
insert into primary_assesment_types(assesment_type) values
('BOT'),
('Mid-Term'),
('End-Term'),
('CLasswork');

select * from primary_assesment_types;

-- ratings(3/2/1), P1-P3
create table primary_thematic_competences(theme_id int auto_increment primary key,enrolment_id int,
themes varchar(50), learning_area varchar(40), rating int,
foreign key (enrolment_id) references students(id));

insert into primary_thematic_competences
(enrolment_id, themes, learning_area, rating)
values
(1,'Our School','Social Development',3),
(1, 'Our Environment','Environmental Awareness',3),
(1, 'Weather','Science',2),
(2, 'Our School','Social Development',2),
(2, 'Our Environment','Environmental Awareness',2),
(2, 'Weather','Science',3),
(3, 'Community','Social Development',3),
(3, 'Transport','Communication',2),
(3, 'Safety','Health Education',2),
(4, 'Community','Social Development',2),
(4, 'Transport','Communication',3),
(4, 'Safety','Health Education',3),
(5, 'People Around Us','Social Studies',3),
(5, 'Our Culture','Social Studies',2),
(5, 'Clean Environment','Environmental Awareness',1),
(6, 'People Around Us','Social Studies',2),
(6, 'Our Culture','Social Studies',3),
(6, 'Clean Environment','Environmental Awareness',2);

select * from primary_thematic_competences;

-- internal ratings(3/2/1) S1-S4 AoI(activity of integration)
create table secondary_subjects(subject_id int primary key auto_increment, subject_name varchar(40));

insert into secondary_subjects(subject_name) values
('Mathematics'),
('English'),
('Biology'),
('Chemistry');
 select * from secondary_subjects;
 
create table activities_of_integration(aoi_id int primary key auto_increment, subject_id int,
class_code varchar(10), chapter_no int, aoi_title varchar(30));

insert into activities_of_integration(subject_id,class_code,chapter_no, aoi_title) values
(1,'S1',1,'Number Patterns'),
(1,'S1',2,'Linear Equations'),
(2,'S1',1,'Essay Writing'),
(2,'S1',2,'Comprehension Skills'),
(1,'S2',3,'Algebra Expressions'),
(1,'S2',4,'Graphs and Functions'),
(3,'S2',1,'Cell Structure'),
(3,'S2',2,'Nutrition'),
(1,'S3',5,'Indices'),
(1,'S3',6,'Statistics'),
(4,'S3',1,'Acids and Bases'),
(4,'S3',2,'Chemical Reactions'),
(1,'S4',7,'Quadratic Equations'),
(1,'S4',8,'Coordinate Geometry'),
(3,'S4',3,'Genetics'),
(3,'S4',4,'Ecology');

select * from activities_of_integration;

create table secondary_ca_scores(aoi_id int, enrolment_id int,
internal_rating int, score_pct int,
foreign key (enrolment_id) references students(id),
foreign key (aoi_id) references activities_of_integration(aoi_id));

insert into secondary_ca_scores(aoi_id, enrolment_id, internal_rating, score_pct) values
-- S1 Students (15,16) Mathematics & English 
(1,15,3,92),
(1,16,2,65),
(2,15,2,74),
(2,16,3,86),
(3,15,3,88),
(3,16,2,60),
(4,15,2,70),
(4,16,3,81),
-- S2 Students (17,18) Mathematics & Biology
(5,17,3,84),
(5,18,2,58),
(6,17,2,67),
(6,18,1,45),
(7,17,3,90),
(7,18,2,62),
(8,17,2,75),
(8,18,3,83),
-- S3 Students (19,20) Mathematics & Chemistry
(9,19,2,55),
(9,20,3,89),
(10,19,3,80),
(10,20,2,64),
(11,19,2,60),
(11,20,3,91),
(12,19,1,42),
(12,20,2,72),
-- S4 Students (21,22) Mathematics & Biology
(13,21,3,85),
(13,22,2,68),
(14,21,2,59),
(14,22,3,93),
(15,21,1,38),
(15,22,2,63),
(16,21,2,70),
(16,22,3,87);

select * from secondary_ca_scores;
 
 
