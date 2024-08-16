/*CREATE DATABASES*/--this command is used to create a new database.--
create database software;
create database acer;

/*USE DATABASES*/--this command is used to use the database.--
use software;
use acer;

/*DROP DATABASES*/ --drop command is used to delete the database.--
drop database softwares;
drop database acers;

/*DISPLAY ALL DATABASES INFORMATION*/
SP_HELPDB

/*DISPLAY ALL TABLES IN DATABASES*/
sp_help

/*DISPLAY THE TABLE INFORMATION*/
SP_HELP EMPLOYEE

/*DISPLAY STORE PROCEDURE COMMANDS*/
SPEMPLOYEES

SP_HELPTEXT EMPLOYEES



/*CREATE TABLES*/--this create command is used to create new empty tables.--
create table employee(
empid int not null,
firstname varchar(30),
lastname varchar(20),
department varchar(30),
salary float
);

/*INSERT VALUES*/--insert command is used to insert data in the tables.--
                 --add new records to a table.--
                 --store the data rows and columns in tables structure.--
insert into employee(empid,firstname,lastname,department,salary)
values(1,'firoz','sk','mca',60000),
       (2,'madhuri','s','mca',50000),
	   (3,'madhava','s','btic',3000),
	   (4,'siri','k','mba',25000),
	   (5,'ravi','j','mba',28000);

/*SELECT STATEMENTS*/--retrieves data from a database.--
                     --this command is used to accrss the records from one or more database tables.--
select * from employee;
select * from employeedetails;
select * from projectdetails;
select empid,firstname,lastname from employee;
select firstname,salary from employee;
select department from employee;

/*DISTINCT COMMANDS*/--selects unique values from a column.--
select distinct department from employee;
select distinct gender from employee;
select distinct (department) from employee;
select distinct (groupid) from employee;

/*WHERE CLAUSE COMMANDS*/--filter rows based on a specified condition.--
select * from employee where gender='male';
select * from employee where department='devops';
select * from employee where department='finance';
select * from employee where groupid=2;
select * from employee where groupid is null;

/*UPDATE COMMANDS*/--update existing data in atable.--
                   --modify new records in a tables.--
update employee set age=22 where firstname like 's%';
update employee set age=35 where department='hr';
update employee set age=28 where lastname='j';
update employee set age=40 where department='art';
update employee set age=19 where groupid=1;
update employee set age=25 where department='python';
update employee set age=52 where lastname in ('jan','y');
update employee set department= null where empid=8;

/*DELETE COMMANDS*/--remove one or more records from a table.--
                   --delete data from a database.--
delete from employee where name='firoz';
delete from employee where age=26;
delete from employee where id=4;

/*TRUNCATE COMMANDS*/--remove all records from a table.--
                     --remove all data from the table.--
truncate table employees;
truncate table department;
truncate table employeesdetails;

/*ALTER COMMANDS*/--modify the structure of an exsting table.--
                  --this command is used to add the columns and detete columns.--
				  --this command is used to add constrains in a column and drop constrains in a column.--

--ALTER COMMAND USE ADD COLUMN IN TABLE
alter table dept add age int;
alter table employye add middlename varchar(30);
alter table employee add email varchar(50) not null;

--ALTER COMMAND USE DELETE COLUMN IN TABLE
alter table employee drop column ages;
alter table employees drop column lastname;
alter table employys drop column salary;

/*OPERATORS*/--the sql reserved words and characters are called operators,which are used with a where clause in sql query.--
             --1.arithmetic operators (+,-,*,/)
			 --2.comparison operators (=,!=,>,<,<=,>=)
			 --3.logical operators (ALL,AND,OR,NOT,BETWEEN,LIKE)
			 --4.set operators (UNION,UNION ALL,INTERSECT,MINUS)
			 --5.bit-wise operators (AND(&),OR(/))
			 --6.unary operators (UNATY POSITIVE(+),NEGATIVE(-),BITWISE NOT)

--AND OPERATOR
               --Combines multiple conditions in a where clause.--
select * from employee where gender='male' and department='sqlserver';
select * from employee where salary>40000 and gender='female';

