drop database if exists libary;

 create database libary;
 
 use libary;
 
 
  create table categorys(
 id int primary key,
 `name` varchar(50) not null

 );
 
 
 create table books(
 id int primary key,
 `name` varchar(50) not null,
 categorys_id int not null,
 
 foreign key (categorys_id) references categorys(id)
 
 
 );
 
 create table students(
 id int primary key,
 `name` varchar(50) not null,
 address varchar(50) not null,
 email varchar(50) not null,
 image blob
 
 );
 
 create table libary_cards(
 id int primary key,
 students_id int not null,
 foreign key (students_id) references students(id)
 
 );
 
 create table borrow_orders(
 libary_cards_id int not null,
 books_id int not null,
 
 primary key(libary_cards_id,books_id),
 
 foreign key (libary_cards_id) references libary_cards(id),
 foreign key (books_id) references books(id)
 
 );
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 