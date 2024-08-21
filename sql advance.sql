/*CREATE DATABASE*/

create database employee;

/*DROP DATABASE*/

drop database employee;

/*CREATE TABLE*/

create table employee(
id int not null,
name varchar (20) not null,
age int check (age<60),
department varchar(20),
salary float,
gender varchar(20),
primary key(id)
);


create table employeedetails(
id int not null,
employeeaddress varchar(20),
employeelocation varchar(20)
);

create table projectdetails(
id int not null,
projectname varchar(20),
projectcost int
);

/*INSERT VALUES*/

insert into employee(id,name,age,department,salary,gender)
values(1,'SK firoz',22,'sqlserver',120000,'male'),
      (2,'S madhuri',22,'sqlserver',110000,'female'),
	  (3,'S madhava',20,'python',80000,'male'),
	  (4,'V srinath',36,'addmin',300000,'male'),
	  (5,'V mouni',32,'addmin',200000,'female'),
	  (6,'SK misba',35,'tester',100000,'male'),
	  (7,'V mani',29,'python',80000,'male'),
	  (8,'R siri',25,'hr',40000,'female'),
	  (9,'SK shahan',39,'hr',50000,'male'),
	  (10,'T tulasi',19,'python',23000,'female'),
	  (11,'S padhma',36,'manager',56000,'female'),
	  (12,'K jani',30,'python',35000,'male'),
	  (13,'D ram',44,'addmin',90000,'male'),
	  (14,'S ammu',22,'sqlserver',40000,'female'),
	  (15,'CH chandra',50,'hr',60000,'male'),
	  (16,'N giri',43,'tester',32000,'female'),
	  (17,'Z raji',21,'python',20000,'female'),
	  (18,'M kiran',37,'tester',30000,'male'),
	  (19,'F vinni',52,'hr',72000,'female'),
	  (20,'D ravi',59,'manager',80000,'male');


insert into employeedetails(id,employeeaddress,employeelocation)
values(1,'nellore','hyd'),
      (2,'nellore','hyd'),
	  (4,'kavali','gujarat'),
	  (5,'kavali','gujarath'),
	  (6,'panjab','puni'),
	  (7,'vijavada','andaman'),
	  (11,'rajamandri','nellore'),
	  (14,'kerala','kochi');


insert into projectdetails(id,projectname,projectcost)
values(1,'stock marcket',60000),
      (2,'mechin learning',60000),
	  (3,'financial',50000),
	  (4,'health care',100000),
	  (5,'health care',100000),
	  (7,'hotal management',20000),
	  (11,'govt',50000),
	  (14,'prediction',90000),
	  (15,'java',70000),
	  (16,'python',30000),
	  (19,'cyber security',75000);

/*SELECT STATEMENTS*/

select * from employee;
select * from employeedetails;
select * from projectdetails;

drop table employee;
drop table employeedetails;
drop table projectdetails;

select id,name,department from employee;
select name,department,salary from employee;
select employeeaddress,employeelocation from employeedetails;

/* AS ALIAS*/

select id as 'EMPLOYEE ID',name as 'EMPLOYEE NAME',department as 'EMPLOYEE DEPARTMENT',salary as 'EMPLOYEE SALARY' from employee;
select id as 'EMPLOYEE ID',employeeaddress as 'ADDRESS',employeelocation as 'LOCATION' from employeedetails;

/*DISTINCT COMMAND*/

select distinct department from employee;
select distinct employeeaddress from employeedetails;

/*DELETE COMMAND*/

delete from employee where salary=32000;
delete from employee where name='giri';

/*TRUNCATE COMMAND*/

truncate table employee;
truncate table employeedetails;

/*ALTER COMMAND*/
               --Add column
alter table employee add groupid int;
alter table employee add genaration varchar(20);
               --delete column
alter table employee drop column groupid;
alter table employee drop column genaration;
               --add constraint
alter table employee add constraint pk_id primary key(id);
alter table employee add constraint uQ_name unique(name);
alter table employee add constraint ck_age check(age<60);
               --delete constraint
alter table employee drop constraint PK_id;
alter table employee drop constraint uQ_name;
alter table employee drop constraint ck_age;
                --modify datatype
alter table employeedetails alter column employeeaddress text;
alter table employee alter column salary float;
alter table employee alter column name char;