--OR OPERATOR
             --specifies multiple alternative conditions in a where clause.--
select * from employee where department='hr' or salary>70000;
select * from employee where gender='female' or firstname like 'k%';
select * from employee where department='sqlserver' or department='devops';

--NOT OPERATOR--
                --negates a condition in a where clause.--
select * from employee where not gender='male';
select * from employee where not salary<30000;
select * from employee where department not in ('hr','dataeng');

--IN OPERATOR--
              --specifies multiple values in a column.--
select * from employee where department in ('sqlserver','devops','hr');
select * from employee where firstname in('sk','s','p','lieo');

--LIKE OPERATOR--
                 --selects rows that match a specified pattern.--
				 --filter rows based on a pattern.--
select * from employee where firstname like 'm%';
select * from employee where department like 'h%';
select * from employee where firstname like '%i%';
select * from employee where groupid like '2%';
select firstname,salary,department from employee where salary like '1_____';

--BETWEEN OPERATOR--
                    --select values within a specified range.--
select * from employee where age between 22 and 40;
select * from employee where empid between 4 and 12;
select * from employee where salary between 40000 and 80000;

/*STRINGS FUNCTIONS*/
--TOP FUNCTION--
               --limits the number of rows returned by a query.--
select top 3 *  from employee 
select  top 2 firstname,lastname,salary from employee;
select top 50 percent * from employee;
select top 10 percent * from employee;

--ORDER BY FUNCTION--
                    --sort the result set based  on one or more columns.--
					--specifies the ordre  of rows within each partition for window fuctions.--
select * from employee order by salary asc;
select * from employee order by firstname asc;
select firstname,lastname,department,age,salary from employee order by age desc;
select firstname,lastname,salary,groupid from employee order by 2;
select firstname,lastname,salary,groupid from employee order by 4;
select firstname,lastname,salary,groupid from employee order by 3;

--ADVANCED OPERATORS
select firstname,lastname,department from employee where department in('sqlserver','finance','dataeng') order by department asc;
select firstname,lastname,department,salary as employee_salary,age as employee_age 
from employee where salary>22000 and age<35 order by salary desc,age asc;
select * from employee where salary between 1500 and 40000 and firstname like 'a%';
select * from employee where gender='male' and lastname like'[f-m-j-a]%';
select * from employee where department in('sqlserver','devops','hr') and salary>50000;

select firstname,lastname as 'EMPLOYEE_NAME',salary,department as 'EMPLOYEE_DEPARTMENT' from employee where salary>30000 and age>20;
select firstname as 'FIRSTNAME',lastname as'LASTNAME',department as'DEPARTMENT',salary as 'EMP_SALARY',groupid from employee 
where salary>20000 and department in('sqlserver','devops','hr','finance','dataeng') order by emp_salary desc,groupid desc;

--ADVANCED ORDER BY FUNCTIONS
select top 4 * from employee order by salary desc;
select top 2 salary from employee;
select top 1 * from (select top 3 * from employee  order by salary asc)as employee order by salary desc;
select top 1 salary from (select top 3 salary from employee order by salary desc) employee order by salary asc;

/*STRING FUNCTIONS*/
select ltrim('     firozshaik')as ltrimstring;           --removes leading and trailing spaces from a string.--
select upper('firozshaik')as uppercase;                  -- converts a string to uppercase.--
select lower('FIROASHAIK')as lowercase;                  --converts a string to lowercase.--
select reverse('i love you')as reversecolumn;            --converts a string to reverse the words.--
select substring('this is firoz',9,5) as substringcolumn;
select len('this is firoz')as length;                    --converts a string length.--

/*AGGREGATE FUNCTIONS*/
select  max(salary) as max_salary from employee;--find the maximum value in a column.--
                                                --returns the largest value in a set of values.--

select min(salary) as min_salary from employee;--find the minimum value in a column.--
                                               --returns the smallest value in a set of values.--

select avg(salary) as avg_salary from employee;--calculates the average of a set of values.--

select sum(salary) as sum_salary from employee;--calculates the sum of a set of values.--

select count(*) as count_employees from employee;--returns the number of rows that satisfy the condition.--
select avg(salary)as avgsalary from employee where groupid=2;


