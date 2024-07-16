"# SQL"

# SQL For Beginner 

->Database is collection of Data that can be easily Accessed.

->To manage data we use DBMS i.e. (Database Management System) It act as a layer to interact with the backend.



# 2 Types of Database 

->Relational Database  : The data are stored in a Table Format 

->It understand the Sql Language .

									eg of relational database are : MySQL, postgress, oracle.



->Non Relational Database : The data are stored in a normal format 

->It wont understand the sql language.

									eg of non relational database are  :  MongoDB



->Sql(Structured Query Language) : It is use to perform CRUD operation on the database : 

Create 
Read
Update
Delete


->Database is a collection of related tables : 

																 eg :- Company 

																						:- employee Table , Salary , Dept, etc.



->Table is a combination of Rows and Column : The rows show the individual data of the related column.

																		 The Column show what  type of data contains in a table. 



The Queries are not case Sensitive 

Query's : 

		->To Create Database : CREATE DATABASE db_name;

								  	 	eg : CREATE DATABSE  college;

								   		-> It is best practice to write IF NOT EXIST while creating a database to reduce error

								 			 eg :  CREATE DATABASE IF NOT EXIST db_name;

		-> To Drop Database : DROP DATABASE db_name;

									 eg : DROP DATABASE college;

											->It is best practice to write IF EXIST while creating a database to reduce error

											eg: DROP DATABASE IF EXIST db_name



		-> To USE a Database : Use db_name;

										eg : use college;



		->To SHOW Database  :  show db_name

										 eg :  show college;

														

		-> Create Table : create table Student (

									id INT PRIMARY KEY,

									name varchar(50),

									age INT NOT NULL

									)	





-> In this example we have written the column name, datatype and constraints if required.

eg: Create is used to design the schema(column a table can contain ) of a table

	  ID : Column Name (schema) , INT :Data type, Constraints : Primary Key ( It will always Not Null It defines the column  value should be unique)

	  name: Column Name , Varchar(50) : Datatype and its size

	  age  :  Column Name , INT : Data type Not Null (It defines that the column should not be null)  	



-> To see how many table exist in the database we use :  show tables;										

-> To drop the table table from the database we use  : drop table table_name; 

																			   eg : Drop table student;



Data Types in SQL

-> Most Popular type used in SQL are:

	Char and Varchar : Both are used to store String (0-256) : But the main Diff between Char and Varchar 
Char : If we assign Char (50) it mean it take overall physical memory of the Computer is reserved 
Varchar : If we assign Varchar(50) it mean it take only the memory required and it can be used by other data also
Blob :  This datatype is used to store large range of Integer value . Eg: BLOB(1000)	
INT : This datatype is used to store integer value and we can also store the (-2,245,672) negative to positive values
TINY-INT: It is used to store the value between (-128 to 127) 
BIGINT : It is used to store the Large +ve and -ve value (-9 to 876)
FLOAT : It is used to store the decimal value in the table 


Type of SQL Commands :

DDL (Data Definition Language) : It is mainly use when table is (create, rename ,truncate, drop)
DQL(Data Query Language) : It is used after creating a table and to see what all there in the table (select)
DML (Data Manipulation Language) : It is used to manipulate i.e. table related query the data in the table i.e. (insert, update, delete)
DCL (Data Control Language) : It is use to grant permission to the specific user (grant , revoke) i.e. fee table is accessible by account, Exam marks is accessible by Teacher etc.
TCL (Transaction Control Language) : (start transaction ,  Commit, rollback)
  

	-> DML (Data Manipulation Language) : It is used to manipulate. i.e. table related query the data in the table i.e. (insert, update, delete)

		-> This syntax is use to use multiple values in the table.

			--> INSERT INTO employee

				 (id, name, salary)

				 VALUES

				 (1,"adam",25000),

				 (2,"bob",30000),

				 (3,"casey",40000);

		

		-> This syntax is use to store single values in the table.

			-->INSERT INTO employee VALUES(1,"adam",25000),

		-> To see the data in the table we use :- select * from employee;



COMMON CONSTRAINTS USE IN SQL



PRIMARY KEY :

	Primary Key always contains Unique value as well the value of this column should not be NULL(NotNULL)

	Combination of 2 Column can also be primary key eg: id and name.

	eg: Id INT PRIMARY KEY,



FOREGIN KEY :

	Foreign key is a primary of other table contains in different table 

	There can be multiple Foreign Key and It also can be duplicate.

		eg 



DEFAULT :

	Default constraints are use to set the default value in the column 

		eg: salary int DEFAULT 24000;



UNIQUE :

	Unique constraints are used to assign unique value in a table 

		eg: Id INT UNIQUE 



CHECK :

	Check constraints are use to add condition in  schema 

		eg: age int check(age>=18); 

		eg: constraints age_check  CHECK (age >=18 , city = "DELHI") ---> This example is use to assign constraints on the table