/*UPDATE COMMAND*/

update employee set age=45 where name='N giri';
update employee set name='K rahul' where id=20;
update employee set id=22 where name='K rahul';
update employee set id=24 where name='Z raji';
update employeedetails set id=26 where employeelocation='kochi';
update employeedetails set id=25 where employeelocation='nellore';

/*WHERE CLOUSE*/

select * from employee where salary>50000;
select name,salary,department from employee where gender='male';
select employeeaddress as 'ADDRESS',employeelocation as 'LOCATION' from employeedetails where employeelocation='hyd';

/*OPARATERS IN SQL*/
                 --AND operater
select * from employee where gender='male' and department='sqlserver';
select * from employee where age<30 and gender='female';
                 --OR operater
select * from employee where gender='female' or age>30;
select * from employee where department='python' or department='hr';
                 --NOT operator
select * from employee where not gender='male';
select * from employee where not id<12;
                --IN operater
select * from employee where department in('sqlserver','python','addmin');
select * from employee where age in(20,22,225,30,32,35,40,45,50,59);
                --BETWEEN operator
select * from employee where id between 3 and 12;
select * from employee where salary between 40000 and 150000;
               --LIKE operators
select * from employee where name like 's%';
select * from employee where name like '%i';

select * from employee where age like '2_';
select * from employee where salary like '____0';

/*ORDER BY CLOUSE*/

select * from employee order by salary asc;
select name,department,age,salary from employee order by age desc;
select name,salary from employee order by name asc;

/*TOP CLOUSE*/

select top 3* from employee;
select top 4 * from employee order by salary desc;
select top 1 * from(select top 3 * from employee order by salary desc)employee order by salary asc;
select top 2 * from (select top 5 * from employee order by age asc)employee order by age desc;
select top 1 * from (select top 2 * from employee order by age asc)employee order by age desc;

/*TOP PERCENT*/

select top 20 percent * from employee;
select top 80 percent * from employee order by salary desc;

/*STRING FUNCTIONS*/

select ltrim('      this is gun')as ltrim;
select upper('this is firoz')as uppercase;
select lower('THIS IS FIROZ')as lowercase;
select reverse('i love you')as reverse;
select len('firozshaik')as length;
select substring('this is firoz',9,5)as substring;

/*SCALAR FUNCTIONS*/

select ltrim(name),*  from employee;
select upper(name),* from employee;
select lower(name),* from employee;
select reverse(name),* from employee;
select len(name),* from employee;
select substring(name,3,10) from employee;

/*AGGRIGATE FUNCTIONS*/

select min(salary)as min_salary from employee;
select max(salary)as max_salary from employee;
select avg(salary)as avg_salary from employee;
select sum(salary)as totalsalary from employee;
select count(*)as countofemployee from employee;

                  --Advanced aggrigate functions

select min(salary)as min_salary,
       max(salary)as max_salary,
	   avg(salary)as avg_salary,
	   sum(salary)as totalsalary,
	   count(*)as countofemployee
from employee;


select * from employee where id=(SELECT min(id) from employee);
select * from employee where id=(select max(id) from employee);
select * from employee where id!=(SELECT min(id) from employee);
select * from employee where id!=(select max(id) from employee);

/*GROUP BY CLOUSE*/

select department,min(salary)as min_salary from employee group by department;
select department,max(salary)as max_salary from employee group by department;
select department,avg(salary)as avg_salary from employee group by department;
select department,sum(salary)as total_salary from employee group by department;
select department,count(*)as countofemployees from employee group by department;
               
			           --Advanced GROUP BY functions

select department,min(salary)as min_salary,
                  max(salary)as max_salary,
				  avg(salary)as avg_salary,
				  sum(salary)as total_salary,
				  count(*)as countofemployees 
from employee group by department;

select department,min(salary)as min_salary from employee where gender='male' group by department order by min_salary asc;
select department,max(salary)as max_salary from employee where gender='female' group by department order by min_salary desc;
select department,avg(salary)as avg_salary from employee where department in('sqlserver','hr','python') group by department order by avgsalary asc;
select department,sum(salary)as totalsalary from employee where gender='male' group by department order by totalsalary asc;
select department,count(*)as employees from employee where gender='male' group by department order by employees asc;
select department,count(*)as employees from employee where gender='female' group by department order by employees asc;