/*GROUP BY FUNCTIONS*/--group rows based on one or more columns.--
                      --groups rows that have the same values into summary rows.--
                      --specifices multiple groupings for aggregation.--

select department,sum(salary) from employee group by department;
select department,max(salary) as max_salary from employee group by department;
select department,min(salary)as min_salary from employee group by department;
select department,min(age) as min_age from employee group by department;
select department,max(age) as max_age from employee group by department;

select department,avg(salary) as avg_salary from employee group by department;
select gender,sum(salary) as sum_salary from employee group by gender;
select department,count(*) as count_employees from employee group by department

/*HAVING CLAUSE*/--filter grouped based on a condition.--
                 --filters records based on a aspecified condition.--
                 
select department,max(salary)as max_salary 
from employee 
group by department 
having  max(salary)>50000;

select department,min(salary)as min_salary 
from employee 
group by department  
having  min(salary)<50000;

select department,avg(salary)as avg_salary 
from employee
group by department 
having  avg(salary)<40000;

select department,sum(salary)as sum_salary 
from employee 
group by department 
having  department in('dataeng','sqlserver','finance','hr');

select department,count(*)as countofemployess
from employee
group by department 
having department between 'dataeng' and 'finance';

--ADVANCED AGGRIGATE FUNCTIONS
select max(salary)as max_salary, min(salary)as min_salary, avg(salary)as avg_salary from employee;

select * from employee where empid=(select min(empid)as min_empid from employee);
select * from employee where empid=(select max(empid)as max_empid from employee);
select * from employee where empid=(select avg(empid)as avg_empid from employee);
select * from employee where salary=(select max(salary)as max_salary from employee);


select * from employee where empid!=
(select min(empid) from employee b where empid=b.empid);

select * from employee where empid!=
(select max(empid) from employee b where empid=b.empid);

select * from employee where empid!=
(select avg(empid) from employee b where empid=b.empid);

--ADVANCED GROUP BY FUMCTIOND
select department,count(*)as employees from employee group by department;
select department,count(*)as employees from employee group by department order by department desc;
select gender,count(*)as employees from employee group by gender;
select department,count(*)as count_employees from employee where department in('dataeng','sqlserver','finance') group by department;
select department as 'employee_department',count(*) as 'employee_count' from employee group by department;
select department as 'employee_department',count(*) as 'employee_count' from employee 
group by department order by employee_count asc;
select department as 'employee_department',count(*) as 'employee_count' from employee 
where department in ('sqlserver','devops','dataeng','python') group by department order by employee_count desc;

select department,sum(salary)as totalsalary from employee group by department;
select gender,sum(salary)as totalsalary from employee group by gender;
select department,sum(salary)as totalsalary from employee group by department order by totalsalary desc;

select department,count(*)as employees,sum(salary)as totalsalary from employee group by department order by totalsalary desc;
select department,count(*)as employees,avg(salary)as avg_salary from employee group by department order by avg_salary asc;
select empid,count(projectname)as noofprojectallacation from projectdetails group by empid having count(*)>1;

--ADVANCED HAVING CLOSS
select department,max(salary)as max_salary
from employee
group by department
having department='sqlserver';

select department,min(salary)as min_salary
from employee 
group by department
having department in ('dataeng','sqlserver','finance');

select department,min(salary)as min_salary
from employee
group by department
having min(salary)>50000;

--UPDATE JOINS
update employee set salary=salary-100
from employee e
join employeedetails ed
on e.empid=ed.empid
where location='kerala';

update employee set age=age+10
from employee e
join employeedetails ed
on e.empid=ed.empid
where location='mombai';

--DELECT JOINS
delete employee 
from employee e
join employeedetails ed
on e.empid=ed.empid
where location='hyd';

delete employee
from employee e
join employeedetails ed
on e.empid=ed.empid
where location='kerala';

/*JOINS IN SQL*/--combine rows from multiple tables based on a related column.--
                --join operation in sql is used to combine multiple tables together into a single table.--

select * from employee                 --return only matching rows from joined tables.--
inner join projectdetails 
on employee.empid=projectdetails.empid;

