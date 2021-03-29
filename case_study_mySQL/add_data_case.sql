

use case_study_furama;


insert into positions
	value 
		(1,'leader'),
		(2,'employee'),
		(3,'trainee');
        
delete from positions;
        
insert into levels
	value 
		(1,'level 1'),
		(2,'level 2'),
		(3,'level 3');
        
insert into departments
	value 
		(1,'sale'),
		(2,'marketing'),
		(3,'manager');
        
        
insert into type_customers
	value
		(1,'diamond'),
		(2,'platium'),
		(3,'gold'),
        (4,'member');
        
        
   
insert into type_services
	value 
		(1,'president'),
		(2,'vip'),
		(3,'normal');
        
        
insert into type_rents
	value
		(1,'month',600),
		(2,'week',200),
		(3,'day',75);
        
    insert into extra_services
	value
		(1,'karaoke',100,1,'yes'),
		(2,'drink',80,1,'yes'),
		(3,'food',80,1,'yes');  
        
    insert into employees
	value
		(1,'employee1','2001-03-21',1000000001,5000,'0906686868','employee1@mgail.com','Da Nang',1,2,1),
		(2,'employee2','2001-03-21',1000000002,4000,'0906686869','employee2@mgail.com','Quang Tri',2,1,2),
		(3,'employee3','2001-03-21',1000000003,4500,'0906686878','employee3@mgail.com','Ho Chi Minh',1,1,2),
		(4,'employee4','2001-03-21',1000000004,3000,'0906576868','employee4@mgail.com','Hue',1,3,3),       
		(5,'employee5','2001-03-21',1000000005,4700,'0906681268','employee5@mgail.com','Quang Tri',3,1,1);
        
     insert into customers
	value
		(1,'customer1','2001-03-21',2000000001,'0907686868','customer1@mgail.com','Da Nang',1),
		(2,'customer2','2001-03-21',2000000002,'0907686869','customer2@mgail.com','Quang Tri',1),
		(3,'customer3','2001-03-21',2000000003,'0907686878','customer3@mgail.com','Ho Chi Minh',4),
		(4,'customer4','2001-03-21',2000000004,'0907576868','customer4@mgail.com','Hue',3),       
		(5,'customer5','2001-03-21',2000000005,'0907681268','customer5@mgail.com','Quang Tri',3);   
        
    insert into services
	value
		(1,'Villa',50,5,20,1000,'yes',1,3),    
		(2,'Villa',40,4,20,500,'yes',2,3),    
		(3,'Villa',40,4,10,3000,'yes',3,1),    
		(4,'Villa',40,4,20,1500,'yes',2,2),    
		(5,'Villa',40,4,10,300,'yes',3,3);
        
insert into agreements
	value  
		(3,'2000-03-21','2000-04-21',200,3000,1,2,3),
		(1,'2000-03-21','2000-03-22',200,1000,2,3,1),
		(2,'2000-03-21','2000-03-22',100,500,3,1,2),
		(4,'2000-03-21','2000-03-28',200,1500,4,4,4),
		(5,'2000-03-21','2000-03-22',100,300,5,5,5);
	
    
insert into agreement_details
	value
		(1,2,1,2),
		(2,3,3,1),
		(3,1,4,3),
		(4,3,5,1),
		(5,2,2,3);




        
        
        
     
		
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    