/*HAVING CLOUSE*/

select department,min(salary)as min_salary from employee group by department having min(salary)<50000;
select department,max(salary)as max_salary from employee group by department having max(salary)>90000;
select department,avg(salary)as avg_salary from employee group by department having avg(salary)<70000;
select department,sum(salary)as total_salary from employee group by department having sum(salary)<200000;
select department,count(*)as countofemployees from employee group by department having count(*)=2;
          
		  --Advanced HAVING clouse
select department,min(salary)as min_salary from employee group by department having department in('sqlserver','hr','python');
select department,max(salary)as max_salary from employee where gender='male' group by department having department in('sqlserver','hr','python');
select department,avg(salary)as avg_salary from employee where gender='female' group by department having department in('hr','python','manager','sqlserver');
select department,sum(salary)as total_salary from employee where  gender='female' group by department having department='python';
select department,count(*)as countofemployees from employee where gender='female' group by department having count(*)=1;
select department,count(*)as countofemployees from employee where gender='male'group by department having count(*)>2;

/*joints*/
          --Combining Two tables
--*INNER JOIN*--
select * from employee inner join employeedetails on employee.id=employeedetails.id;

--*LEFT JOIN*--
select * from employee left join employeedetails on employee.id=employeedetails.id;

--*RIGHT JOIN*--
select * from employee right join employeedetails on employee.id=employeedetails.id;

--*FULL JOIN*--
select * from employee full join employeedetails on employee.id=employeedetails.id;

--*CROSS JOIN*--
select * from employee cross join employeedetails;

select e.id as 'EMPLOYEE ID',e.name as 'EMPLOYEE NAME',e.salary as 'EMPLOYEE SALARY',e.department as 'EMPLOYEE DEPARTMENT',
ed.employeeaddress as 'ADDRESS',ed.employeelocation as 'LOCATION' from employee e
inner join employeedetails ed on e.id=ed.id;
select e.id as 'EMPLOYEE ID',e.name as 'EMPLOYEE NAME',e.salary as 'EMPLOYEE SALARY',e.department as 'EMPLOYEE DEPARTMENT',
ed.employeeaddress as 'ADDRESS',ed.employeelocation as 'LOCATION' from employee e
left join employeedetails ed on e.id=ed.id;
select e.id as 'EMPLOYEE ID',e.name as 'EMPLOYEE NAME',e.salary as 'EMPLOYEE SALARY',e.department as 'EMPLOYEE DEPARTMENT',
ed.employeeaddress as 'ADDRESS',ed.employeelocation as 'LOCATION' from employee e
right join employeedetails ed on e.id=ed.id;
select e.id as 'EMPLOYEE ID',e.name as 'EMPLOYEE NAME',e.salary as 'EMPLOYEE SALARY',e.department as 'EMPLOYEE DEPARTMENT',
ed.employeeaddress as 'ADDRESS',ed.employeelocation as 'LOCATION' from employee e
full join employeedetails ed on e.id=ed.id;
select e.id as 'EMPLOYEE ID',e.name as 'EMPLOYEE NAME',e.salary as 'EMPLOYEE SALARY',e.department as 'EMPLOYEE DEPARTMENT',
ed.employeeaddress as 'ADDRESS',ed.employeelocation as 'LOCATION' from employee e
cross join employeedetails ed;

        ----Combining Three tables

select * from employee 
inner join employeedetails 
on employee.id=employeedetails.id
inner join projectdetails 
on projectdetails.id=employee.id;

select * from employee 
left join employeedetails 
on employee.id=employeedetails.id
left join projectdetails 
on projectdetails.id=employee.id;

select * from employee 
right join employeedetails 
on employee.id=employeedetails.id
right join projectdetails 
on projectdetails.id=employee.id;

select * from employee 
full join employeedetails 
on employee.id=employeedetails.id
full join projectdetails 
on projectdetails.id=employee.id;

select * from employee 
cross join employeedetails 
cross join projectdetails;

select e.id as 'EMPLOYEE ID',e.name as 'EMPLOYEE NAME',e.salary as 'EMPLOYEE SALARY',e.department as 'EMPLOYEE DEPARTMENT',
ed.employeeaddress as 'ADDRESS',ed.employeelocation as 'LOCATION',pj.projectname as 'PROJECTNAME',projectcost as 'COST' 
from employee e
inner join employeedetails ed on e.id=ed.id
inner join projectdetails pj on pj.id=e.id;