select * from employee                  --return all rows from the left table and matching rows from the right table.--
left join projectdetails 
on employee.empid=projectdetails.empid;

select * from employee                  --return all rows from the right table and matching rows from the left table.--
right join projectdetails
on employee.empid=projectdetails.empid;

select * from employee                  --return all rows when there is a match in either tables.--
full join projectdetails 
on employee.empid=projectdetails.empid;

select * from employee                  --the cross join keyword matches all records from the "left" table with each record from the
cross join projectdetails;              -- "right" table.

select employee.firstname,employee.salary,employee.department,projectdetails.projectid,projectdetails.projectname 
from employee 
inner join projectdetails
on employee.empid=projectdetails.empid;

select employee.firstname,employee.salary,employee.department,projectdetails.projectid,projectdetails.projectname
from employee
left join projectdetails
on employee.empid=projectdetails.empid;

select employee.firstname,employee.salary,employee.department,projectdetails.projectid,projectdetails.projectname
from employee
right join projectdetails
on employee.empid=projectdetails.empid;

select employee.firstname,employee.salary,employee.department,projectdetails.projectid,projectdetails.projectname
from employee
full join projectdetails
on employee.empid=projectdetails.empid;

select employee.firstname,employee.salary,employee.department,projectdetails.projectid,projectdetails.projectname
from employee
cross join projectdetails;

select employee.firstname,employee.department,projectdetails.projectname from employee 
inner join projectdetails
on employee.empid=projectdetails.empid;

select employee.firstname,employee.department,projectdetails.projectname from employee 
left join projectdetails
on employee.empid=projectdetails.empid;

select employee.firstname,employee.department,projectdetails.projectname from employee 
right join projectdetails
on employee.empid=projectdetails.empid;

select employee.firstname,employee.department,projectdetails.projectname from employee 
full join projectdetails
on employee.empid=projectdetails.empid;

select employee.firstname,employee.department,projectdetails.projectname from employee 
cross join projectdetails;

select e.empid AS 'EMPID',e.lastname AS 'LASTNAME',e.department AS 'DEPARTMENT',p.projectname AS 'PROJECTNAME' 
from employee AS E
inner join projectdetails AS P
on E.empid=P.empid;

select e.empid AS 'EMPID',e.lastname AS 'LASTNAME',e.department AS 'DEPARTMENT',p.projectname AS 'PROJECTNAME' 
from employee AS E
left join projectdetails AS P
on E.empid=P.empid;

select e.empid AS 'EMPID',e.lastname AS 'LASTNAME',e.department AS 'DEPARTMENT',p.projectname AS 'PROJECTNAME' 
from employee AS E
right join projectdetails AS P
on E.empid=P.empid;

select e.empid AS 'EMPID',e.lastname AS 'LASTNAME',e.department AS 'DEPARTMENT',p.projectname AS 'PROJECTNAME' 
from employee AS E
full join projectdetails AS P
on E.empid=P.empid;

select e.empid AS 'EMPID',e.lastname AS 'LASTNAME',e.department AS 'DEPARTMENT',p.projectname AS 'PROJECTNAME' 
from employee AS E
cross join projectdetails AS P;

select e.empid as EMPID ,e.firstname as FIRSTNAME ,e.salary as SALARY ,e.department as DEPARTMENT ,
p.projectid as PROJECTID ,p.projectname as PROJECTNAME
from employee as e
full join projectdetails as p
on e.empid=p.empid where salary>70000;

select * from employee;
select * from projectdetails;
select * from employeedetails;

--ADVANCED JOINS IN SQL
select employee.department,count(employee.department) as employeescount
from employee inner join employeedetails 
on employee.empid=employeedetails.empid 
group by department;

select e.empid,count(e.empid)as numberofemployees from employee as e
inner join employeedetails as ed on e.empid=ed.empid group by e.empid order by empid asc;

select e.groupid ,count(e.groupid)as numberofgroupids from employee as e 
inner join employeedetails as ed on e.empid=ed.empid group by e.groupid order by numberofgroupids desc;

select e.department,count(e.empid)as countemployees from employee as e
inner join employeedetails as ed on e.empid=ed.empid group by e.department order by countemployees asc;

