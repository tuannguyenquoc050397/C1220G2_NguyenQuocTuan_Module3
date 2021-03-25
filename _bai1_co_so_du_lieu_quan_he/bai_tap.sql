

create database classicmodels;

use classicmodels;

create table customer(
id int primary key,
customer_name varchar(50),
phone varchar(10),
city varchar(50),
country varchar(30)
);

insert into customer
value
(1,'tuan1','0909091','Da Nang','Viet Nam'), 
(2,'tuan2','0909092','Ha Noi','Viet Nam'), 
(3,'tuan3','0909093','HCM','Viet Nam'), 
(4,'tuan4','0909094','Quang Tri','Viet Nam'), 
(5,'tuan5','0909095','Hue','Viet Nam');

select * from customer;

select customer_name, phone, city, country from customer;


select * from customer where id=1;

select * from customer where customer_name='tuan3';

select * from customer where city='Da Nang';

select * from customer where customer_name like '%3%';

select * from customer where city in ('Da Nang', 'Quang Tri');



drop table customer;