select e.id as 'EMPLOYEE ID',e.name as 'EMPLOYEE NAME',e.salary as 'EMPLOYEE SALARY',e.department as 'EMPLOYEE DEPARTMENT',
ed.employeeaddress as 'ADDRESS',ed.employeelocation as 'LOCATION',pj.projectname as 'PROJECTNAME',projectcost as 'COST' 
from employee e
inner join employeedetails ed on e.id=ed.id
inner join projectdetails pj on pj.id=e.id;

select e.id as 'EMPLOYEE ID',e.name as 'EMPLOYEE NAME',e.salary as 'EMPLOYEE SALARY',e.department as 'EMPLOYEE DEPARTMENT',
ed.employeeaddress as 'ADDRESS',ed.employeelocation as 'LOCATION',pj.projectname as 'PROJECTNAME',projectcost as 'COST' 
from employee e
left join employeedetails ed on e.id=ed.id
left join projectdetails pj on pj.id=e.id;

select e.id as 'EMPLOYEE ID',e.name as 'EMPLOYEE NAME',e.salary as 'EMPLOYEE SALARY',e.department as 'EMPLOYEE DEPARTMENT',
ed.employeeaddress as 'ADDRESS',ed.employeelocation as 'LOCATION',pj.projectname as 'PROJECTNAME',projectcost as 'COST' 
from employee e
right join employeedetails ed on e.id=ed.id
right join projectdetails pj on pj.id=e.id;

select e.id as 'EMPLOYEE ID',e.name as 'EMPLOYEE NAME',e.salary as 'EMPLOYEE SALARY',e.department as 'EMPLOYEE DEPARTMENT',
ed.employeeaddress as 'ADDRESS',ed.employeelocation as 'LOCATION',pj.projectname as 'PROJECTNAME',projectcost as 'COST' 
from employee e
full join employeedetails ed on e.id=ed.id
full join projectdetails pj on pj.id=e.id;

select e.id as 'EMPLOYEE ID',e.name as 'EMPLOYEE NAME',e.salary as 'EMPLOYEE SALARY',e.department as 'EMPLOYEE DEPARTMENT',
ed.employeeaddress as 'ADDRESS',ed.employeelocation as 'LOCATION',pj.projectname as 'PROJECTNAME',projectcost as 'COST' 
from employee e
cross join employeedetails ed 
crosss join projectdetails pj;

        --Advanced JOIN concepts

select * from employee e left join employeedetails ed on e.id=ed.id where ed.id is null;
select * from employee e right join employeedetails ed on e.id=ed.id where e.id is null;
select * from employee e left join employeedetails ed on e.id=ed.id where e.id is null;
select * from employee e right join employeedetails ed on e.id=ed.id where ed.id is null;

select min(e.salary)as min_salary from employee e inner join employeedetails ed on e.id=ed.id;
select min(e.salary)as min_salary from employee e left join employeedetails ed on e.id=ed.id;
select min(e.salary)as min_salary from employee e right join employeedetails ed on e.id=ed.id;
select min(e.salary)as min_salary from employee e full join employeedetails ed on e.id=ed.id;

select e.department,count(e.id)as countofemployees from employee e
inner join employeedetails ed on e.id=ed.id group by e.department;

select e.department,count(e.id)as countofemployees from employee e
left join employeedetails ed on e.id=ed.id group by e.department;

select e.department,count(e.id)as countofemployees from employee e
right join employeedetails ed on e.id=ed.id group by e.department;

select e.department,count(e.id)as countofemployees from employee e
full join employeedetails ed on e.id=ed.id group by e.department;

select e.department,count(e.id)as countofemployees from employee e
cross join employeedetails ed group by e.department;

select sum(e.salary + p.projectcost)as totalmoney from employee e inner join projectdetails p on e.id=p.id;
select count(e.id + p.id)as totalmoney  from employee e left join projectdetails p on e.id=p.id;
select min(e.salary + p.projectcost)as totalmoney  from employee e right join projectdetails p on e.id=p.id;
select sum(e.salary - p.projectcost)as totalmoney  from employee e full join projectdetails p on e.id=p.id;
select sum(e.salary + p.projectcost)as totalmoney  from employee e cross join projectdetails p;

