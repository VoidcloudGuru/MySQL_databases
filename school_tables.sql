create database student_tables;
use student_tables;

-- student table
create table students(names varchar(50), student_number int, gender varchar(10),
 date_of_birth date, class varchar(30), enrollment_date date, status_of_student varchar(20));
 show tables;
 
 insert into students values
 ( 'Grace', '012001', 'Female', '2003-01-23', 'Senior five', '2026-02-20', 'active'),
 ('Frank', '012002', 'Male', '2002-09-12', 'Senior five', '2026-02-20', 'active'),
 ('Patience', '012003', 'Female', '2004-08-26', 'Senior five', '2026-02-20', 'inactive'),
 ('James', '012004', 'Male', '2003-11-25', 'Senior five', '2026-02-20', 'active'),
 ('Agnes', '012005', 'Female', '2004-10-22', 'Senior five', '2026-02-20', 'active'),
 ('Titus', '012006', 'Male', '2002-04-19', 'Senior five', '2026-02-20', 'inactive');
 
 select * from students;
 
-- student_contacts table
 create table student_contacts(guardian_names varchar(50), 
 phone_numbers varchar(30), relationship varchar(30), emergency_contact varchar(50));
 
 insert into student_contacts values
 ('Magoma Isaac' , '0781903008' , 'Uncle', '0750987235'),
 ('Ssempala Gerald', '0789223456' , 'Father', '0754321875'),
 ('Nakawuki Annet', '0789445367', 'Mother', '0784900877'),
 ('Birunji Grace', '0754990234', 'Sister', '0789334567'),
 ('Abu Ian', '0777345890', 'Father', '0783224889'),
 ('Kakiri Diana', '0784556748', 'Aunt', '0789334222');

select * from student_contacts;

-- classes table
create table classes(class_name varchar(30), stream varchar(30), level varchar(30), capacity int);

insert into classes values
('P1', 'A', 'Primary', 40),
('P2', 'B', 'Primary', 45),
('P3', 'A', 'Primary', 42),
('P5', 'C', 'Primary', 50),
('S1', 'East', 'Secondary', 60),
('S2', 'West', 'Secondary', 55),
('S3', 'North', 'Secondary', 58),
('S4', 'South', 'Secondary', 60),
('S5', 'Arts', 'A-Level', 45),
('S6', 'Science', 'A-Level', 40);

-- subjects table 
create table subjects(subject_name varchar(30), subject_code varchar(20));

insert into subjects values 
('Mathematics', 'MTH'),
('English Language', 'ENG'),
('Physics', 'PHY'),
('Chemistry', 'CHE'),
('Biology', 'BIO'),
('Geography', 'GEO'),
('History', 'HIS'),
('French', 'FRH'),
('Economics', 'ECO'),
('Literature', 'LIT');

-- terms table
create table terms(term_name varchar(20), academic_year year,
 start_date date, end_date date, active_status varchar(20));
 
insert into terms values
('Term I', 2024, '2024-02-05', '2024-05-03', 'Yes'),
('Term II', 2024, '2024-05-27', '2024-08-23', 'No'),
('Term III', 2024, '2024-09-16', '2024-12-06', 'Yes'),
('Term I', 2025, '2025-02-03', '2025-05-02', 'Yes'),
('Term II', 2025, '2025-05-26', '2025-08-22', 'No'),
('Term III', 2025, '2025-09-15', '2025-12-05', 'No'),
('Term I', 2026, '2026-02-02', '2026-05-01', 'No'),
('Term II', 2026, '2026-05-25', '2026-08-21', 'Yes');

-- staff table
create table staff(staff_number int primary key, names varchar(40),
 role varchar(30), phone varchar(30), email varchar(30), hire_date date);
 
