

use student_management;

select* from student s
	inner join class c on s.class_id=c.id
    where c.id=1;
    
insert into class
	value
    (5,'C0320G1',1);
    
select* from class c
	left join student s on s.class_id=c.id
    where c.id =1 or c.id=5;
    
    
    