

create database thuc_hanh_bai2;

use thuc_hanh_bai2;

create table if not exists contacts (
contact_id int(11) not null auto_increment,
first_name varchar(30) not null,
last_name varchar(30),
birth_day date,
country varchar(50) default 'Viet Nam',
constraint contact_pk primary key (contact_id)
);


insert into contacts
value
(1,'nguyen','tuan', '2021-03-26'),
(2,'tran','anh', '2021-03-26'),
(3,'hoang','ha', '2021-03-26'),
(4,'thu','thuy', '2021-03-26');

insert into contacts (first_name) value ('nguyen');

insert into contacts (first_name, last_name, birth_day)
value
('nguyen','tuan', '2021-03-26'),
('tran','anh', '2021-03-26'),
('hoang','ha', '2021-03-26'),
('thu','thuy', '2021-03-26');

create table suppliers(
id int(11) auto_increment primary key,
`name` varchar(50) not null,
account_rep varchar(50) not null default 'TDB'

);

alter table suppliers
	add address varchar(50) not null default '295-Nguyen Tat Thanh';
    
alter table suppliers
	add made varchar(50)
    after `name`;
    
alter table suppliers
	modify made char(15);
    
alter table suppliers
	drop column made;
    
alter table suppliers
	change column made_in made_in_1 varchar(10);
    
    
    
insert into suppliers (made_in_1)
value
('bb asd');

alter table suppliers
	modify column `name` varchar(1); 
    
insert into suppliers (`name`)
	value
('b');


create table users(
user_id int auto_increment primary key,
 username VARCHAR(40),
   password VARCHAR(255),
   email VARCHAR(255)
);

create table roles(
role_id int auto_increment primary key,
role_name varchar(50)
);

create table role_user(
role_id int not null,
user_id int not null,
primary key(role_id, user_id),
foreign key (role_id) references roles(role_id),
foreign key (user_id) references users(user_id)
);

insert into users(username)
	value
	('tuan2'),
    ('tuan3'),
    ('tuan4');
    
insert into roles(role_name)
	value
	('tuan2'),
    ('tuan3'),
    ('tuan4');
    
delete from users;


create table customers(
id int(11) auto_increment primary key,
`name` varchar(50),
address varchar(50),
email varchar(50)
);
   
create table orders(
id int(11) auto_increment primary key,
staff varchar(50),
customer_id int, 
foreign key (customer_id) references   customers(id)
);

    