SELECT QUERY

  There are various type of select query

For viewing over all table data : SELECT * FROM student;
For viewing specific column in the table : SELECT col1. col3 from table_name;
For viewing unique value from a column in a table : SELECT DISTINCT col4 from table_name;
we can use DISTINCT keyword to get the unique value exist in a column 


WHERE CLAUSE

Where clause is used with the select query to add conditional type of data 

	eg: select * from student WHERE city = "Mumbai" and marks > 80;



Operators used in SQL are : Arithmetic Operator  : = , +, /,-, %;

											 Logical Operator  : AND , OR, NOT;

																			eg: select * from student WHERE marks BETWEEN 80 AND 90 OR city= "Mumbai";

											 Comparison Operator : <,>,>=,<=,!;

											 Bitwise Operator  :  ----



BETWEEN Operator : It data select for a given range 

	eg: select * from student WHERE marks BETWEEN 80 AND 90;



IN Operator : Use when matches any value in a list 

	eg: select * from student WHERE city IN ("Mumbai");



NOT IN Operator : It consider those data which is against the condition i.e. It negate the given condition

	eg: select * from student WHERE city NOT IN ("Mumbai");



ORDERBY CLAUES

This clause is use when we want our data in order 

	eg : select * from student order by marks DESC;



LIMIT 

We can also add limit to showcase the data how much data we want to see 

	eg: select * from student order by marks DESC LIMIT 3;





AGGREGATE FUNCTIONS



Aggregate Functions : Aggregation function are used to perform calculation on a set of values and return a single value

		eg: SUM, AVG,COUNT,MIN,MAX



	select SUM(marks) from student ;
	select COUNT(City) from student;
	select AVG(marks) from student ;
	select MIN(marks) from student ;
	select MAX(marks) from student ;


GROUP BY CLAUSE

	Groups rows that have same values into summary rows

	It collect data from multiple records and groups the result by one or more column

		eg: select city , name from student where city="mumbai" GROUP BY city, name;



HAVING CLAUSE

	Having clause is used when we have to apply certain condition on the column 

	It is mainly used after GROUP BY CLAUSE  

		eg: select city , count(rollno) from student group by city HAVING MAX(marks) > 90;



GENERAL ORDER OF WIRITE ALL THESE CALUSES



	SELECT (COLUMN_NAME)

	FROM TABLE

	WHERE (CONDITION)  --->  It applies condition on rows

	GROUP BY (COLUMN_NAME)

	HAVING (CONDITION) --->   It applies condition on columns

	ORDER BY (COLUMN) ASC/DESC





		eg: 	SELECT city  

				FROM student

				WHERE grade="A"

				GROUP BY city

				HAVING MAX(marks) >= 93

				ORDER BY city DESC;



	UPDATE QUERY : Update query is use to update the values in the table.

				eg : 	update student 

						set grade = "O"

						where grade = "A" ;

	

-> In sql the safe mode is by default on because , If we do any uneven changes it prevents from that 

	 This statement is used to off the safe mode 



		SET SQL_SAFE_UPDATES = 0;



	DELETE QUERY : Delete query is used to delete query in the table

				eg : delete from student 

					 where id = '102'

				: we always use delete query with the where condition as if we use delete query as it is we can loose our entire data from table





	ALTER QUERY: Alter queries are used on tables like(ADD, DROP, Modify, change , rename)

				eg: -- ADD column

ALTER TABLE student ADD COLUMN age INT NOT NULL DEFAULT 19;

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

select * from student; -- error student table does not exist as we change the name of the table 

select * from stud_table; 



Normalization

: When we take data from various sources (Un Normalize form) we First Normalize them using different normalization approach 

To remove Redundancy, maintain Integrity of the data 

There are 3 Ways of doing this 

1NF : 1st Normal Form : A table will be in first normal form when the attribute are single value and every cell contain   		single value.

						--> Every cell should contain only one value.

								soln : we just have to repeat the value again an again 

							And Primary key should be determined



				2NF : The tables has to be in the 1NF

					  No partial dependency : - Functionally dependent : When the every column is dependent on the primary key then it is known as 	

											     Functionally dependent

												eg: stud_name : we can take out student name with the help of stud_id : This mean that stud_name 

											  		is functionally dependent on the stud_id.

											  - Partially Dependent : When a table have more than 2 primary key then it is known as composite key

												In this case partially dependent concept comes into place

														emp_id, proj_id -> emp_name: In this case we do not need proj_id to get the emp_name

																--> So we can say that emp_name is partially dependent on emp_id

						soln: Remove the column which have partial dependency and keep them in another table

	

				3NF : The table has to be in 2NF form 

					  No transitive dependency  : a->b->c

						eg : add1 -> add_id -> emp_id - > This mean there is an transitive dependency

						soln: Remove the column which have transitive dependency and keep them in another table

				

							 			

   





			