/*SELF JOINs*/

select A.name,B.name,A.department,B.salary from employee A,employee B where A.id=B.id;

select A.name as 'EMPLOYEENAME',B.name as 'EMPLOYEENAME',A.department as 'DEPARTMENT',
B.salary as 'SALARY' from employee A,employee B where A.id=B.id;

/*CREATE TABLES*/

create table student1(
s_id int,
s_name varchar(20),
s_salary float
);

create table student2(
s_id int,
s_name varchar(20),
s_salary float
);

/*INSERT VALUES*/

insert into student1 values(1,'firoz',10000),
                           (2,'madhuri',9000),
						   (3,'madhava',6000),
						   (4,'srinath',12000),
						   (5,'mouni',11000),
						   (6,'siri',3000),
						   (7,'gani',4000);

insert into student2 values(1,'rafi',6000),
                           (2,'shahid',5000),
						   (3,'madhava',6000),
						   (4,'siri',3000),
						   (5,'mouni',11000),
						   (6,'siri',3000),
						   (7,'rani',1000);

						  
/*UNIONS*/

select * from student1;
select * from student2;

--*UNION*--
select * from student1
union
select * from student2;

--*/UNION ALL*/--
select * from student1
union all
select * from student2;

--/*EXCEPT*/--
select * from student1
except
select * from student2;

--/*INTERSECT*/--
select * from student1
intersect
select * from student2;

/*VIEWS*/
--Create views
create view male_employees as
select * from employee where gender='male';

select * from male_employees;

create view python_employees as
select * from employee where department='python';

select * from python_employees;

create view fresher_employees as
select * from employee where salary<40000;

select * from fresher_employees;

create view group_employees as
select department,count(*)as countofemployees from employee group by department;

select * from group_employees;

--DELETE views

drop view male_employees;
drop view python_employees;
drop view fresher_employees;
drop view group_employees;

/*CTE [COMMON TABLE EXPRESSION]*/

with employeeble (id,name,salary,department)
as(select id,name,salary,department from employee)
select * from employeeble;

with highemployees
as (select * from employee where salary>60000)
select * from highemployees;

with group_employees
as(select department,min(salary)as min_salary from employee group by department)
select * from group_employees;

with group_employees
as(select department,max(salary)as max_salary from employee group by department)
select * from group_employees;

with group_employees
as(select department,avg(salary)as avg_salary from employee group by department)
select * from group_employees;

with group_employees
as(select department,sum(salary)as totalsalary from employee group by department)
select * from group_employees;

with group_employees
as(select department,count(*)as countofemployees from employee group by department)
select * from group_employees;

with sqlserver_employees
as(select * from employee where department='sqlserver'),
addmin_employees
as(select * from employee where department='addmin')
select * from sqlserver_employees
union all
select * from addmin_employees;

with employeeble
as (select * from employee),
details 
as(select * from employeedetails),
project 
as(select * from projectdetails)
select * from employeeble e inner join details d on e.id=d.id inner join project p on p.id=e.id;

with employeeble
as (select * from employee),
details 
as(select * from employeedetails),
project 
as(select * from projectdetails)
select * from employeeble e left join details d on e.id=d.id left join project p on p.id=e.id;

with employeeble
as (select * from employee),
details 
as(select * from employeedetails),
project 
as(select * from projectdetails)
select * from employeeble e right join details d on e.id=d.id right join project p on p.id=e.id;

with employeeble
as (select * from employee),
details 
as(select * from employeedetails),
project 
as(select * from projectdetails)
select * from employeeble e full join details d on e.id=d.id full join project p on p.id=e.id;

with employeeble
as (select * from employee),
details 
as(select * from employeedetails),
project 
as(select * from projectdetails)
select * from employeeble e cross join details d cross join project p;

--CREATE DUPLICATE TABLE

select * into employeeble from employee;

select * from employeeble;

--CREATE DUPLICATE EMPTY TABLE

select * into employeeempty from employee where id=0;

select * from employeeempty;

/*INDEX*/
--CREATE INDEX
create index myindex on employee(name);
create index myindex2 on employee(department);
create index myindex3 on employee(name,age);

