create database company 

create table Employeeees(
Emp_id int Primary key identity (1,1),
Emp_Name nvarchar (150),
Emp_Addres varchar(70),
Emp_Salary Money,
Emp_Gender bit check (Emp_Gender in ('Male', 'Female')),
Emp_BirthDate date ,
Dept_id int,
Foreign key (Emp_id)references Employeeees(Emp_id),
Foreign key (Dept_Id)References Departments(Dept_id)
)

create table Dept_Emp(
Dept_id int,
Emp_id int ,
StartDate date,
constraint P_K primary Key (Dept_id,Emp_id),
foreign key (Dept_id)references Departments(Dept_id),
foreign key (Emp_id)references Employeeees(Emp_id)

)


create table Departments (

Dept_id int primary Key identity (1,1),
Dept_Name varchar(50),
Dept_location varchar(50)

)

create table Projects(
Proj_id int primary key ,
Proj_name varchar(50),
Proj_Location varchar(50),
Dept_id int, 

foreign key (Dept_id)references Departments(Dept_id)

)

create table Dept_Project(
Dept_id int,
Proj_id int,
constraint P_k2 primary key  (Dept_id,Proj_id),
foreign key (Dept_id)references Departments(Dept_id),
foreign key (Proj_id)references Projects(Proj_id)
)

create table dependent1 (
Dep_Name varchar (50),
Dep_Gender bit check (Dep_Gender in ('Male','Female')),
Dep_Birtdate date ,
Dep_Relation varchar(50),
Emp_id int ,
constraint P_k3 primary key (Dep_name,Emp_id),	
foreign key (Emp_id)references Employeeees(Emp_id)
)




===================================
===================================


create database TTT
------------------------------------------------
create table suppliers1
(sup_id int  primary key identity (1,1),
 sup_name varchar(250) not null,
 addres varchar(250), 
 phone char(11)
)
create table products 
(prod_id int  primary key identity (1,1),
prod_nam varchar(250) not null,
amount int 
)
create table quantity_of_prod_supp(
sup_id  int foreign key  references suppliers1(sup_id),
prod_id int foreign key  references products(prod_id), 
constraint sp_pk primary key (sup_id,prod_id),
quantity int 
)
---------------لإدخال البيانات -----------------------------------
insert into products
values ('sugar',20);
--------------------لتحديد كل البيانات --------------------------
select *from products

--------------------لإدخال البيانات ------------------------------
insert into suppliers1
values ('hany','giza',568678);
----------------------------------------------------
insert into quantity_of_prod_supp
values (5,2,50);
----------------------------------------------------
select * from suppliers1;

select *from suppliers1 where sup_name like '%a%';

select *from suppliers1 where sup_name like 'h%';

SELECT * FROM suppliers1 WHERE sup_name not LIKE 'h%';
----------------------------------------------------

select 
	SUM(amount)as Total_Amount,
	MAX(amount)as max_Number,
	MIN(amount)as Min_Number,
	Avg(amount)as Avg_Number,
	COUNT(prod_id) as total_prud,
from products;
----------------------------------------------------
select rand (amount)
from products
-----------------------------------------------------
Select * From products Where prod_id=5 and prod_nam='sugar'
Select * From products Where prod_id=5 or prod_nam='sugar'
Select * From products Where prod_id > 5 and prod_nam=''
Select * From products Where prod_id < 5 or prod_nam=''
Select * From products where prod_id between  1 and 100 
------------------------------------------------------
alter table products add kind varchar(10);

Alter table products drop column Kind ;

Alter table products Alter column Kind varchar(250) ;

select *from products
------------------------------------------------------

delete from products where prod_nam='Sugar';

delete from products where prod_id between 1 and 10
------------------------------------------------------
create database Bank_misr

drop database Bank_misr
------------------------------------------------------
create table IEEE( IEEE_ID int unique ,IEEE_Name varchar(250),IEEE_Crtifcate varchar(250), Gender varchar(250) default 'Male' check (Gender='Male' or Gender='Female'));
insert into IEEE values (11,'www','VR','tre')
drop table IEEE
------------------------------------------------------
select *from products

update products
 SET prod_nam='Ali', amount=250
 WHERE prod_id=2; 
------------------------------------------------------
SELECT DISTINCT prod_nam FROM products; 
 
SELECT TOP 10 percent * FROM products;

SELECT * FROM products ORDER BY prod_id ASC, prod_nam DESC; 


--========== complete joins ================--





select * from quantity_of_prod_supp 
inner join
 products on quantity_of_prod_supp.prod_id=products.prod_id
 
 
 
 
 
 
 ------
 select quantity_of_prod_supp.quantity,quantity_of_prod_supp.prod_id from quantity_of_prod_supp
 inner join 
 suppliers on suppliers.sup_id=quantity_of_prod_supp.sup_id
----------------------------------------------
select Suppliers.sup_name,Suppliers.Phone from Suppliers
 right join 
 quantity_of_prod_supp on Suppliers.sup_id=quantity_of_prod_supp.sup_id 
 ---------------------------------------------
 select * from products 
 right join 
 quantity_of_prod_supp on products.prod_id=quantity_of_prod_supp.prod_id
 ----------------------------------------------
 select * from products 
 left join 
 quantity_of_prod_supp on products.prod_id=quantity_of_prod_supp.prod_id
 ------
 select Suppliers.sup_name,Suppliers.Phone from Suppliers
  left join 
 quantity_of_prod_supp on Suppliers.sup_id=quantity_of_prod_supp.sup_id 
 ----------------------------------------------
 select * from quantity_of_prod_supp
  cross join 
  suppliers,products
 ----------------------------------------------
SELECT products.amount, products.prod_nam FROM products
FULL 
OUTER JOIN quantity_of_prod_supp
ON quantity_of_prod_supp.prod_id=products.prod_id
ORDER BY products.amount; 
 --------------
SELECT *FROM products
FULL outer  JOIN quantity_of_prod_supp
ON quantity_of_prod_supp.prod_id=products.prod_id
ORDER BY products.amount; 
----------------------------------------------

 
 select * from suppliers,products,quantity_of_prod_supp  -- is the same cross join--
 ----------------------------------------------
 
 create index RTF on suppliers(sup_name) 
 
 
 
 
 
 
 
 
 
 
 
 
 
  

insert into products
values (5266,'koko',29,'imp');

 select products.prod_id,prod_nam,quantity
from products,quantity_of_prod_supp,suppliers
where products.prod_id=quantity_of_prod_supp.prod_id
and suppliers.sup_id=quantity_of_prod_supp.sup_id
and sup_name='ahmed';

select sup_name
from products,suppliers,quantity_of_prod_supp
where products.prod_id=quantity_of_prod_supp.prod_id
and suppliers.sup_id=quantity_of_prod_supp.sup_id
and products.prod_id=5218;

select left(prod_id,prod_id)
from products