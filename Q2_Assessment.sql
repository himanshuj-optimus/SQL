--Create Table Employees(employee_id int primary key, name varchar(20), department varchar(20), hire_date date);

--Create Table Departments(department_id int primary key, department_name varchar(20));

--Create Table Sales(sale_id int primary key, employee_id int, sale_date date, amount decimal(10,2), foreign key (employee_id) references employees(employee_id));

--Create Table Performance_Reviews(Review_id int primary key, employee_id int,review_date date, score int, foreign key (employee_id) references employees(employee_id));

--insert into departments values
--(1,'Sales'),(2,'HR'),(3,'IT'),(4,'Developer');

--insert into employees values
--(1,'Ram','HR','2018-10-9'),
--(2,'Raj','HR','2018-10-10'),
--(3,'Jack','Sales','2019-10-9'),
--(4,'John','Sales','2020-10-10'),
--(5,'Alice','IT','2021-10-9'),
--(6,'Bob','IT','2019-10-10'),
--(7,'Shyam','Developer','2019-10-09'),
--(8,'Amit','Developer','2020-10-10');

--insert into sales values
--(1,3,'2022-6-6',3000.2),
--(2,3,'2022-7-7',4000.3),
--(3,4,'2021-9-9',2000.1),
--(4,4,'2023-9-10',8000.6);

--insert into performance_reviews values
--(1,1,'2024-2-3',80),
--(2,2,'2024-2-3',70),
--(3,3,'2024-2-3',90),
--(4,4,'2024-2-3',85),
--(5,5,'2024-2-3',80),
--(6,6,'2024-2-3',90),
--(7,7,'2024-2-3',95),
--(8,8,'2024-2-3',80);

--insert into employees values
--(9,'Aman','Sales','2018-10-9'),
--(10,'Deepak','Sales','2018-10-10'),
--(11,'Udit','Sales','2019-10-9'),
--(12,'Virat','Sales','2020-10-10');

--insert into sales values
--(6,10,'2022-7-7',14000.3),
--(7,11,'2021-9-9',19000.1),
--(8,12,'2023-9-10',18000.6);

--Update  employees set department='HR' where employee_id=9;
--Update  employees set department='IT' where employee_id=10;
--Update  employees set department='Developer' where employee_id=11;
--Update  employees set department='HR' where employee_id=12;

--select e.name,e.employee_id, rank() over (order by amount desc) as RankId from sales join employees e on e.employee_id=sales.employee_id;

--Create Table Performance_Reviews(Review_id int primary key, employee_id int,review_date date, score int, foreign key (employee_id) references employees(employee_id));
--insert into performance_reviews values
--(1,1,'2024-2-3',80),
--(2,2,'2024-2-3',70),
--(3,3,'2024-2-3',90),
--(4,4,'2024-2-3',85),
--(5,5,'2024-2-3',80),
--(6,6,'2024-2-3',90),
--(7,7,'2024-2-3',95),
--(8,8,'2024-2-3',80);
--select e.employee_id, e.department, dense_rank() over (partition by e.department order by avg(score)) as DenseRank from performance_reviews p join employees e on e.employee_id=p.employee_id group by e.department,e.employee_id;

--select e.employee_id,e.name,e.department,
--row_number() over (partition by e.department order by sum(s.amount)) as RowNumber from employees e join sales s on e.employee_id=s.employee_id group by e.department,e.employee_id,e.name where RowNumber<=3;
--select e.name,e.department,s.amount,avg(ps.score) from sales s join employees e on e.employee_id=s.employee_id left join performance_reviews ps on ps.employee_id=e.employee_id group by e.name,e.department,s.amount;

--Question 1
select e.name,e.employee_id, rank() over (order by amount desc) as RankId from sales join employees e on e.employee_id=sales.employee_id;

--Question2
select e.employee_id, e.department, dense_rank() over (partition by e.department order by avg(score)) as DenseRank from performance_reviews p join employees e on e.employee_id=p.employee_id group by e.department,e.employee_id;

--Question3
--select e.employee_id,e.name,e.department,
--row_number() over (partition by e.department order by sum(s.amount)) as Rank
--from employees e join sales s on e.employee_id=s.employee_id 
--group by e.department,e.employee_id,e.name
--where RowNumber<=3;

--With rankedamount as (select employee_id, amount, row_number() over (partition by employee_id order by sum(sales.amount) desc) as Rank from sales)
--select s.employee_id, e.name,e.department from employees e join sales on e.employee_id=s.employee_id
--where rank<=3 order by s.employee_id,s.department;

--with 
--select e.name,e.department,sales.amount, dense_rank() over (partition by e.department order by amount desc) as TopSellingId from sales join employees e on e.employee_id=sales.employee_id;
--with select
--select e.name, e.department,sum(s.amount),
--dense_rank() over (partition by e.department order by sum(amount)) as DenseRank 
--from sales s join employees e on e.employee_id=s.employee_id
--group by e.department,e.name;

--Question3
select row_number() over (partition by e.department order by e.department, sum(s.amount) desc) as rankn, e.name,sum(s.amount) as total_sales from employees e join
sales s on e.employee_id=s.employee_id group by e.employee_id,e.name,e.department;

--Question4
with ranks as (select e.name, e.department,row_number() over (partition by e.department order by e.department, sum(s.amount) desc)as rank, 
sum(s.amount) as total, avg(p.score) as avg_per from employees e join sales s on e.employee_id=s.employee_id join performance_reviews p on p.employee_id=e.employee_id
group by e.employee_id,e.department,e.name)
select * from ranks where rank=1 order by total desc,department;

select * from sales;