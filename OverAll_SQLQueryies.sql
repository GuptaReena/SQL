create database XYZ;

USE XYZ;

CREATE TABLE employee(
	id INT PRIMARY KEY,
    name VARCHAR(50),
    salary BIGINT,
    city varchar(50),
    city_id int
);

DROP TABLE employee;

INSERT INTO employee
(id, name, salary, city)
VALUES
(1,"adam",25000, "PUNE"),
(2,"bob",30000,"MUMBAI"),
(3,"casey",40000, "JAIPUR");

create table City(
	id INT primary Key,
    Name varchar(50),
    foreign key (id) references employee(city_id)
);

insert into city values(1, "Pune");
insert into city values(2, "Jaipur");
insert into city values(3,"Mumbai");


create database college;

use college;

create table student(
	rollno INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT NOT NULL,
    grade VARCHAR(50),
    city varchar(50)
);

INSERT INTO student 
(rollno,name,marks,grade,city)  
VALUES
(101,"ANIL",78,"C","PUNE"),
(102,"bhumika",93,"A","Mumbai"),
(103,"Chetan",85,"B","Mumbai"),
(104,"Dhruv",96,"A","Delhi"),
(105,"emanuel",12,"F","Delhi"),
(106,"farah",82,"B","Delhi");

/*All student from the student table*/
select * from student;

/*All the student Name and marks from the student table*/
select name,marks from student;

/*
BY using DISTINCT keyword we are getting 
all the unique city from the student table
*/
select distinct city from student;


/*
WHERE CLAUSE is use to add condition 
Query to get the student marks greater than 80
*/
select * from student WHERE marks > 80;

/*
ORDER BY CLAUSE i use to get the data either is ascendind or descinding order
Query to get the student marks greater in DESC order
*/

select * from student order by marks DESC;

/*
LIMIT CLAUSE is use to show only the limited data
Query to get the only 3 student maks in descending order  
*/

select * from student order by marks DESC LIMIT 3;

/*
Logical AND ,OR
Query to get the student where city = mumbia and marks is greater than 80

*/
select * from student WHERE city = "Mumbai" and marks > 80;

/*
Query to get the student where marks between 80 and 90 OR city =Mumbai
*/
select * from student WHERE marks BETWEEN 80 AND 90 OR city= "Mumbai";


/*
Between Operator are use to show the data between the range
Query to get the student where marks range (80-90 )
*/
select * from student WHERE marks BETWEEN 80 AND 90;

/*
NOT IN Operator is to get negate the condition
Query to get the student wont stay in Mumbai city
*/
select * from student WHERE city NOT IN ("Mumbai");

/*
IN Operator is to get a specific data is matches in the list
Query to get the student stays in Mumbai city
*/
select * from student WHERE city IN ("Mumbai");

/*
Aggregate Functions

*/
select SUM(marks) from student ;
select COUNT(City) from student;
select AVG(marks) from student ;
select MIN(marks) from student ;
select MAX(marks) from student ;

/*
GROUP BY CALUSE 
Query to group student whoes stays in mumbai and there names
*/

select city , name from student where city="mumbai" GROUP BY city, name;

select city , AVG(marks) from student group by city ORDER BY city;

select grade , count(name) from student group by grade ORDER BY grade ASC;

/*
HAVNG CLAUSE
It is use when we want to apply condition on column 
Query to get the MAX marks of a student in the city
*/

select city ,  count(rollno) from student group by city having MAX(marks) > 90;

/*
Query to get the marks greater than or equals to  93 contain in which city
*/

SELECT city  
FROM student
WHERE grade="A"
GROUP BY city
HAVING MAX(marks) >= 93
ORDER BY city DESC;

/*
UPDATE QUERY
Query to update grade "o" where there are grade "A" 
*/

update student 
set grade = "O"
where grade = "A";

/*
In sql the safe mode is bydefault on becase 
if we do any uneven changes it prevents from that 
This statement is used to off the safe mode 

SET SQL_SAFE_UPDATES = 0; 
*/

/*
Query to update the marks and grade of a Id = 105
*/
update student 
set marks = 82 ,grade = "B"
where rollno = 105;

UPDATE student 
SET 
    marks = 12
WHERE
    rollno = 105;
select * from student;

/*
Query to update each student marks by + 1 
*/
update student 
set marks =  marks+1;

/*
Query to see all the student table data
*/
select * from student;

-- Delete query

delete from student where marks < 30;

-- Alter query

-- ADD column
ALTER TABLE stud_table ADD COLUMN age INT NOT NULL DEFAULT 19;
select * from student;
desc student;

-- Modify column
ALTER TABLE student MODIFY COLUMN age VARCHAR(2);
select * from student;
desc student;

-- Rename column
ALTER TABLE student CHANGE COLUMN age stu_age INT;

-- Drop column
ALTER TABLE student DROP COLUMN stu_age;

-- Rename table

ALTER TABLE student RENAME TO stud_table;
select * from student; -- error  student table does not exist as we change the name of the table 
select * from stud_table; 
 

/* Practice question
	In student table :
		Change the name of column 'name ' to 'full_name'
        Delete all the student who scored marks less than 80
        Delte column age
*/

-- soln
-- Change the name of column 'name ' to 'full_name'
alter table stud_table change column name full_name varchar(20);
select * from stud_table;

-- Delete all the student who scored marks less than 80
delete from stud_table where marks < 80;
select * from stud_table;

-- Delte column age
alter table stud_table drop column age;
 
 
 -- Joins : when we have to fetch the data from two table we need join 
 
 create table student(id int , name varchar(20));
 insert into student values(101, 'Adam');
 insert into student values(102, 'Bob');
 insert into student values(103, 'Donal');
 insert into student values(104, 'Ceasy');
 
 select * from student;

 create table course(id int , course_name varchar(20));
 
 insert into course values(102,'English');
 insert into course values(103,'Science');
 insert into course values(104,'Hindi');
 
 select * from student;
 
 select * from course;

-- Inner Join : It contains intersection of both the table 
	-- It only display the matching values on both the table
 
 select * from student inner join course on student.id = course.id;
 
 -- Left join : It dislay all the left table values as well as the common values in the right table
 
 select * from student left join course on student.id = course.id;
 
 -- right join : It dislay all the right table values as well as the common values in the left table
 
 select * from student right join course on student.id =  course.id;
 
 -- Full outer join : In mysql It is acombination of both the left join and right join
	-- we use them with the help of (UNION keyword)
  SELECT 
    *
FROM
    student
        LEFT JOIN
    course ON student.id = course.id 
UNION SELECT 
    *
FROM
    student
        RIGHT JOIN
    course ON student.id = course.id;
    
    
    -- Inclusive Join and Exclusive Join 
    
    select * from student left join course on student.id = course.id where course.id is null; 
    
    select * from student s right join  course c on s.id = c.id where s.id is null;
    


