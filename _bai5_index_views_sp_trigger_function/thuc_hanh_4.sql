create view customer_view 
	as
		select customerNumber, customerName, phone

FROM  customers;


select* from customer_view;


create or replace view customer_view as
select customerNumber, customerName, contactFirstName, contactLastName, phone

FROM customers

WHERE city = 'Nantes';

select* from customer_view; 


DROP VIEW customer_views;


