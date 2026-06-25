use school_enrollment;

-- Report Cards

-- P4-P7 reports 
create table primary_report_card_subjects(student_id int, subject_id int, BOT_marks int,
midterm_marks int, endofterm_marks int, classwork_marks int, grade char(2), position int,
foreign key(student_id) references students(id),
foreign key (subject_id) references primary_subjects(subject_id));

insert into primary_report_card_subjects
(student_id, subject_id, BOT_marks, midterm_marks, endofterm_marks, classwork_marks, grade, position)
values
(7,1,75,80,85,78,'A',1),
(7,2,70,72,76,74,'B',2),
(7,3,82,85,88,84,'A',1),
(7,4,68,70,73,71,'B',3),

(8,1,65,68,70,66,'B',2),
(8,2,60,64,67,63,'C',3),
(8,3,72,75,78,74,'B',2),
(8,4,66,69,71,68,'B',2),

(9,1,88,90,92,89,'A',1),
(9,2,80,84,86,82,'A',1),
(9,3,78,80,83,81,'A',2),
(9,4,75,78,80,77,'B',2),

(10,1,70,73,75,72,'B',2),
(10,2,68,70,73,69,'B',2),
(10,3,65,67,70,66,'B',3),
(10,4,60,65,68,64,'C',3),

(11,1,90,92,95,91,'A',1),
(11,2,85,87,90,86,'A',1),
(11,3,88,90,92,89,'A',1),
(11,4,82,85,87,84,'A',1),

(12,1,74,76,79,75,'B',2),
(12,2,72,74,77,73,'B',2),
(12,3,70,73,75,71,'B',2),
(12,4,68,70,72,69,'B',3),

(13,1,92,94,96,93,'A',1),
(13,2,90,92,94,91,'A',1),
(13,3,89,91,93,90,'A',1),
(13,4,87,89,91,88,'A',1),

(14,1,78,80,82,79,'A',2),
(14,2,75,77,80,76,'B',2),
(14,3,73,75,78,74,'B',2),
(14,4,70,72,75,71,'B',2);

select * from primary_report_card_subjects;

create table primary_report_cards(student_id int, aggregate varchar(20), position int, 
attendance varchar(30), conduct varchar(30), remarks varchar(50), is_published varchar(30),
foreign key(student_id) references students(id));

insert into primary_report_cards
(student_id, aggregate, position, attendance, conduct, remarks, is_published) values
(7,'78%',1,'95%','Excellent','Good performance','Headteacher'),
(8,'68%',2,'90%','Good','Needs improvement','Class Teacher'),
(9,'84%',1,'97%','Excellent','Very hardworking','Headteacher'),
(10,'67%',2,'88%','Good','Can do better','Deputy Headteacher'),
(11,'90%',1,'98%','Excellent','Outstanding performance','Headteacher'),
(12,'73%',2,'92%','Good','Improving well','Class Teacher'),
(13,'92%',1,'99%','Excellent','Excellent results','Headteacher'),
(14,'76%',2,'94%','Very Good','Good effort','Deputy Headteacher');

select * from primary_report_cards;

-- P1-P3 reports
create table primary_thematic_report_sections(student_id int, 
learning_area varchar(40), overall_rating int,
foreign key(student_id) references students(id));

insert into primary_thematic_report_sections(student_id, learning_area, overall_rating) values
(1,'Social Development',3),
(1,'Environmental Awareness',3),
(1,'Science',2),
(2,'Social Development',2),
(2,'Environmental Awareness',2),
(2,'Science',3),
(3,'Social Development',3),
(3,'Communication',2),
(3,'Health Education',2),
(4,'Social Development',2),
(4,'Communication',3),
(4,'Health Education',3),
(5,'Social Studies',3),
(5,'Social Studies',2),
(5,'Environmental Awareness',1),
(6,'Social Studies',2),
(6,'Social Studies',3),
(6,'Environmental Awareness',2);

select * from primary_thematic_report_sections;

-- secondary reports Continuous Assessment (CA)  School AoI ratings averaged per subject, per term
create table secondary_report_cards(student_id int, position int, term int, conduct varchar(40),
clubs_sports varchar(40), leadership varchar(50), remarks varchar(50),is_pub varchar(20),
foreign key(student_id) references students(id));

