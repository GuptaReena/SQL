CREATE DATABASE IF NOT EXISTS bmsdb;

USE bmsdb;
SHOW TABLES;
DROP TABLE IF EXISTS book_details ;


CREATE TABLE book_details (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    book_title VARCHAR(200) NOT NULL,
    book_author VARCHAR(100) NOT NULL,
    book_gener VARCHAR(100) NOT NULL,
    book_price INT NOT NULL,
    book_img_url VARCHAR(255) NOT NULL
);

INSERT INTO book_details(book_title,book_author,book_gener,book_price, book_img_url) 
VALUES("Harry Potter and the Deathly Hallows ", "J.K.Rowling","Fantasy",450,"");
INSERT INTO book_details(book_title,book_author,book_gener,book_price, book_img_url) 
VALUES("Harry Potter and the order of Phoenix ", "J.K.Rowling","Fantasy",300,"");
INSERT INTO book_details(book_title,book_author,book_gener,book_price, book_img_url) 
VALUES("Harry Potter and the Half Blood Prince ", "J.K.Rowling","Fantassy",250,"");
      
SELECT * FROM book_details;

select last_insert_id();

drop table book_details;

truncate table book_detaisl;

show DATABASES;

use demodb;
show tables;
select * from employee;
select * from department;
desc  employee;

-- fetch employee details with the department table

select  emp_id, emp_name, emp_contact, dept_name from employee inner join department on emp_dept = dept_id; 

select emp_id,emp_name,emp_contact from employee where emp_name  like 'Ree%';