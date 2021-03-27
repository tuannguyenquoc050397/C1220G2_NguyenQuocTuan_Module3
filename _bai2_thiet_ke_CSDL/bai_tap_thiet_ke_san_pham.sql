drop database if exists show_room;

create database show_room;

use show_room;


create table offices(
office_code varchar(10) primary key,
city varchar(50) not null,
phone varchar(50) not null,
address_line1 varchar(100) not null,
address_line2 varchar(100),
state varchar(50),
country varchar(50),
postal_code varchar(15) not null
);


create table employees(
employee_number int primary key,
last_name varchar(50) not null,
first_name varchar(50) not null,
email varchar(50) not null,
job_title varchar(50) not null,

report_to int not null,
office_code varchar(10) not null,

foreign key (office_code) references offices(office_code),
foreign key (report_to) references employees(employee_number)

);


create table customers(
customer_number int primary key,
customer_name varchar(50) not null,
contact_last_name varchar(50) not null,
contact_first_name varchar(50) not null,
phone varchar(50) not null,
address_line1 varchar(50) not null,
address_line2 varchar(50),
city varchar(50) not null,
state varchar(50) not null,
postal_code varchar(15) not null,
country varchar(50) not null,
credit_limit double,

sales_rep_employee_number int not null,

foreign key (sales_rep_employee_number) references employees(employee_number)

);

create table orders(
order_number int primary key,
order_date date not null,
required_date date not null,
shipped_date date,
`status` varchar(50) not null,
`comment` text,
quantity_ordered int not null, 
price_each double not null,

customer_number int not null,
foreign key (customer_number) references customers(customer_number)

);

create table payments(
check_number varchar(50) primary key,
payment_date date not null,
amount double not null,

customer_number int not null,
foreign key (customer_number) references customers(customer_number)


);
create table productlines(
product_line varchar(50) primary key,
text_description text,
image text

);

create table products(
product_code varchar(15) primary key,
product_name varchar(70) not null,
product_scale varchar(10) not null,
product_vendor varchar(50) not null,
product_description text not null,
quantityln_stock int not null,
buy_price double not null,
MSRP double not null,

product_line varchar(50) not null,

foreign key (product_line) references productlines(product_line)


);

create table order_details(
order_number int not null,
product_code varchar(15) not null,

primary key(order_number,product_code ),

foreign key (order_number) references orders(order_number),

foreign key (product_code) references products(product_code)

);