--DROP INDEX
drop index employee.myindex;
drop index employee.myindex2;
drop index employee.myindex3;

/*WINDOW FUNCTIONS*/

  --*AGGRIGATE WINDOW FUNCTIONS*--

select *,min(salary)as min_salary from employee;
select *,max(salary)over()max_salary from employee;
select *,min(salary)over()min_salary from employee;
select *,avg(salary)over()avg_salary from employee;
select *,sum(salary)over()totalsalary from employee;
select *,count(*)over()countofemployees from employee;

--*RANK WINDOW FUNCTIONS*--

--ROW_NUMBER() FRNCTION

select *,row_number()over(order by salary desc)as rownum from employee;

select id,name,department,salary,row_number()over(partition by department order by salary desc)as rownum from employee;

select * from 
(select id,name,department,salary,age,
        row_number()over(order by salary desc)as rownum from employee)
employee where rownum between 4 and 16;

--RANK() FUNCTION

select *,rank()over(order by salary desc)as ranks from employee;

select id,name,department,salary,rank()over(partition by department order by salary desc)as ranks from employee;

select * from 
(select id,name,department,salary,age,
        rank()over(partition by department order by salary desc)as ranks from employee)
employee where ranks=1;

--DENSE_RANK()

select *,dense_rank()over(order by salary desc)as denseranks from employee;

select id,name,department,salary,dense_rank()over(partition by department order by salary desc)as denseranks from employee;

select * from 
(select id,name,department,salary,age,
        dense_rank()over(partition by department order by salary desc)as denseranks from employee)
employee where denseranks=2;

--*VALUES WINDOWS FUNCTIONS*--

--FIRST_VALUE()

select *,first_value(name)over(order by salary desc)as firstvalue from employee;

select name,department,salary,first_value(name)over(partition by department order by salary desc)as firstvalue from employee;

select name,department,salary,first_value(salary)over(partition by department order by salary desc)as firstvalue from employee;

select * from  
(select name,department,salary,first_value(salary)over(partition by department order by salary desc)as firstvalue from employee)
employee where department in('sqlserver','python','addmin');

--LAST_VALUE()

select name,department,salary,last_value(name)over(order by salary desc)as lastvalue from employee;

select name,department,salary,last_value(salary)over(partition by department order by salary desc)as lastvalue from employee;

select * from  
(select name,department,salary,last_value(salary)over(partition by department order by salary desc)as lastvalue from employee)
employee where department in('sqlserver','python','addmin');

--LEAD()FUNCTION

select *,lead(name)over(order by salary asc)as leadvalue from employee;

select name,department,salary,lead(name)over(partition by department order by salary desc)as leadvalue from employee;

select * from  
(select name,department,salary,lead(name)over(partition by department order by salary desc)as leadvalue from employee)
employee where department in('sqlserver','python','addmin');

--LAG() FUNCTION

select *,lag(name)over(order by salary asc)as lagvalue from employee;

select name,department,salary,lag(name)over(partition by department order by salary asc)as lagvalue from employee;
select name,department,salary,lead(name)over(partition by department order by salary asc)as lagvalue from employee;

select * from  
(select name,department,salary,lag(name)over(partition by department order by salary desc)as lagvalue from employee)
employee where department in('sqlserver','python','addmin');

--ADVANCED WINDOWS FUNCTIONS

select *,row_number()over(order by salary desc)as rownum,
        rank()over(partition by department order by salary desc)as ranks,
		dense_rank()over(partition by department order by salary desc)as dense_ranks
		from employee;

select *,min(salary)over(partition by department order by salary desc)as min_salary,
        max(salary)over(partition by department order by salary desc)as max_salary,
		avg(salary)over(partition by department order by salary desc)as avg_salary,
		sum(salary)over(partition by department order by salary desc)as totalsalary,
		count(*)over(partition by department order by salary desc)as employeecount
from employee;

select *,
min_salary=min(salary)over(),
max_salary=max(salary)over(),
avg_salary=avg(salary)over(),
totalsalary=sum(salary)over(),
countofemployees=count(*)over() from employee;

select e.name,e.department,e.salary,e.age,ed.employeeaddress,
min_salary=min(e.salary)over(),
max_salary=max(e.salary)over(),
defult=e.salary-min(e.salary)over()
from employee e inner join employeedetails ed
on e.id=ed.id;

