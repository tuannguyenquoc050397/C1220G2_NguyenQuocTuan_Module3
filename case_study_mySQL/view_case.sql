create view temp01 as
select ad.id_agreement, sum(ad.unit*es.amount) as total
from agreement_details ad
inner join extra_services es on es.id=ad.id_extra_service
group by ad.id_agreement;


create view v_total as
select distinct c.id as id_name, c.`name` as name_customer, tc.`name` as name_type_customer, a.id as id_agreement ,  s.`name`_service, a.date_start, a.date_end, (a.total_payment + ifnull(temp01.total,0)) as total 
from customers c
inner join type_customers tc on c.id_type_customer= tc.id
left join agreements a on a.id_customer = c.id
left join agreement_details ad on ad.id_agreement = a.id
left join services s on a.id_service =  s.id
left join extra_services es on es.id = ad.id_extra_service
left join temp01 on temp01.id_agreement = ad.id_agreement;