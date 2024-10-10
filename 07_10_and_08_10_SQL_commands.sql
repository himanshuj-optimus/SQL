--DDL

Create Database SQL;

Create Table Department(
dept_id int primary key identity(1,1),
dept_name nvarchar(30) not null);

Create Table Employees(
emp_id int primary key identity(101,1),
first_name nvarchar(20) not null,
last_name nvarchar(20) not null,
hire_date date not null,
dept_id int,
salary decimal(10,2) not null,
foreign key (dept_id) references Department(dept_id));

Create Table Salaries(
salary_id int primary key identity(1,1),
emp_id int,
salary_amount decimal(10,2) not null,
foreign key(emp_id) references Employees(emp_id));

Backup Database SQL
to disk = 'C:\Users\himanshu.joshi\OneDrive - Optimus Information Inc\Desktop\Training\BackupFolder\SQLBackup.bak';

Backup Database SQL
to disk = 'C:\Users\himanshu.joshi\OneDrive - Optimus Information Inc\Desktop\Training\BackupFolder\SQLBackup.bak' with differential;


exec sp_rename 'employees.hire_date','joining_date'; --changing column name

alter table employees alter column first_name nvarchar(25); --modify column in table

alter table employees add constraint Sal_Employees Check(Salary>20000);

select * into copy_employees from employees;

select * into copy_employees2 from employees where 1=0;

--DML(SET IDENTITY_INSERT copy_employees2 ON;) SET IDENTITY_INSERT copy_employees2 OFF;

Create Procedure max_salary @dept_id int
as
select max(salary) as maximum_salary from employees where dept_id=@dept_id group by dept_id ;

--DQL but used after procedure is created
exec max_salary @dept_id=3;

CREATE DATABASE TutorialDB1;
Drop database TutorialDB1;

DROP TABLE copy_employees2;

Alter table employees add city nvarchar(20) default 'Noida'; --Tuples added after this statement will have default city as Noida

Create Index idx_dept_id on Employees (dept_id); --it will create index on dept_id

Create Index idx_dept_department_id on Department(dept_id);--it will onky execute if all dept_id are unique and will not allow to add any tuple with duplicate values in dept_id
Drop index idx_dept_department_id on department;

--Creating a view from department and employee table
Create view Emp_Dept_View as select e.emp_id,e.first_name,e.last_name,d.dept_name
from employees e left join department d on d.dept_id=e.dept_id;

--DML
INSERT INTO Department (dept_name) VALUES
('Human Resources'),
('Finance'),
('IT'),
('Marketing'),
('Sales'),
('Operations');

INSERT INTO Employees (first_name, last_name, hire_date, dept_id, salary) VALUES
('John', 'Doe', '2023-01-15', 1, 50000.00),
('Jane', 'Smith', '2022-03-22', 2, 60000.00),
('Alice', 'Johnson', '2021-07-30', 3, 70000.00),
('Bob', 'Brown', '2020-11-05', 4, 55000.00),
('Charlie', 'Davis', '2019-09-18', 5, 65000.00),
('Eve', 'Wilson', '2018-05-25', 6, 75000.00);

INSERT INTO Salaries (emp_id, salary_amount) VALUES
(101, 50000.00),
(102, 60000.00),
(103, 70000.00),
(104, 55000.00),
(105, 65000.00),
(106, 75000.00);

update employees set salary=100000 where hire_date<'2020-01-01' and salary>70000;

delete from salaries where emp_id=102;

update employees set dept_id = 3 where emp_id in (102,103,105);

--This is single line comment

/*This is 
multiline comment*/


--DQL

select * from Department;

select * from Employees;

select * from Salaries;

select distinct(hire_date) from Employees;

select distinct(hire_date) from Employees where hire_date>'2020-11-05';

select * from Employees order by hire_date;

select * from Employees order by hire_date desc;

select * from Employees where (salary>50000 and dept_id=3) or dept_id=5;

select * from Employees where (salary>50000 and dept_id=3) or not emp_id=104;

select * from Employees where first_name is null;

select * from Employees where first_name is not null;

select top 3 * from employees;

select min(salary) as minimum_salary from employees;

select max(salary) as minimum_salary from employees;

select count(emp_id) as Total_Employees from employees;

select sum(salary) as Salary_Expenses from employees;

select avg(salary) as AVG_Salary from employees;

select * from employees where first_name like 'a%';

select * from employees where first_name like '_o%';

select * from employees where dept_id in (3,4);

select * from employees where salary between 55000 and 80000;

select e.*,d.* from employees e join department d on e.dept_id=d.dept_id;

select e.*,d.* from employees e left join department d on e.dept_id=d.dept_id;

select e.*,d.* from employees e right join department d on e.dept_id=d.dept_id;

select e.*,d.* from employees e full join department d on e.dept_id=d.dept_id;

select e1.emp_id, e2.emp_id from employees e1, employees e2 where e1.emp_id<>e2.emp_id and e1.dept_id=e2.dept_id;

select dept_id from employees union select dept_id from department;

select sum(salary) as Total_Salary, employees.dept_id, d.dept_name from employees right join department d 
on employees.dept_id = d.dept_id group by employees.dept_id,d.dept_name order by sum(employees.salary) desc;

Select employees.dept_id, d.dept_name from employees right join department d 
on employees.dept_id = d.dept_id group by employees.dept_id,d.dept_name having sum(salary)>50000 order by sum(employees.salary) desc;

select * from department where exists (select 1 from employees where department.dept_id = employees.dept_id);

select * from department where dept_id=any (select dept_id from employees where department.dept_id = employees.dept_id);

select * from department where dept_id=all (select dept_id from employees where department.dept_id = employees.dept_id);

select *, 
case
	when salary>=66666 then 'Salary is greater than average salary'
	else 'Salary is less than average salary'
end as Salary_Comment
from employees;

--both are same
select dept_id,isnull(salary,0) from employees;
select dept_id,coalesce(salary,0) from employees