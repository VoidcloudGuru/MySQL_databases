create database student_tables;
use student_tables;

-- student table
create table students( student_id int auto_increment primary key, student_number varchar(20), names varchar(50), gender varchar(10),
 date_of_birth date, class varchar(30), enrollment_date date, status_of_student varchar(20));
 
 insert into students values
 (1, '012001', 'Nantumbwe Grace', 'Female', '2009-01-23', 'Senior one', '2026-02-20', 'active'),
 (2, '012002', 'Basaalwa Frank', 'Male', '2010-09-12', 'Senior two', '2026-02-20', 'active'),
 (3, '012003', 'Ateng Patience', 'Female', '2012-08-26', 'Senior three', '2026-02-20', 'inactive'),
 (4, '012004', 'Ojok James', 'Male', '2012-11-25', 'Senior four', '2026-02-20', 'active'),
 (5, '012005', 'Nakabiri Agnes', 'Female', '2011-10-22', 'Senior five', '2026-02-20', 'active'),
 (6, '012006', 'Mugume Titus', 'Male', '2011-04-19', 'Senior six', '2026-02-20', 'inactive');
 
 select * from students;

-- student_contacts table
 create table student_contacts(student_id int, guardian_names varchar(50), 
 phone_numbers varchar(30), relationship varchar(30), emergency_contact varchar(50),
 foreign key (student_id) references students(student_id));
 
 insert into student_contacts values
 (1, 'Magoma Isaac' , '0781903008' , 'Uncle', '0750987235'),
 (2, 'Ssempala Gerald', '0789223456' , 'Father', '0754321875'),
 (3, 'Nakawuki Annet', '0789445367', 'Mother', '0784900877'),
 (4, 'Birunji Grace', '0754990234', 'Sister', '0789334567'),
 (5, 'Abu Ian', '0777345890', 'Father', '0783224889'),
 (6, 'Kakiri Diana', '0784556748', 'Aunt', '0789334222');

select * from student_contacts;

-- classes table
create table classes(class varchar(30) primary key, stream varchar(30), level varchar(30), capacity int);

insert into classes values
('Senior one', 'South', 'Secondary', 100),
('Senior two', 'North', 'Secondary', 120),
('Senior three', 'East', 'Secondary', 87),
('Senior four', 'West', 'Secondary', 65),
('Senior five', 'Arts', 'A-Level', 178),
('Senior six', 'Science', 'A-Level', 99);

select *  from classes;	

-- subjects table 
create table subjects(subject_name varchar(30), subject_code varchar(20) primary key);

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

select *  from subjects;	

-- terms table
create table terms(term_name varchar(20), academic_year year,
 start_date date, end_date date, active_status varchar(20));
 
insert into terms values
('Term I', 2025, '2025-02-05', '2025', 'Yes'),
('Term II', 2025, '2025-05-27', '2025', 'Yes'),
('Term III', 2025, '2025-09-15', '2025', 'Yes');

select *  from terms;	

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
 
 select *  from staff;	

 -- class_teacher table
create table class_teacher(staff_number int, class varchar(30),
 term varchar(20),
foreign key (staff_number) references staff(staff_number),
foreign key (class) references classes(class)
);

insert into class_teacher values
(1001, 'Senior one', 'Term II'),
(1002, 'Senior two', 'Term II'),
(1003, 'Senior three', 'Term II'),
(1004, 'Senior four', 'Term II'),
(1005, 'Senior five', 'Term II'),
(1006, 'Senior six', 'Term II');

select * from class_teacher;

-- subject_teacher table
create table subject_teacher(staff_number int, subject_code varchar(10), class varchar(30),
foreign key(staff_number) references staff(staff_number),
foreign key (subject_code) references subjects(subject_code),
foreign key (class) references classes(class)
);

