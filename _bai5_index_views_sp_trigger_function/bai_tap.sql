


create database demo;


use demo;

create table products(
id int primary key,
`code` varchar(50) not null,
`name` varchar(50) not null,
price double not null,
amount double not null,
`description` varchar(50) not null,
`status` varchar(50) not null
);

insert into products
	value
        (1,'001','ten1', 1700, 1123, 'mo ta', 'online' ),
		(2,'002','ten2', 1070, 11230, 'mo ta', 'online' ),
		(3,'003','ten3', 1500, 1440, 'mo ta', 'online' ),
		(4,'004','ten4', 1800, 10023, 'mo ta', 'online' ),
		(5,'005','ten5', 15400, 15200, 'mo ta', 'online' ),
		(6,'006','ten6', 1060, 10450, 'mo ta', 'online' );
        
        
explain select * from products  where `code`='006';

alter table products add index idx_code(`code`);

create view v_products as
select `name` , `code`, price, `description` from products;

select* from v_products;

create or replace view v_products as
select `name` , `code`, price from products;

drop view v_products;


DELIMITER //

CREATE PROCEDURE get_products()

BEGIN

  SELECT * FROM products;

END //

DELIMITER ;

call get_products;

DELIMITER //

CREATE PROCEDURE add_products(
p_id int,
p_code varchar(50) ,
p_name varchar(50) ,
p_price double,
p_amount double,
p_description varchar(50) ,
p_status varchar(50) 
)

BEGIN
insert into products
value 
(p_id,p_code, p_name, p_price, p_amount, p_description, p_status );

END //

DELIMITER ;

call add_products(8,'007','ten7', 10610, 104150, 'mo ta', 'online');

DELIMITER //

CREATE PROCEDURE del_products(p_id int)

BEGIN

  DELETE FROM products
  where id =p_id;

END //

DELIMITER ;

call del_products(8);




