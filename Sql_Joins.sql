-- SQL Joins

use demodb;
select * from employee;
select * from department;

-- display the employee id employee name dept_name of all the employee
-- It is an old style of writing join 
select emp_id , emp_name, dept_name from employee , department where emp_dept = dept_id;
-- New style of writing join is using (Join Keyword)
select emp_id, emp_name, dept_name from employee join department on emp_dept = dept_id;

-- A(2,4,6) B(1,5)
-- A X B = (2,1) (2,5) (4,1) (4,5) (6,1) (6,5)
-- if we wont use condition in join it perform cartition of both the table  
-- It always Join each record of left table to right table 
-- I want to join based on condition so we use (Where/on) 


use classicmodels;

select * from customers;
select * from employees;

-- Display customerNumber, customerName, employeeNumber, employeeFullName of all the customers
-- Old Style
SELECT 
    customerNumber,
    customerName,
    employeeNumber,
    CONCAT(firstname, ' ', lastname) AS employeeName
FROM
    customers,
    employees
WHERE
    salesRepEmployeeNumber = employeeNumber
        AND city = 'Melbourne'; 
        
        
-- New  style 

SELECT 
    customerNumber,
    customerName,
    employeeNumber,
    CONCAT(firstname, ' ', lastname) AS employeeName
FROM
    customers
        JOIN
    employees ON salesRepEmployeeNumber = employeeNumber
    where city = 'Melbourne'; 
 
 
 -- display order information for orders witht th payment date
 select * from orders;
 select * from payments;
 select *  from customers;
 
 
 -- dsiplay order details of all the orders  with the payment date
 select orders.orderNumber , orderDate, status , productCode, quantityOrdered  from orderdetails join  orders on orderdetails.orderNumber =  orders.orderNumber ; 
 
 -- display order Number orderdate and count of product on each order
  select orders.orderNumber , orderDate, status , count(productCode)  from orderdetails join  orders on orderdetails.orderNumber =  orders.orderNumber  group by orders.orderNumber; 
  
--  display numbers of payments done by each customers
select count(payments.customerNumber) ,checkNumber ,paymentDate  from payments group by customerNumber ;

SELECT 
    customers.customerNumber,
    customerName,
    COUNT(payments.customerNumber)
FROM
    customers
        JOIN
    payments ON customers.customerNumber = payments.customerNumber
GROUP BY customers.customerNumber;

-- alias name

SELECT 
    c.customerNumber,
    customerName,
    COUNT(p.customerNumber)
FROM
    customers c
        JOIN
    payments p
    ON c.customerNumber = p.customerNumber
GROUP BY c.customerNumber; 


-- display employee information of employees in each office

select * from offices; 
select * from employees;

SELECT 
    employeeNumber,
    CONCAT(firstName, ' ', lastName) AS employeeName,
    jobTitle,
    o.officeCode,
    city,
    addressLine1,
    state,
    country
FROM
    offices o
        JOIN
    employees e ON o.officeCode = e.officeCode; 
    

-- display Number employee of employees working in each office 

SELECT 
	o.officeCode,
    count(employeeNumber),
    addressLine1,
    city,
    state,
    country
FROM
    offices o
        JOIN
    employees e ON o.officeCode = e.officeCode
    group by city; 
    
    
-- display number of customer handel by each employee

SELECT 
    employeeNumber,
    CONCAT(firstName, ' ', lastName) AS employeeName,
    COUNT(customerNumber)
FROM
    employees e
        JOIN
    customers c ON e.employeeNumber = c.salesRepEmployeeNumber
GROUP BY employeeName;

-- display employee details who have not handel any customer 

SELECT 
    employeeNumber,
    CONCAT(firstName, ' ', lastName) AS employeeName,
    COUNT(customerNumber)
FROM
    employees e
         left JOIN
    customers c ON e.employeeNumber = c.salesRepEmployeeNumber
GROUP BY employeeName
having count(customerNumber) = 0;


-- types of join
-- A{1,2,3,4,5}
-- B{3,4,5,6,7,8}
-- inner Join
-- 			A intresection B {3,4,5}
-- left join
-- 			A-B {1,2,3,4,5}
-- right join
-- 			B-A {3,4,5,6,7,8}
-- self join
-- cross join

-- display customerinformatiion of customers along with order information
select * from orders;
select * from customers;

select c.customerNumber , c.customerName , o.orderNumber, o.status from customers c join orders o on c.customerNumber =  o.customerNumber;

select count(customerNumber) from customers;
select count(DISTINCT customerNumber) from orders;

-- display dept info and emp info
select e.emp_id ,e.emp_name, e.emp_contact , d.dept_name from department d inner join employee e on dept_id = emp_dept;

-- display dept info and emp info using left join
-- It also show the distinct value in the tables

select d.dept_id,d.dept_name,e.emp_id ,e.emp_name, e.emp_contact from department d left join employee e on dept_id = emp_dept;

-- display employee_id employee name manager(reports to) id and manager(reports to)name of all employees
use classicmodels; 
select * from employees;
SELECT 
    e1.employeeNumber,
    CONCAT(e1.firstName, ' ', e1.lastName) AS EmployeeFullName,
    e2.employeeNumber,
    CONCAT(e2.firstName, ' ', e2.lastName) AS ManagerFullName
FROM
    employees e1
         JOIN
    employees e2 ON e1.employeeNumber = e2.reportsTo;

-- example of cross join
use demodb; 
-- Using old style
select e.emp_id ,e.emp_name, e.emp_contact , d.dept_name from department d , employee e ;

-- Using new style
select e.emp_id ,e.emp_name, e.emp_contact , d.dept_name from department d cross join employee e ;

-- Full outer join is a combination of left join and right join

