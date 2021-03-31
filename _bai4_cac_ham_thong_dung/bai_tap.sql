drop database if exists bai_tap;

create database bai_tap;


use bai_tap;

create table students(
id int not null,
`name` varchar(50) not null,
age int(2) not null,
khoa_hoc varchar(50) not null,
so_tien double not null

);

insert into students
	value
		(1,'Hoang', 21, 'CNTT', 43000),
		(2,'Viet', 19, 'CNTT', 43000),
		(3,'Thanh', 18,' CNTT', 43000),
		(4,'Hoang', 19, 'CNTT', 43000),
		(5,'Huong', 20, 'CNTT', 43000),
		(5,'Huong', 20,' CNTT', 43000);
        
        
select * from students where `name`='Huong';


select `name`, sum(so_tien) from students
where `name` = 'Huong'
 group by `name`;
 
 select distinct `name` from students ;