--JOIN 3 TABLES IN SQL
select * from employee 
inner join projectdetails 
on employee.empid=projectdetails.empid
inner join employeedetails 
on employeedetails.empid=employee.empid;

select * from employee 
left join projectdetails 
on employee.empid=projectdetails.empid 
left join employeedetails 
on employeedetails.empid=employee.empid;

select * from employee
right join projectdetails
on employee.empid=projectdetails.empid
right join employeedetails 
on employeedetails.empid=employee.empid;

select * from employee 
full join projectdetails 
on employee.empid=projectdetails.empid 
full join employeedetails 
on employeedetails.empid=employee.empid;

select * from employee 
cross join projectdetails 
cross join employeedetails;


SELECT A.Firstname AS firstname, B.Firstname AS firstname2, A.Department
FROM Employee A, Employee B
WHERE A.groupid = B.groupid 
ORDER BY A.Department;

select * from table1 inner join table2 on table1.id=table2.id;
select * from table1 left join table2 on table1.id=table2.id;
select * from table1 right join table2 on table1.id=table2.id;
select * from table1 full join table2 on table1.id=table2.id;
select * from table1 cross join table2 ;

select * from table1 left join table2 on table1.id=table2.id where table1.id is null;
select * from table1 left join table2 on table1.id=table2.id where table2.id is null;
select * from table1 right join table2 on table1.id=table2.id where table1.id is null;
select * from table1 right join table2 on table1.id=table2.id where table2.id is null;
select * from table1 left join table2 on table1.id=table2.id where table1.id=1;
select * from table1 left join table2 on table1.id=table2.id where table2.name='madhuri';

select sum(e.salary ) from employee as e left join
employeedetails as ed on e.empid=ed.empid where salary>10000;
select * from employeedetails;

select e.department ,count(*)as count_employees from employee e
left join employeedetails ed 
on e.empid=ed.empid
where e.age between 22 and 40 group by e.department;

Select  SUM(pp.ListPrice * ppi.Quantity) from  Production.Product as pp
inner join Production.ProductInventory as ppi on pp.ProductID=ppi.ProductID
where ListPrice>0

Select  SUM(pp.ListPrice * ppi.Quantity) from  Production.Product as pp 
inner join Production.ProductInventory as ppi on pp.ProductID=ppi.ProductID
where ListPrice>1000

/*WINDOW FUNCTIONS*/--The window functions are divided into three types value window functions, aggregation window functions,
                    -- and ranking window functions:

--Value window functions
• FIRST_VALUE()
• LAG()
• LAST_VALUE()
• LEAD()
--Ranking window functions
• CUME_DIST()
• DENSE_RANK()
• NTILE()
• PERCENT_RANK()
• RANK()
• ROW_NUMBER()
--Aggregate window functions
• AVG()
• COUNT()
• MAX()
• MIN()
• SUM()

   --window_function: The name of the window function.
   --Expression: it is the column name for which we calculate an aggregated value.
   --OVER:(It specifies the window clauses for aggregate functions. It mainly contains two 
           --expressions partition by and order by, and it always has an opening and closing parenthesis 
           --even there is no expression.)

select * ,sum(salary) as salary from employee;

select * ,min(salary) over() min_salarry from employee;
select * ,max(salary) over() max_salary from employee;
select * ,avg(salary) over() avg_salary from employee;
select * ,sum(salary) over() sum_salary from employee;

--ROW_NUMBER() USING ORDER BY CLOSS 
                           --Assains a unique sequential integer to each row in a result set.
                           --• Second, the ORDER BY clause sorts the employee in each department by 
                           --    salary in the descending order.
                           --• Third, the ROW_NUMBER() assigns each row a sequential integer number. It 
                           --    resets the number when the department changes.
						   --specifice the window frame based on values rather then rows for window functions.

select * ,row_number() over(order by salary asc)as employeesrows from employee;
select * ,row_number() over(order by department desc)as employeesrow from employee;
select * ,row_number() over(order by age desc)as employeesrow from employee;
select * ,row_number() over(order by lastname desc)as employeesrow from employee;

