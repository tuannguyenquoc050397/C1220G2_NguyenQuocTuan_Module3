use case_study_furama;

insert into customers
value
		(6,'customer6','2010-03-21',2000000002,'0907686869','customer2@mgail.com','Quang Tri',1),
		(7,'customer7','1950-03-21',2000000002,'0907686869','customer2@mgail.com','Quang Tri',1);


-- cau 2: ten co 1 hoac 3, do dai ten <15

select* from employees
	where (`name` like '%1%' OR `name` like '%3%') AND length(`name`)<15;
    
select* from customers;

-- cau 3: 18-50 tuoi, dia chi quang tri hoac da nang

-- **** cach 1:
select* from customers
	where (date_of_birth <= date_sub(CURDATE(), interval 18 year) and date_of_birth >= date_sub(CURDATE(), interval 50 year))
			and (address='Quang Tri' or address='Da Nang');
-- **** cach 2:
select*,ceil(datediff(curdate(), date_of_birth)/365) as age from customers
	where ceil(datediff(curdate(), date_of_birth)/365)>=18 and ceil(datediff(curdate(), date_of_birth)/365)<50;
    
-- cau 4: 

alter table customers
add numbers_ordered int default 1;  

update customers 
set numbers_ordered=2
where id=2;

update customers 
set numbers_ordered =case
	when id=2 then 2
    when id=3 then 10
    when id=4 then 6
	when id=5 then 8
    else 1
end;

SELECT 
    customers.*, type_customers.`name` as type_customer
FROM
    customers
        INNER JOIN
    type_customers ON customers.id_type_customer = type_customers.id
		where type_customers.`name`='diamond' 
        order by customers.numbers_ordered ASC;


-- cau 5:

select customers.id, customers.`name`, type_customers.`name` as type_customer, agreements.id as id_agreement, services.`name` as name_services,agreements.date_start,
agreements.date_end, (services.cost+extra_services.amount*extra_services.unit) as cost
		from customers
			inner join type_customers ON customers.id_type_customer = type_customers.id
			inner join agreements ON agreements.id_customer = customers.id
			inner join services ON agreements.id_service = services.id
			inner join agreement_details on agreement_details.id_agreement=agreements.id
            inner join extra_services on agreement_details.id_extra_service=extra_services.id;



	
