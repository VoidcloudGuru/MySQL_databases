use crane_highschool;

create table students_info(student_id int, residential_area varchar(30), zone varchar(30),
road varchar(30), health_problem varchar(50), emergency_person varchar(40),
other_information varchar(50), date_of_birth date, registration_date date, created_by varchar(30),
foreign key (student_id) references students(student_id));

insert into students_info
(student_id, residential_area, zone, road, health_problem, emergency_person,
other_information, date_of_birth, registration_date, created_by)
VALUES
(1,'Mukono','Central Zone','Jinja Road','None','Sarah Ssemanda',null,'2009-01-15','2025-01-10','Admin'),
(2,'Seeta','East Zone','Kampala Road','Asthma','Grace Musoke','Carries inhaler','2009-03-22','2025-01-10','Admin'),
(3,'Namanve','North Zone','Factory Road','None','Mary Kaggwa',null,'2008-07-18','2025-01-10','Admin'),
(4,'Mukono','West Zone','Bishop Road','Allergy','Jane Ssekandi','Peanut allergy','2009-09-05','2025-01-10','Admin'),
(5,'Kira','Central Zone','Bulindo Road','None','Ruth Mugisha',null,'2008-11-11','2025-01-10','Admin'),
(6,'Seeta','East Zone','Church Road','None','Betty Kato',null,'2009-02-14','2025-01-10','Admin'),
(7,'Mukono','North Zone','School Road','Asthma','Harriet Sserwanga','Needs medication','2008-06-27','2025-01-10','Admin'),
(8,'Namanve','Central Zone','Industrial Road','None','Rose Nsubuga',null,'2009-04-12','2025-01-10','Admin'),
(9,'Kira','South Zone','Market Road','None','Sarah Kintu',null,'2008-12-03','2025-01-10','Admin'),
(10,'Mukono','East Zone','Cathedral Road','Migraine','Anna Kato','Occasional headaches','2009-08-21','2025-01-10','Admin'),
(11,'Seeta','West Zone','Jinja Road','None','Diana Ssemanda',null,'2008-05-17','2025-01-10','Admin'),
(12,'Kira','North Zone','Bulindo Road','None','Joy Mugerwa',null,'2009-01-30','2025-01-10','Admin'),
(13,'Mukono','Central Zone','Church Road','Allergy','Grace Musoke','Dust allergy','2008-10-10','2025-01-10','Admin'),
(14,'Namanve','East Zone','Factory Road','None','Sarah Kaggwa',null,'2009-06-01','2025-01-10','Admin'),
(15,'Mukono','South Zone','School Road','None','Ruth Kato',null,'2008-02-19','2025-01-10','Admin'),
(16,'Kira','Central Zone','Market Road','Asthma','Jane Nuwagaba','Uses inhaler','2009-03-25','2025-01-10','Admin'),
(17,'Seeta','North Zone','Station Road','None','Mary Mugisha',null,'2008-09-14','2025-01-10','Admin'),
(18,'Mukono','West Zone','Bishop Road','None','Rose Ssekandi',null,'2009-07-07','2025-01-10','Admin'),
(19,'Namanve','Central Zone','Industrial Road','Diabetes','Harriet Kaggwa','Monitored diet','2008-12-22','2025-01-10','Admin'),
(20,'Kira','East Zone','Bulindo Road','None','Grace Kato',null,'2009-05-11','2025-01-10','Admin'),
(21,'Mukono','Central Zone','Jinja Road','None','Betty Ssemanda',null,'2008-04-09','2025-01-10','Admin'),
(22,'Seeta','South Zone','Church Road','Allergy','Sarah Mugisha','Seafood allergy','2009-01-18','2025-01-10','Admin'),
(23,'Kira','West Zone','Market Road','None','Anna Musisi',null,'2008-08-28','2025-01-10','Admin'),
(24,'Mukono','North Zone','School Road','None','Mary Nsubuga',null,'2009-02-06','2025-01-10','Admin'),
(25,'Namanve','Central Zone','Factory Road','Migraine','Ruth Kato','Occasional treatment','2008-11-15','2025-01-10','Admin'),
(26,'Seeta','East Zone','Station Road','None','Grace Mugisha',null,'2009-07-29','2025-01-10','Admin'),
(27,'Mukono','South Zone','Bishop Road','Asthma','Sarah Ssemanda','Uses inhaler','2008-03-12','2025-01-10','Admin'),
(28,'Kira','Central Zone','Bulindo Road','None','Rose Musoke',null,'2009-09-17','2025-01-10','Admin'),
(29,'Namanve','North Zone','Industrial Road','None','Mary Nuwagaba',null,'2008-06-03','2025-01-10','Admin'),
(30,'Mukono','East Zone','Church Road','Allergy','Harriet Kato','Pollen allergy','2009-01-26','2025-01-10','Admin'),
(31,'Seeta','Central Zone','Jinja Road','None','Grace Ssekandi',null,'2008-10-05','2025-01-10','Admin'),
(32,'Kira','South Zone','Market Road','None','Sarah Mugerwa',null,'2009-04-16','2025-01-10','Admin'),
(33,'Mukono','West Zone','School Road','Asthma','Rose Kato','Medication available','2008-07-24','2025-01-10','Admin'),
(34,'Namanve','East Zone','Factory Road','None','Mary Kaggwa',null,'2009-12-02','2025-01-10','Admin'),
(35,'Kira','North Zone','Bulindo Road','None','Harriet Musisi',null,'2008-05-08','2025-01-10','Admin'),
(36,'Mukono','Central Zone','Bishop Road','Migraine','Grace Ssemanda','Occasional headaches','2009-03-31','2025-01-10','Admin'),
(37,'Seeta','South Zone','Station Road','None','Sarah Mugisha',null,'2008-09-20','2025-01-10','Admin'),
(38,'Namanve','West Zone','Industrial Road','Allergy','Rose Nsubuga','Dust allergy','2009-06-14','2025-01-10','Admin'),
(39,'Mukono','North Zone','Church Road','None','Mary Kato',null,'2008-01-27','2025-01-10','Admin'),
(40,'Kira','Central Zone','Market Road','None','Grace Mugisha',null,'2009-08-09','2025-01-10','Admin');

select * from students_info;