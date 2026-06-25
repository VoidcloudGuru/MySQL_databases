use school_enrollment;

-- fees Payments
create table fees_structure_primary(fees decimal(10,2), class varchar(40), term_id int);
insert into fees_structure(fees,class,term_id) values
(500000.00,'P1',1),
(520000.00,'P2',1),
(540000.00,'P3',1),
(560000.00,'P4',1),
(580000.00,'P5',1),
(600000.00,'P6',1),
(620000.00,'P7',1),
(750000.00,'S1',1),
(800000.00,'S2',1),
(850000.00,'S3',1),
(900000.00,'S4',1);

create table student_invoices(invoice_id int primary key auto_increment, enrolment_id int,
total_charged decimal(10,2), discount decimal(10,2) default 0.00,
total_paid decimal(10,2) default 0.00, 
balance decimal(10,2)  generated always as (total_charged - discount - total_paid) stored,
foreign key (enrolment_id) references students(id));

insert into student_invoices
(enrolment_id,total_charged,discount,total_paid)
values
(1,500000,0,300000),
(2,500000,10000,490000),
(3,520000,0,250000),
(4,520000,20000,500000),
(5,540000,0,300000),
(6,540000,15000,400000),
(7,560000,0,560000),
(8,560000,10000,300000),
(9,580000,0,200000),
(10,580000,30000,500000),
(11,600000,0,600000),
(12,600000,0,250000),
(13,620000,20000,500000),
(14,620000,0,620000),
(15,750000,50000,600000),
(16,750000,0,400000),
(17,800000,0,700000),
(18,800000,25000,600000),
(19,850000,0,850000),
(20,850000,0,500000),
(21,900000,50000,700000),
(22,900000,0,300000);

select * from student_invoices;

create table invoice_line_items(item_id int primary key auto_increment,invoice_id int,
fee_type varchar(30), amount decimal(10,2), discount decimal(10,2),
foreign key (invoice_id) references student_invoices(invoice_id));

insert into invoice_line_items
(invoice_id, fee_type, amount, discount) values
(1,'Tuition',450000,0),
(1,'Development',50000,0),
(2,'Tuition',450000,10000),
(2,'Development',50000,0),
(3,'Tuition',470000,0),
(3,'Development',50000,0),
(4,'Tuition',470000,20000),
(4,'Development',50000,0),
(5,'Tuition',490000,0),
(5,'Development',50000,0),
(6,'Tuition',490000,15000),
(6,'Development',50000,0),
(7,'Tuition',510000,0),
(7,'Development',50000,0),
(8,'Tuition',510000,10000),
(8,'Development',50000,0),
(9,'Tuition',530000,0),
(9,'Development',50000,0),
(10,'Tuition',530000,30000),
(10,'Development',50000,0),
(11,'Tuition',550000,0),
(11,'Development',50000,0),
(12,'Tuition',550000,0),
(12,'Development',50000,0),
(13,'Tuition',570000,20000),
(13,'Development',50000,0),
(14,'Tuition',570000,0),
(14,'Development',50000,0),
(15,'Tuition',700000,50000),
(15,'Development',50000,0),
(16,'Tuition',700000,0),
(16,'Development',50000,0),
(17,'Tuition',750000,0),
(17,'Development',50000,0),
(18,'Tuition',750000,25000),
(18,'Development',50000,0),
(19,'Tuition',800000,0),
(19,'Development',50000,0),
(20,'Tuition',800000,0),
(20,'Development',50000,0),
(21,'Tuition',850000,50000),
(21,'Development',50000,0),
(22,'Tuition',850000,0),
(22,'Development',50000,0);

select * from invoice_line_items;

-- payment methods Cash / mobile money / bank.
create table payments(invoice_id int, amount_paid decimal(10,2), 
payment_method enum('Cash','mobile money', 'bank'), receipt_no int unique, received_by varchar(40),
foreign key(invoice_id) references student_invoices(invoice_id));

insert into payments(invoice_id, amount_paid, payment_method, receipt_no, received_by) 
values
(1,300000.00,'Cash',10001,'Mr. John Okello'),
(2,490000.00,'mobile money',10002,'Ms. Sarah Namukasa'),
(3,250000.00,'Cash',10003,'Mr. David Kato'),
(4,500000.00,'bank',10004,'Mr. John Okello'),
(5,300000.00,'mobile money',10005,'Ms. Sarah Namukasa'),
(6,400000.00,'Cash',10006,'Mr. David Kato'),
(7,560000.00,'bank',10007,'Mr. John Okello'),
(8,300000.00,'Cash',10008,'Ms. Sarah Namukasa'),
(9,200000.00,'mobile money',10009,'Mr. David Kato'),
(10,500000.00,'bank',10010,'Mr. John Okello'),
(11,600000.00,'Cash',10011,'Ms. Sarah Namukasa'),
(12,250000.00,'mobile money',10012,'Mr. David Kato'),
(13,500000.00,'bank',10013,'Mr. John Okello'),
(14,620000.00,'Cash',10014,'Ms. Sarah Namukasa'),
(15,600000.00,'mobile money',10015,'Mr. David Kato'),
(16,400000.00,'Cash',10016,'Mr. John Okello'),
(17,700000.00,'bank',10017,'Ms. Sarah Namukasa'),
(18,600000.00,'mobile money',10018,'Mr. David Kato'),
(19,850000.00,'bank',10019,'Mr. John Okello'),
(20,500000.00,'Cash',10020,'Ms. Sarah Namukasa'),
(21,700000.00,'mobile money',10021,'Mr. David Kato'),
(22,300000.00,'Cash',10022,'Mr. John Okello');

select * from payments;