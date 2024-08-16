/*DATABASE COMMANDS*/
--create database--
create database acer;

--use database--
use acer;

--delete database--
drop database acer;

/*CREATE TABLE*/
--create employee table--
create table employee(
emp_id int,
emp_name varchar(20),
emp_age int,
emp_gender varchar(20),
emp_salary int,
emp_dept varchar(20),
dept_location varchar(30)
);

--create department table--
create table department(
dept_id int,
dept_name varchar(20),
dept_location varchar(20)
);

/*INSERT VALUES*/
--insert employee values--
insert into employee(emp_id,emp_name,emp_age,emp_gender,emp_salary,emp_dept,dept_location)
values(101,'firoz',22,'male',100000,'developer','hyd'),
      (102,'madhuri',22,'female',90000,'addmin','hyd'),
      (103,'siri',19,'female',30000,'support','chenni'),
      (104,'madhava',20,'male',50000,'tester','banglur'),
      (105,'sam',28,'male',72000,'design','chenni'),
      (106,'gani',30,'male',40000,'analist','kerala'),
      (107,'ammu',25,'female',20000,'support','ladac'),
      (108,'venu',38,'male',60000,'analist','kerala'),
	  (109,'giri',30,'male',60000,'data sintist','panjab'),
	  (110,'raji',20,'female',30000,'support','kochi');

--insert department values--
insert into department(dept_id,dept_name,dept_location)
values(1,'developer','hyd'),
      (2,'tester','bangular'),
	  (3,'addmin','hyd'),
	  (4,'support','chenni'),
	  (5,'analist','kerala'),
	  (6,'transport','kakinada'),
	  (7,'data analist','panjab'),
	  (8,'manager','forn');

/*SELECT STATEMENTS*/
SELECT * FROM EMPLOYEE;
SELECT * FROM DEPARTMENT;

--select statement--
select * from employee;
select emp_id,emp_name from employee;
select emP_name,emp_age from employee;
select emp_dept,emp_id from employee;
select emp_id,emp_salary,emp_gender,emp_dept from employee;

--select distinct--
select distinct emp_gender from employee;
select distinct emp_age from employee;
select distinct emp_dept,emp_gender from employee;
select distinct emp_age,emp_dept,emp_salary from employee;

--whare clause--
select * from employee where emp_salary>50000;
select * from employee where emp_gender='male';
select * from employee where emp_dept='support';
select * from employee where emp_age<25;

/*OPERATORS*/
--AND operator--
select * from employee where emp_gender='male' and emp_salary>50000;
select * from employee where emp_id<105 and emp_dept='addmin';
select * from employee where emp_id<105 and emp_age<25;

--OR operator--
select * from employee where emp_age<30 or emp_gender='female';
select * from employee where emp_id>105 or emp_gender='male';
select * from employee where emp_dept='support' or emp_id<106;

--NOT operator--
select * from employee where not emp_id=105;
select * from employee where not emp_gender='male' 
select * from employee where not emp_salary<50000;

--in operator--
select * from employee where emp_age in (20,22,25,28,30);
select * from employee where emp_salary in (50000,60000,70000,80000,90000,100000);

--like operator--
select * from employee where emp_name like 'm%';
select * from employee where emp_dept like 's%';
select * from employee where emp_age like '2_';
select * from employee where emp_salary like '3000_';
select * from employee where emp_name like '%i%';

--between operator--
select * from employee where emp_age between 20 and 30;
select * from employee where emp_salary between 50000 and 80000;
select * from employee where emp_id between 101 and 104;

/*BASIC FUNCTIONS IN SQL*/
--min()function--
select min(emp_salary)from employee;
select min(emp_age)from employee;
select min(emp_id)from employee;

--max()function--
select max(emp_salary)from employee;
select max(emp_age)from employee;
select max(emp_id)from employee;

--count()function--
select count(emp_id) from employee;
select count(*)from employee where emp_gender='male';
select count(*)from employee where emp_gender='female';

--sum()function--
select sum(emp_salary)from employee;
select sum(emp_salary)from employee where emp_gender='male';
select sum(emp_salary)from employee where emp_gender='female';

--avg()function--
select avg(emp_salary)from employee;
select avg(emp_age)from employee;
select avg(emp_salary)from employee where emp_gender='male';
select avg(emp_salary)from employee where emp_gender='female';

/*STRING FUNCTIONS*/
select ltrim('   firoz');
select lower('FIROZSHAIK');
select upper('firozshaik');
select reverse('firozshaik');
select substring('shaik firoz',7,5);

/*SOME STRING FUNCTIONS*/
--order by--
select * from employee order by emp_age asc;
select * from employee order by emp_age desc;
select * from employee order by emp_salary asc;
select * from employee order by emp_salary desc;

--top--
select top 3 * from employee;
select top 3 * from employee order by emp_salary asc;
select top 3 * from employee order by emp_salary desc;
select top 3 * from employee order by emp_age asc;
select top 3 * from employee order by emp_age desc;
select top 1 * from employee order by  emp_age asc;