insert into staff values
(1001, 'John Ssemwanga', 'Teacher', '0701234567', 'john.ssemwanga@gmail.com', '2020-01-15'),
(1002, 'Sarah Nakato', 'Teacher', '0702345678', 'sarah.nakato@gmail.com', '2019-05-10'),
(1003, 'David Kato', 'Teacher', '0703456789', 'david.kato@gmail.com', '2021-02-20'),
(1004, 'Mary Nansubuga', 'Bursar', '0704567890', 'mary.nansubuga@gmail.com', '2018-08-01'),
(1005, 'Peter Mugisha', 'Admin', '0705678901', 'peter.mugisha@gmail.com', '2022-03-12'),
(1006, 'Grace Atwine', 'Head Teacher', '0706789012', 'grace.atwine@gmail.com', '2017-01-05');
 
 -- class_teacher table
create table class_teacher(staff_number int, class varchar(20), term varchar(20),
primary key (staff_number, class, term),
foreign key (staff_number)
references staff(staff_number)
);

insert into class_teacher values
(1001, 'P5', 'Term I'),
(1002, 'S1', 'Term I'),
(1003, 'S2', 'Term I'),
(1001, 'P5', 'Term II'),
(1002, 'S1', 'Term II'),
(1003, 'S2', 'Term II'),
(1001, 'P5', 'Term III'),
(1002, 'S1', 'Term III'),
(1003, 'S2', 'Term III');

-- subject_teacher table
create table subject_teacher(staff_number int, subject_code varchar(10), class varchar(20),
primary key(staff_number, subject_code, class),
foreign key(staff_number)
references staff(staff_number));

insert into subject_teacher values
(1001, 'MTH', 'P5'),
(1001, 'PHY', 'S2'),
(1001, 'MTH', 'S1'),
(1002, 'ENG', 'P5'),
(1002, 'ENG', 'S1'),
(1002, 'LIT', 'S5'),
(1003, 'CHE', 'S2'),
(1003, 'BIO', 'S3'),
(1003, 'PHY', 'S4');

select *  from staff;	
select * from class_teacher;
select * from subject_teacher;	

use student_tables;
-- fee_types table 
create table fee_types (fee_type varchar(50) primary key);

insert into fee_types values
('Tuition'),
('Development Fee'),
('PTA'),
('Sports'),
('Computer Lab'),
('Lunch'),
('Transport'),
('Uniform');

-- fee_structure table 
create table fee_structure (class varchar(30), fee_type varchar(50), 
term varchar(30), fees decimal(10,2),
foreign key (fee_type) references fee_types(fee_type));

insert into fee_structure values 
('P1','Tuition','Term I',500000),
('P1','Development Fee','Term I',50000),
('P1','PTA','Term II',30000),
('P1','Sports','Term I',20000),
('P2','Tuition','Term I',550000),
('P2','PTA','Term II',30000),
('P2','Sports','Term III',25000),
('P3','Tuition','Term I',600000),
('P3','Computer Lab','Term III',40000),
('P3','Lunch','Term I',100000),
('P3','Transport','Term I',150000);

-- payments table 
create table payments (payment_code varchar(30) primary key, student varchar(50), 
amount_paid decimal(10,2), date_paid date, method enum('Cash','Mobile Money', 'Bank', 'Cheque'),
 reference_number varchar(20));

insert into payments values
('PAY001','Grace',300000,'2026-01-10','Mobile Money','MM123456'),
('PAY002','Frank',500000,'2026-01-12','Bank','BK987654'),
('PAY003','Patience',250000,'2026-01-15','Cash','CASH001'),
('PAY004','James',450000,'2026-01-18','Cheque','CHQ567890'),
('PAY005','Agnes',350000,'2026-01-20','Mobile Money','MM789123'),
('PAY006', 'Titus', 300000, '2026-01-28', 'Bank', 'BK945622');

-- payment_receipts table
create table payment_receipts(receipt_number varchar(20), payment_code varchar(30), issued_by varchar(40),
foreign key (payment_code) references payments(payment_code));

insert into payment_receipts values
('RCP001','PAY001','School Bursar'),
('RCP002','PAY002','School Bursar'),
('RCP003','PAY003','Accounts Clerk'),
('RCP004','PAY004','School Bursar'),
('RCP005','PAY005','Accounts Clerk'),
('RCP006','PAY006','School Bursar');

