create database project1
use project1
                                 /*חלק ב*/
create table Customer(
customer_id int primary key not null,
customer_name varchar(20) not null,
customer_LastName varchar (20),
phone varchar (10) not null
);

create table Course(
course_num int primary key not null,
course_name varchar(20) not null,
price float ,
crs_duration varchar(20) not null,
num_pnts int
);

create table "Order"(
order_id int primary key not null,
customer_id int not null,
quantity int ,
order_date date not null,
);

create table Pastries (
pastries_id int primary key not null,
pastries_name varchar (20) not null,
in_stock int not null,
price int,
);

create table Cakes(
cake_id int primary key not null,
cake_name varchar(20),
price float ,
in_stock varchar (20) not null
);

create table Ingridients(
ingri_id int primary key not null,
ingri_name varchar (20) not null,
ingri_stock varchar (20) not null,
price int,
);


create table CustCrs(
id_customer int not null,
course_num int not null,
grade int,
cust_left varchar(3)
);

create table CakeIngr(
cake_id int not null,
ingri_id int not null,
alerganic varchar (3)
);


create table order_Cake(
order_id int not null,
cake_id int  not null,
quantity varchar (40),
price int,
);

create table order_Past(
order_id int not null,
past_id int not null,
quantity varchar (40),
price int,
);


alter table CustCrs
add Constraint PK_CustCrs Primary key (id_customer , course_num);

alter table CakeIngr
add Constraint PK_CakeIngr Primary key (cake_id ,ingri_id);

alter table order_Past
add Constraint PK_order_Past Primary key (past_id ,order_id);

alter table order_Cake
add Constraint PK_order_Cakes Primary key (cake_id ,order_id);



/********/
alter table "order"
add foreign key (customer_id) references Customer(customer_id);

alter table order_Cake
add foreign key (cake_id) references Cakes(cake_id);

alter table order_Cake
add foreign key (order_id) references "order"(order_id);

alter table order_Past
add foreign key (past_id) references Pastries(pastries_id);

alter table order_Past
add foreign key (order_id) references "order"(order_id);

alter table CustCrs
add foreign key (id_customer) references Customer(customer_id);

alter table CustCrs
add foreign key (course_num) references Course(course_num);

alter table CakeIngr
add foreign key (cake_id ) references Cakes(cake_id);

alter table CakeIngr
add foreign key (ingri_id) references Ingridients(ingri_id);


/***אילוץ NOT NULL**/

alter table CakeIngr
alter column alerganic varchar(20) not null;

              
insert into Customer values(1234,'Bill','Bronx','050-123456')
insert into Customer values(5678,'Ester','Peretz','052-222322')
insert into Customer values(91011,'Sharon','Frank','055-333433')
insert into Customer values(121314,'Chen','Eafargen','054-555655')
insert into Customer values(151617,'James','Bond','053-777877')
insert into Customer values(52487,'Moshe','shalom','057-852432')
insert into Customer values(45682,'Angelina','Jolie','054-552438')
insert into Customer values(35241,'Reut','Choen','055-668521')
insert into Customer values(31873,'Yael','Bitton','055-725421')

insert into Course values(1,'Bakery',500.50,'2w',3)
insert into Course values(2,'Chocolate',799.99,'5d' ,4)
insert into Course values(3,'Pastry',300,'Month',5)
insert into Course values(4,'Butter',654.40,'1w',2)
insert into Course values(5,'Cakes',1050,'4.5w',5)

insert into CustCrs values(31873 ,3,78,'NO')
insert into CustCrs values(1234 ,1,NULL,'YES')
insert into CustCrs values(5678 ,4,85,'NO')
insert into CustCrs values(91011 ,3,70,'NO')
insert into CustCrs values(121314 ,2,65,'NO')
insert into CustCrs values(91011 ,1,NULL,'YES')
insert into CustCrs values(91011 ,4,100,'NO')
insert into CustCrs values(1234 ,3,89,'NO')
insert into CustCrs values(121314 ,1,NULL,'YES')
insert into CustCrs values(52487 ,2,69,'NO')