/*GROUP BY*/
select min(emp_salary),emp_gender from employee group by emp_gender;
select max(emp_salary),emp_gender from employee group by emp_gender;
select avg(emp_salary),emp_gender from employee group by emp_gender;
select min(emp_age),emp_gender from employee group by emp_gender;
select max(emp_age),emp_gender from employee group by emp_gender;
select avg(emp_age),emp_gender from employee group by emp_gender;

/*HAVING CLAUSE*/
select emp_dept,min(emp_salary)as min_salary
from employee
group by emp_dept;
select emp_dept,avg(emp_salary)as avg_salary
from employee
group by emp_dept;
select emp_dept,max(emp_salary)as max_salary
from employee
group by emp_dept;
select emp_dept,min(emp_salary)as min_salary
from employee
group by emp_dept
having min(emp_salary)>50000;
select emp_dept,avg(emp_salary)as avg_salary
from employee
group by emp_dept
having avg(emp_salary)>40000;
select emp_dept,max(emp_salary)as max_salary
from employee
group by emp_dept
having max(emp_salary)>50000;

/*UPDATE STATEMENT*/
update employee set emp_name='ravi' where emp_id=108;
update employee set dept_location='chenni' where emp_id=107;
update employee set emp_salary=22000 where emp_name='ammu';
update emp set salary=30000 where emp_qualification='mca';
--select command--
select * from employee;

/*DELETE STATEMENT*/
delete from employee where e_name='manoj';
delete from employee where e_salary=18000;
delete from employee where e_dept='tester';

/*TRUNCATE STATEMENT*/
truncate table employee;
truncate table dept;
--select statement--
select * from employee;
select * from dept;

/*ALTER STATEMENT*/
--alter table add column--
alter table dept add dept_name varchar(20);
alter table dept add dept_location varchar(30);
alter table dept add email varchar(20);
alter table dept add age int;
alter table dept add sal int;
--SELECT--
select * from dept;

--alter table drop column--
alter table employee drop column dept_location;
alter table dept drop column dept_location;
alter table dept drop column email;
alter table dept drop column age;
alter table dept drop column sal;
alter table dept drop column deptname;
alter table dept drop column deptid;
--SELECT--
select * from dept;

/*JOIN IN SQL*/
select * from employee;
select * from department;

--inner join--
select employee.emp_name,employee.emp_dept,
       department.dept_name,department.dept_location
	   from employee
	   inner join department
	   on employee.emp_dept=department.dept_name;

--left join--
select employee.emp_name,employee.emp_dept,
       department.dept_name,department.dept_location
	   from employee
	   left join department
	   on employee.emp_dept=department.dept_name;

--right join--
select employee.emp_name,employee.emp_dept,
       department.dept_name,department.dept_location
	   from employee
	   right join department
	   on employee.emp_dept=department.dept_name;

--full join--
select employee.emp_name,employee.emp_dept,
       department.dept_name,department.dept_location
	   from employee
	   full join department
	   on employee.emp_dept=department.dept_name;

--update using join--
update employee set emp_age=emp_age+3
from employee
join department 
on employee.emp_dept=department.dept_name
where dept_location='kerala';
update employee set emp_salary=emp_salary-1000
from employee
join department
on employee.emp_dept=department.dept_name
where dept_location='chenni';
update employee set emp_salary=emp_salary+10000
from employee
join department
on employee.emp_dept=department.dept_name
where dept_location='hyd';

--delete using in join--
delete employee 
from employee
join department
on employee.emp_dept=department.dept_name
where dept_location='bangular';

delete employee
from employee
join department
on employee.emp_dept=department.dept_name
where dept_location='kakinada';

/*UNION OPERATOR*/
--create tables student1--
create table student1(
std_id int,
std_name varchar(20),
std_marks int
);

--create table student2--
create table student2(
std_id int,
std_name varchar(20),
std_marks int
);

--insert values student1 table--
insert into student1(std_id,std_name,std_marks)
values(1,'firoz',100),
      (2,'madhuri',99),
	  (3,'siri',55),
	  (4,'madhava',70),
	  (5,'ammu',88);

--insert values student2 table--
insert into student2(std_id,std_name,std_marks)
values(4,'madhava',70),
	  (5,'ammu',88),
	  (6,'gani',77),
	  (7,'hani',45),
	  (8,'hari',35);

--select statements--
select * from student1;
select * from student2;

--UNION OPERATOR--
select * from student1
union 
select * from student2;

--union all operator--
select * from student1
union all
select * from student2;

--except operator--
select * from student1
except
select * from student2;

--intersect operator--
select * from student1
intersect
select * from student2;

/*VIEWS*/
--view female_employee--
create view female_employees as
select * from employee
where emp_gender='female';
--select
select * from female_employees;

--view male_employee--
create view male_employees as
select * from employee
where emp_gender='male';
--select
select * from male_employees;

/*drop view*/
--drop view female_employee--
drop view female_employees;
--select
select * from female_employees;

--drop view male_employee--
drop view male_employees;
--select
select * from male_employees;
