drop database if exists case_study_2;


create database case_study_2;

use case_study_2;

create table `position`(
id int primary key,
`name` varchar(50) not null
);

create table education_degree(
id int primary key,
`name` varchar(50) not null
);

create table division(
id int primary key,
`name` varchar(50) not null
);

create table customer_type(
id int primary key,
`name` varchar(50) not null
);

create table service_type(
id int primary key,
`name` varchar(50) not null
);

create table rent_type(
id int primary key,
`name` varchar(50) not null,
cost double not null
);

create table attach_service(
id int primary key,
`name` varchar(50) not null,
cost double not null,
unit int default 1,
status varchar(50) default 'yes'
);

create table `role`(

id int primary key,

`name` varchar(50) not null

);

create table `user`(

username varchar(50) primary key,
`password` varchar(50) not null

);

create table employee(

id int primary key,
`name` varchar(50) not null,
date_of_birth date not null,
id_card varchar(10) not null,
salary double not null,
phone varchar(50) not null,
email varchar(50) not null,
address varchar(50) not null,

position_id int not null,
education_degree_id int not null,
division_id int not null,
user_username varchar(50) not null,


foreign key (user_username) references `user`(username) ON DELETE CASCADE,
foreign key (position_id) references `position`(id) ON DELETE CASCADE ,
foreign key (education_degree_id) references education_degree(id) ON DELETE CASCADE,
foreign key (division_id) references division(id) ON DELETE CASCADE

);

create table user_role(

role_id int not null,
user_username varchar(50) not null,

primary key(role_id, user_username),

foreign key (role_id) references `role`(id)  ON DELETE CASCADE,
foreign key (user_username) references `user`(username)  ON DELETE CASCADE


);

create table customer(
id int primary key,
`name` varchar(50) not null,
date_of_birth date not null,
gender BIT(1),
id_card varchar(10) not null,
phone varchar(50) not null,
email varchar(50) not null,
address varchar(50) not null,

customer_type_id int not null,

foreign key (customer_type_id) references customer_type(id) ON DELETE CASCADE

);

create table service(
id int primary key,
`name` varchar(50) not null,
area double not null,
cost double not null,
max_people int not null,
stand_room varchar(50),
description_other_convenience varchar(50),
pool_area double,
number_of_floor int not null,

service_type_id int not null,
rent_type_id int not null,

foreign key (service_type_id) references service_type(id) ON DELETE CASCADE,
foreign key (rent_type_id) references rent_type(id) ON DELETE CASCADE

);

create table contract(
id int primary key,
start_date date not null,
end_date date,
down_payment double,
total_payment double not null,

employee_id int not null,
customer_id int not null,
service_id int not null,

foreign key (employee_id) references employee(id) ON DELETE CASCADE,
foreign key (customer_id) references customer(id) ON DELETE CASCADE,
foreign key (service_id) references service(id) ON DELETE CASCADE

);

create table contract_detail(
id int primary key,
quantity int not null,


contract_id int not null,
attach_service_id int not null,

foreign key (contract_id) references contract(id) ON DELETE CASCADE,
foreign key (attach_service_id) references attach_service(id) ON DELETE CASCADE

);












