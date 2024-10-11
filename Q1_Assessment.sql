--Create Table t_product_master(Product_ID char(4) Primary Key,Product_Name Nvarchar(30),Cost_Per_Item Int);

--Create Table t_user_master(User_ID Char(4) Primary Key, User_Name NVarchar(20));

--Create Table t_transaction(User_ID Char(4), Product_ID Char(4), Transaction_Date Date, Transaction_Type NVarchar(15), Transaction_Amount Int, Foreign Key (User_ID) References t_user_master(User_ID),Foreign Key (Product_ID) references t_product_master(Product_ID));

--insert into t_product_master values
--('P1','Pen',10), ('P2','Scale',15), ('P3','Note Book',25);

--insert into t_user_master values

--insert into t_transaction values 
--('U1','P1','2010-10-25','Order',150),
--('U1','P1','2010-11-20','Payment',750),
--('U1','P1','2010-11-20','Order',200),
--('U1','P3','2010-11-25','Order',50),
--('U3','P2','2010-11-26','Order',100),
--('U2','P1','2010-12-15','Order',75),
--('U3','P2','2011-1-15','Payment',250);

--select u.user_name, p.product_name from 
--t_user_master as u full join t_transaction as
--tr on tr.user_id=u.user_id full join t_product_master p on tr.product_id=p.product_id;

--select sum(transaction_amount) as quantity,transaction_type from t_transaction group by transaction_type;
--when transaction_type='Order' then group by product_id,user_id
--else 
--SELECT u.user_name, p.product_name
--case 
--	when Transaction_Type = 'Order' Then (Select sum(transaction_amount) from t_transaction group by product_id,user_id) As Ordered_Quantity
--	else (Select sum(transaction_amount) from t_transaction group by product_id,user_id) As Amount_Paid
--end;


--Completed after lunch
Select u.user_name,p.product_name,Sum(Case when tr.Transaction_Type='Order' then tr.transaction_amount else 0 end) as ordered_quantity,
sum(case when tr.transaction_type='Payment' then tr.transaction_amount else 0 end) as amount_paid,
max(tr.transaction_date) as last_transaction_date,
(sum(case when tr.transaction_type='Order' then tr.transaction_amount*p.cost_per_item else 0 end)-sum(case when tr.transaction_type='Payment' then tr.transaction_amount else 0 end)) as Balance
from t_transaction tr join t_user_master u on tr.user_id=u.user_id join t_product_master p on p.product_id=tr.product_id group by u.user_name,p.product_name;