--OVER() USING PARTITION BY FUNCTION
                                 ----First, the PARTITION BY clause distributes the employees by departments.
select * ,min(salary) over(partition by department)as min_salary from employee;
select * ,max(salary) over(partition by department)as max_salary from employee;
select * ,min(age) over(partition by department)as min_age from employee;
select * ,max(age) over(partition by department)as max_age from employee;

select  row_number()
over(order by salary)as row_num, firstname,lastname,department,salary
from employee;

select * from(
select  row_number() 
        over(order by age desc)
		as row_num,firstname,lastname,salary,age,department 
		from employee)employee 
		where  row_num>3 and row_num<12;

select department,PERCENT_RANK()
                  over(partition by department  order by salary asc)
				  row_num,
				  firstname,
				  lastname,
				  salary
				  from employee ;

select department,PERCENT_RANK()
                  over(partition by department  order by salary asc)
				  row_num,
				  firstname,
				  lastname,
				  salary
				  from employee ;

select * from (select department,
               row_number()
			   over(partition by department order by salary desc)
			   row_num,
			   firstname,
			   lastname,
			   salary,
			   age from employee) 
			   data where row_num=1;

--RANK() FUNCTIONS
               --The RANK() function is a window function that assigns a rank to each row in the partition of a result set.
			   --Assigns a unique rank to each row in a result set,with gaps in the ranking sequence possible.
select 
       firstname,
	   lastname,
	   salary,
	   department,
	     rank()
		 over( order by salary desc)salary_rank
		 from employee

select firstname,
       lastname,
	   department,
	   salary,
	   rank()
	   over(partition by department order by salary desc)salary_rank
	   from employee

select * from 
    (select firstname,
	        lastname,
			department,
			salary,
			rank()
			over(partition by department order by salary desc)salary_rank
			from employee)
			employee where salary_rank<4;

select *, rank()
          over(partition by department order by salary)rank_salary
		  from employee;
	
--DENSE_RANK() FUNCTION
                      -- the RANK() function, the DENSE_RANK() function always generates consecutive rank values.
					  --Assigns a unique rank to each row in a result set,with no gaps in the ranking sequence.

select *,rank()over(partition by department order by salary asc)salary_rank,
         dense_rank()over(partition by department order by salary asc)dense_rank
		 from employee

select *,rank()over(partition by department order by salary asc)salary_rank,
         dense_rank()over(partition by department order by salary asc)densc_rank,
		 row_number()over(partition by department order by salary asc)row_num
		 from employee;

--FIRST_VALUE() FUNCTIONS 
                      --FIRST_VALUE() function to return the first value in an ordered set of values.
select *,first_value(firstname)
         over(partition by department order by salary asc)firstvalue
		 from employee

select *,first_value(firstname)
         over(partition by department order by firstname)
		 from employee;

--LAST_VALUE() FUNCTIONS 
                   --This window function that returns the last value in an ordered set of values.
select *,last_value(firstname)
         over(partition by department order by firstname)
		 from employee;

select firstname,
       lastname,
	   department,
	   salary,
	   last_value(firstname)
	   over(partition by department order by salary desc
	        range between unbounded preceding and unbounded following)
			highest_salary
			from employee;

select firstname,
       lastname,
	   department,
	   salary,
	   first_value(firstname)
	   over(partition by department order by salary asc
	        range between unbounded preceding and unbounded following)
			highest_salary
			from employee;

--LEAD() FUNCTION --retrieves the value from the next row in a result set.
                  --Using the LEAD() function, from the current row, you can access data of the next row, 
                  --   or the second row that follows the current row, or the third row that follows the 
                  --   current row, and so on.

select *, lead(salary)over(partition by department order by salary)from employee;

--LAG() FUNCTION
                --retrieves the value from the previous row in a result set.
select *,lag(salary)over(partition by department order by salary)from employee;

select * from employee;
select * from employeedetails;
select * from projectdetails;

--WINDOW FUNCTIONS USING JOINS AND AGGRIGATE FUNCTIONS
Select e.FirstName,e.department,e.salary,ed.employeeaddress,pj.projectname,
Avaeragerate=AVG(E.salary) over()
from employee e
JOIN employeedetails ed
on e.empid=ed.empid
JOIN projectdetails pj
on pj.empid=e.empid

