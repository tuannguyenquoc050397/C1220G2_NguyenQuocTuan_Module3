drop database if exists case_study_furama;


create database case_study_furama;

use case_study_furama;

create table positions(
id int primary key,
`name` varchar(50) not null
);

create table levels(
id int primary key,
`name` varchar(50) not null
);

create table departments(
id int primary key,
`name` varchar(50) not null
);

create table type_customers(
id int primary key,
`name` varchar(50) not null
);

create table type_services(
id int primary key,
`name` varchar(50) not null
);


create table type_rents(
id int primary key,
`name` varchar(50) not null,
amount double not null
);

create table extra_services(
id int primary key,
`name` varchar(50) not null,
amount double not null,
unit int default 1,
states varchar(10) default 'yes'  

);

create table employees(
id int primary key,
`name` varchar(50) not null,
date_of_birth date not null,
id_card varchar(10) not null,
salary double not null,
phone varchar(50) not null,
email varchar(50) not null,
address varchar(50) not null,

id_position int not null,
id_department int not null,
id_level int not null,

foreign key (id_position) references positions(id),
foreign key (id_department) references departments(id),
foreign key (id_level) references levels(id)
);

create table customers(
id int primary key,
`name` varchar(50) not null,
date_of_birth date not null,
id_card varchar(10) not null,
phone varchar(50) not null,
email varchar(50) not null,
address varchar(50) not null,

id_type_customer int not null,

foreign key (id_type_customer) references type_customers(id)

);

create table services(
id int primary key,
`name` varchar(50) not null,
area double not null,
floor int not null,
numbers_people int not null,
cost double not null,
states varchar(50),

id_type_service int not null,
id_type_rent int not null,

foreign key (id_type_service) references type_services(id),
foreign key (id_type_rent) references type_rents(id)

);


create table agreements(
id int primary key,
date_start date not null,
date_end date,
down_payment double,
total_payment double not null,

id_employee int not null,
id_customer int not null,
id_service int not null,

foreign key (id_employee) references employees(id),
foreign key (id_customer) references customers(id),
foreign key (id_service) references services(id)

);

create table agreement_details(
id int primary key,
unit int default 1,


id_agreement int not null,
id_extra_service int not null,

foreign key (id_agreement) references agreements(id),
foreign key (id_extra_service) references extra_services(id)

);















