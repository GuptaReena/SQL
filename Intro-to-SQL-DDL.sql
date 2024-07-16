/*
Five categories of sql queries

DDL: Data defination language
		: Any query that works on the structure of the data :
        : create,alter,truncate,drop
DML: Data manuplation language
		: Any query that works on the tables of data :
		: insert, update, delete
DQL: Data query language
		: A query that queries the table
        : select query
DCL: Data control language
		: A query to give previleges to the user
        : grant, revoke
TCL: Transaction control language
		:This include the transaction control queries
		: commit,rollback,savepoint
*/

-- DDL - Data defination language queries
	
    CREATE DATABASE IF NOT EXISTS demodb;
    USE demodb;
    SHOW DATABASES;
    DROP DATABASE demodb;
    
    
    -- Table related queries
    
    -- Creating table person_details 
   CREATE TABLE person_details (
    person_id INT,
    person_firstname VARCHAR(20),
    person_lastname VARCHAR(20),
    person_dob DATE,
    person_mobile_no INT
);


-- It is use to describe the structure of the table 
DESC person_details;

-- With the help of alter comman we can ADD OR MODIFY the column

ALTER TABLE person_details ADD COLUMN person_city VARCHAR(20);

ALTER TABLE person_details MODIFY COLUMN person_mobile_no VARCHAR(20);

ALTER TABLE person_details DROP COLUMN person_city;

DROP TABLE person_details;



    