insert into subject_teacher values
(1001, 'MTH', 'Senior one'),
(1001, 'PHY', 'Senior three'),
(1001, 'MTH', 'Senior four'),
(1002, 'ENG', 'Senior one'),
(1002, 'ENG', 'Senior two'),
(1002, 'LIT', 'Senior five'),
(1003, 'CHE', 'Senior six'),
(1003, 'BIO', 'Senior five'),
(1003, 'PHY', 'Senior six');

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

select * from fee_types;

-- fee_structure table 
create table fee_structure (fee_structure_id int auto_increment primary key, 
class varchar(30), fee_type varchar(50), 
term varchar(30), fees decimal(10,2),
foreign key (class) references classes(class),
foreign key (fee_type) references fee_types(fee_type));

insert into fee_structure values 
(1, 'Senior one', 'Tuition', 'Term I', 450000),
(2, 'Senior one', 'Development Fee', 'Term I', 50000),
(3, 'Senior one', 'Sports', 'Term I', 20000),
(4, 'Senior one', 'Lunch', 'Term I', 100000),
(5, 'Senior one', 'Tuition', 'Term II', 450000),
(6, 'Senior one', 'Development Fee', 'Term II', 50000),
(7, 'Senior one', 'Sports', 'Term II', 20000),
(8, 'Senior one', 'Lunch', 'Term II', 100000),
(9, 'Senior two', 'Tuition', 'Term I', 500000),
(10, 'Senior two', 'Transport', 'Term I', 150000),
(11, 'Senior two', 'Tuition', 'Term II', 500000),
(12, 'Senior two', 'Transport', 'Term II', 150000),
(13, 'Senior two', 'Sports', 'Term III', 25000),
(14, 'Senior three', 'PTA', 'Term I', 30000),
(15, 'Senior three', 'PTA', 'Term II', 30000),
(16, 'Senior three', 'Computer Lab', 'Term III', 40000),
(17, 'Senior four', 'Tuition', 'Term I', 550000),
(18, 'Senior four', 'Tuition', 'Term II', 550000),
(19, 'Senior five', 'PTA', 'Term I', 30000),
(20, 'Senior five', 'PTA', 'Term II', 30000),
(21, 'Senior six', 'Tuition', 'Term I', 600000),
(22, 'Senior six', 'Tuition', 'Term II', 600000);

select * from fee_structure;

-- payments table 
create table payments (payment_code varchar(30) primary key, student_id int, 
amount_paid decimal(10,2), date_paid date, method enum('Cash','Mobile Money', 'Bank', 'Cheque'),
 reference_number varchar(20),
 foreign key (student_id) references students(student_id));

insert into payments values
('PAY001', 1, 300000,'2026-01-10','Mobile Money','MM123456'),
('PAY002', 2, 500000,'2026-01-12','Bank','BK987654'),
('PAY003', 3, 250000,'2026-01-15','Cash','CASH001'),
('PAY004', 4, 450000,'2026-01-18','Cheque','CHQ567890'),
('PAY005', 5, 350000,'2026-01-20','Mobile Money','MM789123'),
('PAY006', 6, 300000, '2026-01-28', 'Bank', 'BK945622');

select * from payments;

-- payment_receipts table
create table payment_receipts(receipt_number varchar(20), payment_code varchar(30),
issued_by varchar(40),
foreign key (payment_code) references payments(payment_code));

insert into payment_receipts values
('RCP001','PAY001','School Bursar'),
('RCP002','PAY002','School Bursar'),
('RCP003','PAY003','Accounts Clerk'),
('RCP004','PAY004','School Bursar'),
('RCP005','PAY005','Accounts Clerk'),
('RCP006','PAY006','School Bursar');

select * from payment_receipts;

-- attendance table 
create table attendance(student_id int, date_of_attendance date, 
status enum('Present', 'Absent','Late', 'Excused'), recorded_by varchar(40),
foreign key (student_id) references students(student_id));

