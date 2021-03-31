


DELIMITER //

create procedure get_cus_by_id(in cus_num int(11) )
begin 
 select* from customers where customerNumber = cus_num; 
 end
 // delimiter ;
 
 call get_cus_by_id(175);
 
 DELIMITER //

CREATE PROCEDURE GetCustomersCountByCity(IN  in_city VARCHAR(50), OUT total INT)
BEGIN
    SELECT COUNT(customerNumber) INTO total
    FROM customers
    WHERE city = in_city;
END//
DELIMITER ;

CALL GetCustomersCountByCity('Lyon',@total);

select @total ;