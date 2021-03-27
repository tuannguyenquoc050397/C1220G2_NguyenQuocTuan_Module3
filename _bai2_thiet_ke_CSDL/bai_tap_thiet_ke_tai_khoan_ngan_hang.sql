drop database if exists bank_manager;


create database bank_manager;

use bank_manager;

create table phones(
id int auto_increment primary key,
phone1 varchar(10),
phone2 varchar(10),
phone3 varchar(10)
);

create table emails(
id int auto_increment primary key,
email1 varchar(50),
email2 varchar(50),
email3 varchar(50)
);

create table type_accounts(
id int auto_increment primary key,
type_account varchar(50) not null
);

create table transactions(
id int auto_increment primary key,
money_trans double not null,
date_trans date not null,
describes varchar(255)
);

create table accounts(
id varchar(50) primary key,
date_open_accounts date not null,
balance double not null,
id_type_accounts int,
id_transaction int,
foreign key (id_transaction) references transactions(id),
foreign key (id_type_accounts) references type_accounts(id)
);

create table customers(
customer_number int(11) auto_increment primary key,
full_name varchar(50) not null,
id_email int,
id_phone int,
id_account varchar(50),
foreign key (id_email) references emails(id),
foreign key (id_phone) references phones(id),
foreign key (id_account) references accounts(id)

);