Select e.FirstName,e.department,e.salary,ed.employeeaddress,pj.projectname,
Avaeragesalary=AVG(E.salary) over(),
sumofsalary=sum(e.salary)over()
from employee e
JOIN employeedetails ed
on e.empid=ed.empid
JOIN projectdetails pj
on pj.empid=e.empid

select e.firstname,e.department,e.salary,ed.employeeaddress,pj.projectname,
avaeragesalary=avg(e.salary)over(),
sumofsalary=sum(e.salary)over(),
duffremove=e.salary-avg(e.salary)over()
from employee e
join employeedetails ed
on e.empid=ed.empid
join projectdetails pj
on pj.empid=e.empid;

--WITH FUNCTIONS  
                  --defines a common table expression(CTE).
with employeeble
as (select * from employee where empid>9)
select firstname,department,salary from employeeble;

with employee_dataeng
as(select * from employee where department='dataeng'),
employee_finance
as (select * from employee where department='finance')
select firstname,department,salary from employee_dataeng
union all
select firstname,department,salary from employee_finance


create table student1(
std_id int,
std_name varchar(20),
std_marks int
);

create table student2(
std_id int,
std_name varchar(20),
std_marks int
);

insert into student1(std_id,std_name,std_marks)
values(1,'firoz',100),
      (2,'madhuri',99),
	  (3,'siri',55),
	  (4,'madhava',70),
	  (5,'ammu',88);

insert into student2(std_id,std_name,std_marks)
values(4,'madhava',70),
	  (5,'ammu',88),
	  (6,'gani',77),
	  (7,'hani',45),
	  (8,'hari',35);

select * from student1;
select * from student2;

/*UNIONS*/ --Combine the results of two or more SELECT statements.
        
select * from student1
union 
select * from student2;

select * from student1 --Combine the results of two or more SELECT statements,including duplicates.
union all
select * from student2;

select * from student1 --Combine the results of two or more SELECT statements,unique values in the first table.
except
select * from student2;

select * from student1 --Combine the results of two or more SELECT statements,combine two tables duplicate values.
intersect
select * from student2;

/*VIEWS*/--A sql view is a virtual table created by a query,which can include columns from one or more tables in a database.
         --The create view command create a view.

create view female_employees as
select * from employee
where gender='female';

select * from female_employees;

create view male_employees as
select * from employee
where gender='male';

select * from male_employees;

create view dataeng_employees as
select * from employee
where department='dataeng';

select * from dataeng_employees;

--DROP VIEWS     
            --delete the view table.
drop view male_employees;
drop view female_employees;
drop view dataeng_employees;


/*STOREPROCEDURE*/  --A store procedure is a set of sql statements that are stored in the database and can be executed repeatedly.
                    --  it provides code reusability and better performance.
--CREATE STORE PROCEDURE--

create procedure spemployees
as
begin
     select * from employee
end;

--EXECUTE STORE PROCEDURE--

SPEMPLOYEES

--DROP STORE PROCEDURE--

drop procedure spemployees;

--MODIFY STORE PROCEDURE--

alter procedure spemployees
as
begin
   select * from employee where salary>40000
end;

--execute 
spemployees

--DISPLAY STORE PROCEDURE PROGRAM--

sp_helptext spemployees

--ENCRYPTION THE STORE PROCEDURE--

alter procedure spemployees
with encryption
as
begin
  select * from employee
end;

--STORE PROCEDURE ADDVANCED CONCEPTS--

create procedure spemployeesgenderandgroupid
@gender varchar(20),
@groupid int
as
begin
 select firstname,lastname,department,gender,groupid from employee where gender=@gender and groupid=@groupid
end;

spemployeesgenderandgroupid 'male',5
spemployeesgenderandgroupid 'female',4
spemployeesgenderandgroupid 'male',2
spemployeesgenderandgroupid 'female',5
spemployeesgenderandgroupid 'male',4

spemployeesgenderandgroupid @gender='male',@groupid=2
spemployeesgenderandgroupid @gender='female',@groupid=4
spemployeesgenderandgroupid @gender='male',@groupid=5


