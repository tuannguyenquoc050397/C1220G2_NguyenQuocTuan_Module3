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

-- **** ----
select  c.`name`, c.id_type_customer, count(a.id_customer)
from customers c
 left join agreements a on a.id_customer= c.id
 where c.id_type_customer = 1 or a.id_customer is null
 group by a.id_customer;


-- cau 5: cui bap

select customers.id, customers.`name`, type_customers.`name` as type_customer, agreements.id as id_agreement, services.`name` as name_services,agreements.date_start,
agreements.date_end, (services.cost+extra_services.amount*extra_services.unit) as cost
		from agreements
			right join customers ON agreements.id_customer = customers.id 
			inner join type_customers ON customers.id_type_customer = type_customers.id
			left join services ON agreements.id_service = services.id
			left join agreement_details on agreement_details.id_agreement=agreements.id
            left join extra_services on agreement_details.id_extra_service=extra_services.id;
            
            
            -- cau 5: v_total trong file view_case

select * from v_total;
            
		
        
-- cau 6: hien thi tat ca dich vu chua tung dc dat trong quy 1 nam 2000.... 

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
	inner join type_services ts on ts.id = s.id_type_service
	left join agreements a on a.id_service=s.id
	where date_start is null
			or s.id not in (
				select agreements.id_service 
                from agreements 
                where date_start < '2000-03-30' and date_start > '2000-01-01'
                );
            
            
       
 -- cau 7: tim dich vu dc dat trong 2018 va chua tung duoc dat trong nam 2019
    
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
        
-- cau 9:thuc hien thong ke so lan dat hang theo thang/ nam

select month(a.date_start) as `month`, year(a.date_start) as `year`, count(*)
from agreements a
group by `month`,`year`;

-- cau 10: dem so lan dat dich vu di kem cua tung hop dong

insert into agreement_details
	value
		(6,1,1,1),
		(7,1,1,3),
		(8,1,1,1);
        
select a.id, a.date_start, a.date_end, ifnull(count(ad.id_extra_service),0)
from agreements a
left join agreement_details ad on ad.id_agreement=a.id
group by a.id;

-- cau 11:

select es.id, es.`name`, es.amount, c.`name`, c.address, tc.`name`
from customers c
inner join agreements a on a.id_customer = c.id
inner join agreement_details ad on a.id = ad.id_agreement
inner join extra_services es on ad.id_extra_service = es.id
inner join type_customers tc on tc.id = c.id_type_customer
where tc.`name`='diamond' and (c.address='Da Nang' or c.address='Quang Tri') ;

-- cau 12:

select a.id, e.`name`, c.`name`, c.phone, s.id as id_service, s.`name` , count(*) , a.down_payment
 from services s
inner join agreements a on a.id_service = s.id
inner join customers c on a.id_customer = c.id
inner join employees e on a.id_employee = e.id
left join agreement_details ad on a.id = ad.id_agreement
left join extra_services es on ad.id_extra_service = es.id
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

-- cau 13: hien thi cac dich vu di kem co so lan su dung nhieu nhat

		-- cach 1: dung view 

create view max1 as
select es.`name`,es.amount , count(ad.id_extra_service) as number_use_extra_service
from extra_services es
inner join agreement_details ad on ad.id_extra_service= es.id
group by ad.id_extra_service;

create view max2 as 
select max(number_use_extra_service) from max1;

select * from max1 
where number_use_extra_service in ( select* from max2 );

		-- cach 2: dung sub query

select es.id, es.`name`, count(es.id) 
	from extra_services es
	inner join agreement_details ad on ad.id_extra_service = es.id
	group by es.id
		having   count(es.id)  in (
			select  max(tmp.dem)
				from (
					select es.id, es.`name`, count(es.id) as dem
						from extra_services es
						inner join agreement_details ad on ad.id_extra_service = es.id
						group by es.id
                        ) as tmp
                );

-- cau 14 : hien thi cac dich vu di kem co so lan su dung la 1

		-- cach 1: 
select es.id, es.`name`, count(es.id) 
	from extra_services es
	inner join agreement_details ad on ad.id_extra_service = es.id
	group by es.id
		having   count(es.id) = 1;

		-- cach 2: view cu chuoi
create view min1 as
select a.id as id_agreement, s.`name` as name_services, es.`name` as name_extra_services, count(ad.id_extra_service) as number_use_extra_service
from agreements a
inner join services s on a.id_service = s.id 
inner join agreement_details ad on a.id = ad.id_agreement
inner join extra_services es on ad.id_extra_service = es.id
group by ad.id_extra_service; 

select * from min1
where number_use_extra_service in ( select number_use_extra_service from min1 where number_use_extra_service=1 );




-- cau 15: tim nhan vien co toi da 3 hop dong trong nam 2019

select e.`name` as employee, count(a.id_employee)
from employees e
inner join agreements a on a.id_employee = e.id 
where year(a.date_start)=2019
group by a.id_employee
having count(a.id_employee)<=3;

-- cau 16: 


insert into employees
	value
		(20,'employee10','2001-03-21',1000000001,5000,'0906686868','employee1@mgail.com','Da Nang',1,2,1);
        
insert into agreements
	value  
		(20,'2050-03-21','2050-04-21',200,3000,20,2,3);
        
insert into agreement_details
	value
		(20,2,20,2);
        
        

delete from employees
where id in (
	select tmp.id
    from
	(select e.id
    from employees e
    inner join agreements a on a.id_employee = e.id 
    where year(a.date_start)=2050) as tmp
);


-- delimiter //
-- create trigger del_employee
-- before delete
-- on employees for each row
-- begin
-- 	delete from agreements
--     where old.id=agreements.id_employee;
-- end;
-- // delimiter ;

