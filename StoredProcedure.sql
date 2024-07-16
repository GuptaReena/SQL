-- step 1 : Create Procedure 

delimiter //
create procedure demodb.person_details(id int, firstName varchar(20), lastName varchar(20), dob DATE, mobile_no int , city varchar(20))

begin

	insert into person_details values(id,firstName,lastName,dob,mobile_no, city);

end //

delimiter ;

-- step 2 : Call the procedure Statement

call demodb.person_details(107,'kaushal','choudhari','2001-06-21',1221142109,'US'); 

select * from person_details;