drop proc spemployeesgenderandgroupid

create proc spemployeesgenderandgroupids
@gender varchar(20),
@employeecount int output
as
begin
select @employeecount=count(empid) from employee where gender=@gender 
end

declare @totalcount int
execute spemployeesgenderandgroupids 'male' ,@totalcount output
print @totalcount

declare @totalcount int
execute spemployeesgenderandgroupids 'female',@totalcount output
print @totalcount 

declare @totalcount int
execute spemployeesgenderandgroupids @employeecount=@totalcount output,@gender='male'
print @totalcount 

declare @totalcount int
execute spemployeesgenderandgroupids @employeecount=@totalcount output,@gender='female'
print @totalcount

declare @totalcount int 
execute spemployeesgenderandgroupids 'male',@totalcount output
if( @totalcount is null) 
  print '@totalcount is null'
else
  print '@totalcount is not null'

--STORE PROCEDURE HELPING COMMENDS--

sp_help spemployeesgenderandgroupids
sp_help  employee
sp_depends  employees
sp_depends spemployeesgenderandgroupids

--DROP STORE PROCEDURES --

DROP PROC SPEMPLOYEESGENDERANDGROUPID;
DROP PROC SPEMPLOYEES;
DROP SP_EMPLOYEEDETAILS;
DROP PROC SPEMPLOYEE;


/*TRIGGERS*/  --trigger is a special type of stored procedure that automatically runs when an event occurs in the database server.
              --trigger are used to DML commands insert,delete,update statements are execute.
--CREATE TRIGGERS [DML -INSERT,DELETE,UPDATE]
--CREATE INSERT TRIGGER--

select * from person;

create trigger tr_person_forinsert
on person
for insert
as
begin
select * from inserted
end

--INSERT VALUES IN A INSERT RECORDES--

insert into person values(6,'sk','firoz','ap','Barath',22,500);
insert into person values(12,'sk','madhuri','ap','Barath',22,450);

--CREATE DELETE TRIGGER--
create trigger tr_person_fordelete
on person
for delete
as
begin
 select * from deleted
end

--DELETE VALUES IN A DELETE RECORDES--

delete from person where p_id=6;
delete from person where p_id=9;

--DELETE UPDATE TRIGGERS--
create trigger tr_person_forupdate
 on person
 for update
 as
 begin
 select * from deleted
 select * from inserted
end

--UPDATE VALUES IN A TABLE--
update person set salary=400,age=31 where p_id=3;
update person set lastname='s' where p_id=12;


--Query to receive the list of triggers is:--

select * from sys.objects;
SELECT * FROM sys.objects WHERE type = 'tr';
SELECT * FROM sys.objects WHERE type = 's';
SELECT * FROM sys.objects WHERE type in('sq','it');

--case functions--

select
case 
when 10>20 then '10 is greater then 20'
when 10<20 then '10 is less then 20'
else '10 is equalto 20'
end

select * from employee;

select *,gread=
case
when salary<40000 then 'C'
when salary<80000 then 'B'
else 'A'
end
from employee
go

-- iif function
select 
iif(10>20,'10 is geater then 20','10 is less then 20')

select * from employee;

select lastname,department,age,iif(age>30,'old employee','young employee')as employee_genaration from employee;
select firstname,lastname,salary,iif(salary>40000,'A','B')as employee_greade from employee where salary>6000;


select 
case 
when 10<10 then '10 gretar then 20'
when 10>10 then '10 less then 20'
else '10 is equal to 10'
end

select *,gread=
case
when salary<30000 then 'C'
when salary<70000 then 'B'
else 'A'
end
from employee
go

select *,gread=
case
when groupid is null then 'very bad'
when groupid<2 then 'bad'
when groupid<4 then 'good'
when groupid<6 then 'excelent'
else 'toper'
end
from employee
go

select
iif(10<20,'10 is less then 20','10 is greater then 20')

select
iif(10=10,'10 is less then 10','10 is equals to 10')

select lastname,salary,department,age,iif(age<30,'younger employee','old employee')as genaration_employee,
                                      iif(salary>30000,'A','B')as gread from employee ;