select e.name,e.department,e.salary,e.age,ed.employeeaddress,
min_salary=min(e.salary)over(),
max_salary=max(e.salary)over(),
defult=e.salary-min(e.salary)over()
from employee e left join employeedetails ed
on e.id=ed.id;

select e.name,e.department,e.salary,e.age,ed.employeeaddress,
min_salary=min(e.salary)over(),
max_salary=max(e.salary)over(),
defult=e.salary-min(e.salary)over()
from employee e right join employeedetails ed
on e.id=ed.id;

select e.name,e.department,e.salary,e.age,ed.employeeaddress,
min_salary=min(e.salary)over(),
max_salary=max(e.salary)over(),
defult=e.salary-min(e.salary)over()
from employee e full join employeedetails ed
on e.id=ed.id;

select e.name,e.department,e.salary,e.age,ed.employeeaddress,
min_salary=min(e.salary)over(),
max_salary=max(e.salary)over(),
defult=e.salary-min(e.salary)over()
from employee e cross join employeedetails ed;

/*STORE PROCEDURE*/
 --CREATE PROCEDURE

create procedure sp_employee
as
begin
select * from employee
end;

sp_employee;


alter procedure sp_employee
with encryption
as
begin
select * from employee
end;


create procedure sp_employee_genderanddepartment
@gender varchar(20),
@department varchar(20)
as
begin
select * from employee where @gender=gender and @department=department
end;

sp_employee_genderanddepartment 'male','python';
sp_employee_genderanddepartment 'female','sqlserver';

sp_employee_genderanddepartment @gender='male',@department='hr';
sp_employee_genderanddepartment @gender='female',@department='addmin';


create procedure sp_employeecount_gender
@gender varchar(20),
@totalcount int output
as
begin
select @totalcount=count(*) from employee where @gender=gender
end;
 
declare @totalcount int
execute sp_employeecount_gender 'male',@totalcount output
print @totalcount

declare @totalcount int
execute sp_employeecount_gender 'female',@totalcount output
print @totalcount

--DROP PROCEDURE

drop procedure sp_employee;
drop procedure sp_employee_genderanddepartment;
drop procedure sp_employeecount_gender;

--PROCEDURE COMMANDS

sp_help spemployeesgenderandgroupids
sp_help  employee
sp_depends  employees
sp_depends spemployeesgenderandgroupids

/*TRIGGERS*/

--*INSERT TRIGGER*--

create trigger tr_employee_insert
on employee
for insert
as
begin
select * from inserted
end;

insert into employee values(26,'guri',50,'addmin',30000,'male'),
                           (27,'venai',37,'sqlserver',50000,'male');

drop trigger tr_employee_insert;

select * from employee;

--*DELETE TRIGGER*--

create trigger tr_employee_delete
on employee
for delete
as
begin
select * from deleted
end;

delete from employee where name='venai';
delete from employee where id=26;

drop trigger tr_employee_delete;

--*UPDATE TRIGGER*--

create trigger tr_employee_update 
on employee
for update
as
begin
select * from inserted
select * from deleted
end;

update employee set salary=32000 where id=8;
update employee set age=40 where id=10;

--*DROP TRIGGERS*--

drop trigger tr_employee_insert;
drop trigger tr_employee_delete;
drop trigger tr_employee_update;

--Query to receive the list of triggers is:--

select * from sys.objects;
SELECT * FROM sys.objects WHERE type = 'tr';
SELECT * FROM sys.objects WHERE type = 's';
SELECT * FROM sys.objects WHERE type in('sq','it');

/*CASE FUNCTIONS*/

select 
case
when 10<20 then '10 less then 20'
when 10>20 then '10  greater then 20'
else '10 equles to 20'
end;

select *,greade=
case
when salary<40000 then 'D'
when salary<80000 then 'C'
when salary<100000 then 'B'
else 'A'
end
from employee
go;

select *,genaration=
case
when age<25 then 'younger employee'
when age<40 then 'middle age employee'
else 'old employee'
end
from employee
go;

/*IIF FUNCTIONS*/

select 
iif(10<20,'10 greater then 20','10 less then 20');

select * ,iif(age<30,'young employee','old employee')as genaration,
          iif(salary<50000,'fresher','expert')as qualification
		  from employee;