insert into secondary_report_cards
(student_id, position, term, conduct, clubs_sports, leadership, remarks, is_pub) values
(15, 1, 1, 'Excellent', 'Football, Debate', 'Class Monitor', 'Promoted to next level', 'Mr. Okello'),
(16, 5, 1, 'Good', 'Music, Athletics', 'None', 'Good performance', 'Mr. Okello'),
(17, 2, 1, 'Very Good', 'Science Club, Netball', 'Library Prefect', 'Keep improving', 'Ms. Achieng'),
(18, 7, 1, 'Good', 'Football', 'None', 'Needs more effort', 'Ms. Achieng'),
(19, 3, 1, 'Excellent', 'Drama, Athletics', 'Head Prefect', 'Outstanding work', 'Mr. Kato'),
(20, 6, 1, 'Good', 'Basketball, Music', 'Class Representative', 'Can do better', 'Mr. Kato'),
(21, 4, 1, 'Very Good', 'Debate, Football', 'Sports Captain', 'Good progress', 'Mrs. Namusoke'),
(22, 8, 1, 'Fair', 'Netball', 'None', 'Needs improvement', 'Mrs. Namusoke');

select * from secondary_report_cards;

create table secondary_report_card_subjects(student_id int, subject_id int, CA_avg int, CA_rating int,
exam_marks int, letter_grade char(2),
foreign key(student_id) references students(id));

insert into secondary_report_card_subjects
(student_id, subject_id, CA_avg, CA_rating, exam_marks, letter_grade) values
-- S1 students
(15, 1, 85, 3, 90, 'A'),
(15, 2, 78, 3, 82, 'A'),
(16, 1, 60, 2, 65, 'C'),
(16, 2, 72, 2, 70, 'B'),
-- S2 students
(17, 1, 90, 3, 95, 'A'),
(17, 3, 82, 3, 80, 'A'),
(18, 1, 58, 1, 60, 'C'),
(18, 3, 50, 1, 55, 'D'),
-- S3 students
(19, 1, 92, 3, 96, 'A'),
(19, 4, 87, 3, 90, 'A'),
(20, 1, 75, 3, 78, 'B'),
(20, 4, 73, 2, 75, 'B'),
-- S4 students
(21, 1, 80, 3, 85, 'A'),
(21, 3, 72, 2, 74, 'B'),
(22, 1, 45, 1, 50, 'E'),
(22, 3, 48, 1, 52, 'E');

select * from secondary_report_card_subjects;

create table secondary_report_aoi_details(aoi_id int, chapter_no int, rating int, score int,
foreign key(aoi_id) references secondary_ca_scores(aoi_id));

insert into secondary_report_aoi_details
(aoi_id, chapter_no, rating, score) values
-- S1 students 
-- Mathematics
(1, 1, 3, 92),
(1, 1, 2, 65),
(2, 2, 2, 74),
(2, 2, 3, 86),
-- English
(3, 1, 3, 88),
(3, 1, 2, 60),
(4, 2, 2, 70),
(4, 2, 3, 81),

-- S2 students
-- Mathematics
(5, 3, 3, 84),
(5, 3, 2, 58),
(6, 4, 2, 67),
(6, 4, 1, 45),
-- Biology
(7, 1, 3, 90),
(7, 1, 2, 62),
(8, 2, 2, 75),
(8, 2, 3, 83),

-- S3 students
-- Mathematics
(9, 5, 2, 55),
(9, 5, 3, 89),
(10, 6, 3, 80),
(10, 6, 2, 64),
-- Chemistry
(11, 1, 2, 60),
(11, 1, 3, 91),
(12, 2, 1, 42),
(12, 2, 2, 72),

-- S4 students
-- Mathematics
(13, 7, 3, 85),
(13, 7, 2, 68),
(14, 8, 2, 59),
(14, 8, 3, 93),
-- Biology
(15, 3, 1, 38),
(15, 3, 2, 63),
(16, 4, 2, 70),
(16, 4, 3, 87);

-- S4 students only
create table uneb_ca_submissions(student_id int, subject_id int, ca_average int, submitted int,
foreign key (student_id) references students(id));
-- 1 = submitted, 0 = not submitted
insert into uneb_ca_submissions(student_id,subject_id,ca_average,submitted) values
(21, 1, 80, 1),
(21, 3, 72, 1),
(22, 1, 45, 0),
(22, 3, 48, 1);

select * from uneb_ca_submissions;