insert into Cakes values(2508,'Red Velvet',68.50,'12 pieces')
insert into Cakes values(3205,'Basic Chocolate ',49.99,'10 pieces')
insert into Cakes values(4025,'Basic Vanilla',29.99,'30 pieces')
insert into Cakes values(203,'Lemon Cake',38,'5 pieces')
insert into Cakes values(5021,'Cheese Cake',85.50,'2 pieces')


insert into Ingridients values(1630 ,'Milk','12.5L',9)
insert into Ingridients values(503 ,'Cream','2L',15)
insert into Ingridients values(3085 ,'Suger','5kg',5)
insert into Ingridients values(432 ,'Sprinkles','500g',15)
insert into Ingridients values(7085 ,'Fruits','4kg',23)
insert into Ingridients values(1092 ,'Nuts','10kg',13)
insert into Ingridients values(5237 ,'coconut','2kg',16)



insert into CakeIngr values(2508 ,1092,'YES')
insert into CakeIngr values(2508,432,'NO')
insert into CakeIngr values(2508 ,1630,'YES')
insert into CakeIngr values(3205,432,'NO')
insert into CakeIngr values(3205 ,1092,'YES')
insert into CakeIngr values(3205 ,503,'NO')
insert into CakeIngr values(203 ,7085,'NO')
insert into CakeIngr values(203 ,503,'NO')
insert into CakeIngr values(203 ,1630,'YES')

insert into Pastries values(4810,'Apple Pie',120,5)
insert into Pastries values(6302,'Vanilla Bun',250,7)
insert into Pastries values(452,'Chocolate Croissant',323,12)
insert into Pastries values(1402,'Butter Croissant',90,9)
insert into Pastries values(2043,'Alfajor',450,12)


insert into "Order" values(55 ,1234 ,19,'2021-05-07')
insert into "Order" values(65 ,5678 ,5,'2021-05-25')
insert into "Order" values(78 ,91011 ,24,'2021-06-10')
insert into "Order" values(83 ,121314 ,8,'2021-06-30')
insert into "Order" values(92 ,151617 ,9,'2021-07-12')
insert into "Order" values(102 ,45682,5,'2021-08-05')
insert into "Order" values(100 ,35241 ,7,'2021-08-15')


insert into order_Past values(55,4810,'16 Pastries ',90)
insert into order_Past values(65,6302,'5 Pastries',30)
insert into order_Past values(78,2043,'14 Pastries',68)
insert into order_Past values(83,452,'5 Pastries',56)
insert into order_Past values(102,452,'5 Pastries',56)

insert into order_Cake values(55,4025,'3 cakes',90)
insert into order_Cake values(83,4025,'3 cakes',90)
insert into order_Cake values(92,4025,'9 cakes',180)
insert into order_Cake values(78,203,'10 cakes',140)
insert into order_Cake values(100,5021,'7 cakes',40)



/*שאילתא המעדכנת את מס השבועות בקורס מס 1*/
select *
from Course
Update Course
set crs_duration='3w'
where course_num=1

/*שאילתא המעדכנת את כמות במרכיב מס 432*/
select *
from Ingridients
Update Ingridients
set ingri_stock='50g'
where ingri_id=432

/*שאילתא שממיינת את שמות המשפחה של הלקוחות לפי סדר עולה*/
select * 
from Customer
order by customer_LastName

/*שאילתא המציגה את הלקוחות שאין להם את האות 
E בשם*/
select * 
from Customer
where customer_name not like '%e%'

/*שאילתא מחיקה  ממרכיבים*/
DELETE FROM Ingridients
WHERE ingri_id =5237

/*שאילתא שמוחקת לקוח מטבלת מקשרת*/
DELETE FROM CustCrs
WHERE  id_customer in (select customer_id from Customer where customer_name like 'Moshe')

/*שאילתא שמוחקת לקוח*/
DELETE FROM customer
WHERE  customer_id=(select customer_id from Customer where customer_name like 'Moshe')