-- delimiter //
-- create trigger del_agreement
-- before delete
-- on agreements for each row
-- begin
-- 	delete from agreement_details
--     where old.id=agreement_details.id_agreement;
-- end;
-- // delimiter ;
-- DROP TRIGGER del_agreement;
-- DROP TRIGGER del_employee;


-- cau 17: -- v_total trong file view_case
update customers c
set c.id_type_customer = 1
where c.id_type_customer = 2 and c.id in(
select id_name from  v_total 
where year(date_start)=2000 
group by id_name
having sum(total)>10000
);

-- cau 18: nen tao 1 column delete true/false true. chua xoa, false da xoa.

delete from customers c
	where id in(
		select tml.id_customer 
        from (
		select a.id_customer 
        from agreements a 
        where year(date_start)<2016 
			) as tml
    );


-- cau 19:


update extra_services set amount=amount*2
where id in(
select* from temp1
);

-- phai tao 1 view, neu lam truc tiep (sub query) se bi loi 1093

create view temp1 as
select  es.id
from extra_services es
inner join agreement_details ad on ad.id_extra_service = es.id
inner join agreements a on a.id = ad.id_agreement
where year(a.date_start) = 2019
group by ad.id_extra_service
having count(ad.id_extra_service)>=2;
select * from temp1;

-- cau 20:

select id, `name` , email, phone, date_of_birth, address from customers

union all

select id, `name` , email, phone, date_of_birth, address from employees;


-- cau 21:

create view v_employees as
select e.* from employees e
inner join agreements a on a.id_employee = e.id
where a.date_start = '2019-10-01' and e.address='Quang Tri'
group by e.id;

select* from v_employees;


-- cau 22:

update employees set address='Lien Chieu'
where id in(
select id from v_employees
);


-- cau 23:

delimiter //
create procedure SP_1 (p_id int)
begin
delete from customers
where id = p_id;
end;
// delimiter ;

-- cau 24:
-- id, date_start, date_end, down_payment, total_payment, id_employee, id_customer, id_service
delimiter //
create procedure SP_2 (p_id int,p_date_start date, p_date_end date, p_down_payment double, p_total_payment double,
					p_id_employee varchar(50), p_id_customer varchar(50), p_id_service varchar(50), out result varchar(50))
begin
	set @flag_id = 0;
    select id into @flag_id from agreements where p_id = id;
    
    set @flag_id_customer = 0;
    select id into @flag_id_customer from customers where p_id_customer = id ;
    
      set @flag_id_employee = 0;
    select id into @flag_id_employee from employees where p_id_employee = id ;
    
       set @flag_id_service = 0;
    select id into @flag_id_service from services where p_id_service = id ;
    
    if (@flag_id = 0 and @flag_id_service <> 0 and @flag_id_employee <> 0 and @flag_id_customer <> 0 ) then
    
       insert into agreements
       value 
        (p_id ,p_date_start , p_date_end , p_down_payment , p_total_payment ,
					p_id_employee , p_id_customer , p_id_service);
                    
		set result= 'them hop dong thanh cong';
        
	else 
    
		set result= 'them hop dong that bai';
        
        end if;
end
// delimiter ;

    

-- cau 25: ko the su dung select trong trigger ????

    
-- cau 26: khi tao trigger tren table A thi ko the update or delete table A trong than cua trigger?
delimiter //

create trigger TR_2
before update
on agreements for each row
begin
if datediff(new.date_end, old.date_start) < 2 then
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày';
 end if;
end;
// delimiter ;

update agreements set date_end= '2000-03-23' where id=1;

drop trigger TR_2;

-- delimiter //

-- create trigger TR_2
-- after update
-- on agreements for each row
-- begin

-- update agreements set new.id=old.id, new.date_start=old.date_start, new.date_end=old.date_end, new.down_payment=old.down_payment, new.total_payment=old.total_payment, new.id_employee=old.id_employee, new.id_customer=old.id_customer,new.id_service= old.id_service
--     where datediff(agreements.date_end, agreements.date_start);

-- end;
-- // delimiter ;


-- cau 27:


 delimiter //
create function func_1 ()
returns int
deterministic
begin
	
	set @a = (select count(id ) 
				from services
					where  id  in(
								select a.id_service 
								from  agreements a
								group by a.id_service
								having sum(a.total_payment)>10000)
								);
	return @a;
end;
// delimiter ;

select func_1();


delimiter //
create function func_2 (p_id_customer int)
returns int
deterministic
begin
    set @max= (select max(datediff(a.date_end, a.date_start)) as sub_date
        from agreements a
        where a.id_customer=p_id_customer);
	
	return @max;
	
	
end;
// delimiter ;

select func_2(1);

-- cau 28:
    insert into services
	value
		(10,'Room',50,5,20,1000,'yes',1,3),  
        (11,'Room',50,5,20,1500,'yes',1,3), 
        (12,'Room',50,5,20,2000,'yes',1,3);
        
        
     insert into agreements
	value    
		(30,'2015-03-21','2000-04-21',200,3000,1,2,10),
		(31,'2019-03-21','2000-03-22',200,1000,2,3,11),
		(32,'2000-03-21','2000-03-22',100,500,3,1,12);
        
delimiter //
create procedure SP_3 ()
begin

delete from services
		where id_type_service = 1 and id in (
        select tmp1.id 
        from
			(
				select a.id_service  as id
				from agreements a
				where (year(a.date_start)>=2015 and year(a.date_start)<2020) 
			) as tmp1
        );
end;
// delimiter ;

call SP_3();










		
            
			
