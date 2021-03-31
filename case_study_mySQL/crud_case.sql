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
alter table customers drop numbers_ordered;
alter table customers
add numbers_ordered int;  

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
		from agreements
			right join customers ON agreements.id_customer = customers.id 
			inner join type_customers ON customers.id_type_customer = type_customers.id
			left join services ON agreements.id_service = services.id
			left join agreement_details on agreement_details.id_agreement=agreements.id
            left join extra_services on agreement_details.id_extra_service=extra_services.id;
            
            
insert into customers(id,`name`,date_of_birth,id_card,phone,email,address,id_type_customer)
	value
		(11,'customer11','2001-03-21',2000000011,'0907611348','customer11@mgail.com','Da Nang',1);
        
-- cau 6:

update agreements
    set date_start = case 
    when id =1 then '2018-03-03'
    when id =2 then '2017-03-03'
    when id =3 then '2020-03-03'
    when id =4 then '2021-03-03'
    when id =5 then '2021-03-03'
    end;
    update agreements
    set date_end = case 
    when id =1 then '2018-04-03'
    when id =2 then '2017-04-03'
    when id =3 then '2020-04-03'
    when id =4 then '2021-04-03'
    when id =5 then '2021-04-03'
    end;

       select *
		from services s
			inner join type_services ts on ts.id=s.id_type_service
			left join agreements as a1 on a1.id_service=s.id
		where (a1.date_start < '2019-01-01' or a1.date_start is null) 
			and s.id not in (select a2.id_service from agreements a2  where a2.date_start > '2019-01-01')
		group by s.id;
            
            
       
 -- cau 7:
    
    select * 
    from services 
    where  id not in(
		select id_service 
        from agreements a
			where year(a.date_start)=2019
    ) and id in(
		select id_service 
        from agreements a
			where year(a.date_start)=2018
    );
    
--     select * 
--     from services s
--     inner join agreements a
--     where  year(a.date_start)=2018 and s.id not in( select id_service from agreements b where year(a.date_start)=2019 );
    
    
    -- cau 8: 3 cach lay ten ko trung nhau
    
    update customers
    set `name` = case 
    when id =1 then 'customer1'
    when id =2 then 'customer2'
	when id =3 then 'customer3'
    when id =4 then 'customer4'
	when id =5 then 'customer5'
    when id =6 then 'customer6'
    else 'customers'
    end;
    
    select distinct `name` from customers;
    
    select `name` from customers
    union
    select `name` from customers;
    
	select `name` from customers
		group by `name`;
        
-- cau 9:

select month(a.date_start) as `month`, year(a.date_start) as `year`, count(*)
from agreements a
group by `month`,`year`;

-- cau 10

insert into agreement_details
	value
		(6,1,1,1),
		(7,1,1,3),
		(8,1,1,1);
        
select a.id, a.date_start, a.date_end, sum(a.down_payment), count(ad.id_agreement)
from agreements a
inner join agreement_details ad on ad.id_agreement=a.id
group by ad.id_agreement;

-- cau 11:

select es.id, es.`name`, es.amount, c.`name`, c.address, tc.`name`
from customers c
inner join agreements a on a.id_customer = c.id
inner join agreement_details ad on a.id = ad.id_agreement
inner join extra_services es on ad.id_extra_service = es.id
inner join type_customers tc on tc.id = c.id_type_customer
where tc.`name`='diamond' and (c.address='Da Nang' or c.address='Quang Tri') ;

-- cau 12:

select *
from customers c
inner join agreements a on a.id_customer = c.id
inner join agreement_details ad on a.id = ad.id_agreement
inner join extra_services es on ad.id_extra_service = es.id
where (a.date_start>='2019-09-30' and a.date_start<'2020-01-01')
		and
			a.id not in( select a1.id from agreements a1 where (a.date_start>='2019-01-01' and a.date_start<'2019-07-01') );


select a.id, e.`name`, c.`name`, c.phone, s.id as id_service, s.`name` , count(*) , sum(a.down_payment) 
 from services s
inner join agreements a on a.id_service = s.id
inner join customers c on a.id_customer = c.id
inner join employees e on a.id_employee = e.id
inner join agreement_details ad on a.id = ad.id_agreement
inner join extra_services es on ad.id_extra_service = es.id
where (a.date_start>='2019-09-30' and a.date_start<'2020-01-01')
				and
			s.id not in( select a1.id_service from agreements a1 where (a1.date_start>='2019-01-01' and a1.date_start<'2019-07-01') )
group by s.id;

-- update agreements
--     set id_service = 2
-- where id =7 ;
-- update agreements
--     set date_end='2019-11-01'
-- where id =3 ;

-- cau 13:

select es.id, es.`name`, max(ad.id_extra_service)
from extra_services es
inner join agreement_details ad on ad.id_extra_service= es.id
group by ad.id_extra_service;






    
    
    
    
    
  
  










		
            
			