insert into attendance values
(1, '2026-02-10','Present','Mr. Okello'),
(2, '2026-02-10','Late','Mr. Okello'),
(3, '2026-02-10','Absent','Mr. Okello'),
(4, '2026-02-10','Present','Ms. Nakato'),
(5, '2026-02-10','Excused','Ms. Nakato'),
(6, '2026-02-10','Present','Mr. Kaggwa');

  select * from attendance;


-- exams table 
create table exams(exam_id int auto_increment primary key, 
exam_name varchar(50),
type enum('End of Term', 'Continuous Assessment', 'Mock', 'UNEB'),
term_name varchar(30));

insert into exams values
('Term I Exams','End of Term','Term I'),
('Term II Exams','End of Term','Term II'),
('Term III Exams','End of Term','Term III'),
('CAT 1','Continuous Assessment','Term I'),
('CAT 2','Continuous Assessment','Term II'),
('CAT 3','Continuous Assessment','Term III'),
('Mock Exams','Mock','Term III'),
('UNEB 2026','UNEB','Term III');

  select * from exams;


-- exam_results table 
create table exam_results(result_id int auto_increment primary key,
student_id int, subject_code varchar(20), 
exam_id int, marks int, total_marks int, 
grades char(2),
foreign key (student_id)   references students(student_id),
foreign key (subject_code) references subjects(subject_code),
foreign key (exam_id)      references exams(exam_id));

insert into exam_results values
(1, 'MTH', 2, 85, 100, 'A'), 
(2, 'ENG', 3, 72, 100, 'B'), 
(3, 'BIO', 4, 91, 100, 'A'), 
(4, 'MTH', 5, 64, 100, 'C'), 
(5, 'PHY', 6, 78, 100, 'B'), 
(6, 'ENG', 7, 88, 100, 'A'); 
  
  select * from exam_results;
  
-- books table 
create table books(ISBN varchar(13) primary key, title varchar(80),
 author varchar(50), subject varchar(30), copies int);
 
 insert into books values
('9780131103627','The C Programming Language','Dennis Ritchie','Computer',5),
('9780201633610','Design Patterns','Erich Gamma','Computer',3),
('9780439023528','The Hunger Games','Suzanne Collins','Literature',7),
('9780747532743','Harry Potter and the Philosopher''s Stone','J.K. Rowling','Literature',10),
('9780525555370','Physics Essentials','James Halliday','Physics', 4),
('9781108747462','Advanced Mathematics','John Bird','Mathematics',6);
 
 select * from books;
 
-- book_loans table 
create table book_loans(student_id int, loan_date date, due_date date, 
return_date date, fine_amount decimal(10,2),
foreign key (student_id) references students(student_id));

insert into book_loans values
(1 ,'2026-01-15','2026-01-29','2026-01-28',40000.00),
(2, '2026-01-20','2026-02-03','2026-02-05',5000.00),
(3, '2026-02-01','2026-02-15','2026-02-14',50000.00),
(4,'2026-02-03','2026-02-17','2026-02-20',3000.00),
(5, '2026-02-10','2026-02-24','2026-02-23',10000.00),
(6, '2026-02-12','2026-02-26','2026-02-28',2000.00);

select * from book_loans;
 
-- notices table
create table notices(title varchar(40), content varchar(80),
audience enum('Students', 'Parents', 'Staff','All'),
posted_date date, expiry date);

insert into notices values
('Opening Day','School opens on 2nd February 2026.','All','2026-01-25','2026-02-05'),
('Sports Day','Annual sports competition on Friday.','Students','2026-03-10','2026-03-20'),
('PTA Meeting','Parents meeting scheduled for Saturday.','Parents','2026-03-15','2026-03-22'),
('Staff Workshop','Teacher training workshop next week.','Staff','2026-04-01','2026-04-10'),
('Mock Examination','Mock exams begin on Monday.','Students','2026-07-01','2026-07-15'),
('Fee Reminder','Outstanding school fees should be cleared.','Parents','2026-05-10','2026-05-31');

select * from notices;