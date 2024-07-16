-- DML Queries
-- insert, update, delete


INSERT INTO person_details VALUES (101, 'Reena',"Gupta","2001-08-14",1234567890,"Mumbai");
INSERT INTO person_details(person_id,person_firstname,person_lastname,person_dob,person_mobile_no,person_city) 
VALUES (103, 'Sumit',"Gupta","2003-09-13",1254556780,"NY"),
	   (104, 'Aarohi',"Gupta","2013-08-15",1212122120,"London"),
       (105, 'Niyati',"Kapoor","2014-08-05",1234578906,"Mumbai"),
       (106, 'Ziva',"Khan","2017-07-26",1235567890,"NY");
       
select * from person_details;
truncate person_details;
-- Update query 

UPDATE person_details 
SET 
    person_mobile_no = '1234568890'
WHERE
    person_id = 103;

UPDATE person_details SET person_city="Mumbai";

UPDATE person_details SET person_city= "Newyork" WHERE person_id =  102;
UPDATE person_details SET person_city= "Japan" WHERE person_id =  105;

UPDATE person_details SET person_mobile_no= "1205680239", person_dob = "2001-06-21" WHERE person_id = 101;


-- Change the person city Newyork to NY for the persons living in Newyork 
UPDATE person_details SET person_city ="NY" WHERE person_city = "Newyork";




 


-- Delete query

DELETE FROM person_details WHERE person_id = 105;

DELETE FROM person_details WHERE person_city = "Japan";
 



-- DQL Queries 
SELECT * FROM person_details;

