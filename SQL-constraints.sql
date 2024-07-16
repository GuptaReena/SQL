-- Sql Constraints

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

select * from person_details;
desc person_details;

--  ways to add constraints in the table
-- 1. using alter table query

Alter table person_details modify column person_firstname varchar(20) not null;
Alter table person_details modify column person_lastname varchar(20) not null;
Alter table person_details modify column person_dob DATE not null;
Alter table person_details modify column person_mobile_no varchar(20);
Alter table person_details modify column person_city varchar(20) not null;


Insert into person_details(person_city) values ("Mumbai");

-- 2. Specifing the constraints while creating a table 

 -- Creating table person_details 
   CREATE TABLE person_details (
    person_id INT,
    person_firstname VARCHAR(20) NOT Null,
    person_lastname VARCHAR(20) Not Null,
    person_dob DATE not null,
    person_mobile_no INT,
    person_city varchar(20) not null
);

-- Uniquekey constraints 
-- 1. using alter table query

alter table person_details add constraint UK_person_mobile unique(person_mobile_no); 

-- 2. using create table query
-- Specifying the constraints at the column level
CREATE TABLE person_details (
    person_id INT,
    person_firstname VARCHAR(20) NOT Null,
    person_lastname VARCHAR(20) Not Null,
    person_dob DATE not null,
    person_mobile_no INT unique,
    person_city varchar(20) not null
    
);

-- Specifying the constraints at the table level
CREATE TABLE person_details (
    person_id INT,
    person_firstname VARCHAR(20) NOT Null,
    person_lastname VARCHAR(20) Not Null,
    person_dob DATE not null,
    person_mobile_no INT,
    person_city varchar(20) not null,
    unique(person_mobile_no)
);



-- Primary Key Constraints
-- Primary key cannot be null and duplicate 
-- Primary key is a combination of  Not null constraints +  Unique key constraints + automatically index constraints

-- 1. using alter table query


alter table person_details add constraint PK_person_id PRIMARY KEY(person_id);
alter table person_details add PRIMARY KEY(person_id);

-- Specifying the constraints at the column level
CREATE TABLE person_details (
    person_id INT PRIMARY key,
    person_firstname VARCHAR(20) NOT Null,
    person_lastname VARCHAR(20) Not Null,
    person_dob DATE not null,
    person_mobile_no INT unique,
    person_city varchar(20) not null
    
);  

-- Specifying the constraints at the table level
CREATE TABLE person_details (
    person_id INT,
    person_firstname VARCHAR(20) NOT Null,
    person_lastname VARCHAR(20) Not Null,
    person_dob DATE not null,
    person_mobile_no INT unique,
    person_city varchar(20) not null,
    constraint PK_person_id primary key(person_id)
);

drop table person_details;



-- Foreign key Constraints
-- It is use for refernce to another table 
-- Foreign key give referinatial integrity 


CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(20) NOT NULL
);

insert into department values(501,'HR');
insert into department values(502,'Admin');
insert into department values(503,'IT');
insert into department values(504,'Finance');

select * from department;

CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(20) not null,
    emp_contact varchar(10),
    emp_dept INT,
    CONSTRAINT FK_emp_dept FOREIGN KEY(emp_dept) REFERENCES department(dept_id)
);

drop table employee;

insert into employee values(101,'Reena','1234567890',501);
insert into employee values(102,'Arohi','9867294931',502);
insert into employee values(103,'Nitiya','9768755946',503);
insert into employee values(104,'Siddhart','9326786780',504);

insert into employee values(105,'Ziva','9930072009',509); -- error because of foreign key violation

select * from employee;



-- default 
-- 1. using alter table query

alter table person_details alter person_city set  default 'world';
insert into person_details(person_id,person_firstname,person_lastname,person_mobile_no,person_dob,person_city) values(107,"Shardual","Meman","9136243003","2024-06-20",'London');
insert into person_details(person_id,person_firstname,person_lastname,person_dob) values(107,"Shardual","Meman","2024-06-20");
delete from person_details where person_id=107;
select * from person_details;


-- 2. using create table query
-- Specifying the constraints at the column level
CREATE TABLE person_details (
    person_id INT,
    person_firstname VARCHAR(20) NOT Null,
    person_lastname VARCHAR(20) Not Null,
    person_dob DATE not null,
    person_mobile_no INT unique DEFAULT 'world',
    person_city varchar(20) not null
    
);

-- Check Constrainsts

-- 1. using alter table query

alter table person_details add check(person_mobile_no >= 1000000000  and person_mobile_no <= 9999999999);
insert into person_details values(107,'Emma','waston','2001-08-15',15678,'Chicago'); -- error as a check constraints voliation

 
-- 2. using table query

-- indexes
-- Primary key is a combination of  Not null constraints +  Unique key constraints + automatically index constraints
select * from person_details;
create index idx_person_city on person_details(person_city);
select person_firstname , person_lastname , person_city from person_details where person_city = 'Mumbai';

create index idx_person_city_person_last_name on person_details(person_lastname, person_city);
select person_firstname , person_lastname , person_city from person_details where person_city = 'Mumbai' and person_lastname = 'Gupta';
 
alter table person_details drop index idx_person_city_person_last_name;
alter table person_details drop index idx_person_city;

show INDEX from person_details;
desc  person_details;

-- Auto Increment 

CREATE TABLE color_details (
    color_id INT PRIMARY KEY AUTO_INCREMENT,
    color_name VARCHAR(20)
);

insert into color_details(color_name) values('RED');
insert into color_details(color_name) values('BLUE');
insert into color_details(color_name) values('GREEN');

delete from color_details where color_name= 'GREENA';

select * from color_details;



