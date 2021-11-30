#UC1 
show databases;
create database payroll_servece;
use payroll_servece;
select database();



#UC2
create table empPayroll(
id   int  auto_increment not null,
name   varchar(20) not null,
salary  double not null,

start date,
primary key(id)

);
describe empPayroll;

#UC 3
insert into empPayroll (
name,
salay,
start
) value
("vishal",20000,'2021-06-11'),
("raj",30000,'2010-06-20'),
("vidhi",40000,'2022-06-20');
#uc4
select * from empPayroll;

#uc5
select * from empPayroll where salay=20000;
select salay from empPayroll where name="vishal";

select * from empPayroll
 where start between cast('2000-06-11' as date) and date(now());
 
 select * from empPayroll
 where salay between 10000 and 30000;

#uc6
alter table empPayroll add gender char(1) after name;
describe empPayroll;
set sql_safe_updates=0;
update empPayroll set gender='F' where name='vidhi';

set sql_safe_updates=1;
select * from empPayroll;
set sql_safe_updates=0;
update empPayroll set gender="M" where name='vishal' or name='raj';
set sql_safe_updates=1;

select * from empPayroll;
#uc7
select gender,avg(salay) from empPayroll where gender='M' group by gender;
select gender,sum(salay) from empPayroll  group by gender;
select gender,count(name) from empPayroll group by gender;
select gender,avg(salay) from empPayroll group by gender;

#practice
alter table empPayroll add emp_phone double, add emp_adress varchar(20);
describe empPayroll;
set sql_safe_updates=0;
update empPayroll set emp_phone=8888884188  where name='vishal';
set sql_safe_updates=1;
select * from empPayroll;
set sql_safe_updates=0;
update empPayroll set emp_phone=888888778  where name='vidhi';
set sql_safe_updates=1;
set sql_safe_updates=0;
set sql_safe_updates=1;
select * from empPayroll;
ALTER TABLE empPayroll DROP COLUMN emp_phone;
ALTER TABLE empPayroll DROP COLUMN emp_adress;


#uc8
alter table empPayroll add emp_number double , add emp_adress varchar(20) default"india", add department varchar(20) not null after name;
insert into empPayroll (name,department,gender,salay,start) value("shridi","sales","F",60000,"2021-11-30");

#UC9
alter table empPayroll rename column salay to Basic_Pay;
alter table empPayroll add deduction int not null after Basic_Pay,add taxable_pay int after deduction,add income_tax int not null after deduction;
alter table empPayroll add net_pay int after income_tax;

#UC11
create table department(
Emp_id int not null auto_increment,
department varchar(10) not null,
primary key(Emp_id)
);
select * from department;
alter table department rename column Emp_id to Dep_id;
insert into department(Emp_id,department) values (101,"sales"),
                                                (102,"marketing");
                                                
CREATE TABLE Emp_table AS SELECT * FROM empPayroll;
select * from  Emp_table;
alter table Emp_table drop column department;
											