select * from fee_types;
select * from fee_structure;
select * from payments;
select * from payment_receipts;

-- attendance table 
create table attendance(student varchar(40), date_of_attendance date, 
status enum('Present', 'Absent','Late', 'Excused'), recorded_by varchar(40));

insert into attendance values
('Amina Nansubuga','2026-02-10','Present','Mr. Okello'),
('Brian Kato','2026-02-10','Late','Mr. Okello'),
('Sarah Namutebi','2026-02-10','Absent','Mr. Okello'),
('John Ssemanda','2026-02-10','Present','Ms. Nakato'),
('Grace Nakibuule','2026-02-10','Excused','Ms. Nakato'),
('David Mugisha','2026-02-10','Present','Mr. Kaggwa');

-- exams table 
create table exams(exam_name varchar(50), 
	type enum('End of Term', 'Continuous Assessment', 'Mock', 'UNEB'), term varchar(30));

insert into exams values
('Term I Exams','End of Term','Term I'),
('Term II Exams','End of Term','Term II'),
('CAT 1','Continuous Assessment','Term I'),
('CAT 2','Continuous Assessment','Term II'),
('Mock Exams','Mock','Term III'),
('UNEB 2026','UNEB','Term III');

-- exam_results table 
create table exam_results(marks int, total_marks int, 
grades char(2), student varchar(40), subject varchar(40), exam varchar(30));

insert into exam_results values
(85,100,'A','Amina Nansubuga','Mathematics','Term I Exams'),
(72,100,'B','Brian Kato','English','Term I Exams'),
(91,100,'A','Sarah Namutebi','Biology','CAT 1'),
(64,100,'C','John Ssemanda','Mathematics','CAT 2'),
(78,100,'B','Grace Nakibuule','Physics','Term II Exams'),
(88,100,'A','David Mugisha','English','Mock Exams');
  
-- books table 
create table books(ISBN varchar(13), title varchar(80),
 author varchar(50), subject varchar(30), copies int);
 
 insert into books values
('9780131103627','The C Programming Language','Dennis Ritchie','Computer',5),
('9780201633610','Design Patterns','Erich Gamma','Computer',3),
('9780439023528','The Hunger Games','Suzanne Collins','Literature',7),
('9780747532743','Harry Potter and the Philosopher''s Stone','J.K. Rowling','Literature',10),
('9780525555370','Physics Essentials','James Halliday','Physics', 4),
('9781108747462','Advanced Mathematics','John Bird','Mathematics',6);
 
-- book_loans table 
create table book_loans(borrower varchar(50), loan_date date, due_date date, 
return_date date, fine_amount decimal(10,2));

insert into book_loans values
('Amina Nansubuga','2026-01-15','2026-01-29','2026-01-28',40000.00),
('Brian Kato','2026-01-20','2026-02-03','2026-02-05',5000.00),
('Sarah Namutebi','2026-02-01','2026-02-15','2026-02-14',50000.00),
('John Ssemanda','2026-02-03','2026-02-17','2026-02-20',3000.00),
('Grace Nakibuule','2026-02-10','2026-02-24','2026-02-23',10000.00),
('David Mugisha','2026-02-12','2026-02-26','2026-02-28',2000.00);

 
-- notices table
create table notices(title varchar(40), content varchar(80), audience enum('Students', 'Parents', 'Staff','All'),
posted_date date, expiry date);

insert into notices values
('Opening Day','School opens on 2nd February 2026.','All','2026-01-25','2026-02-05'),
('Sports Day','Annual sports competition on Friday.','Students','2026-03-10','2026-03-20'),
('PTA Meeting','Parents meeting scheduled for Saturday.','Parents','2026-03-15','2026-03-22'),
('Staff Workshop','Teacher training workshop next week.','Staff','2026-04-01','2026-04-10'),
('Mock Examination','Mock exams begin on Monday.','Students','2026-07-01','2026-07-15'),
('Fee Reminder','Outstanding school fees should be cleared.','Parents','2026-05-10','2026-05-31');

select * from notices;