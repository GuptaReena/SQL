-- subquery in where condition 
-- -------------------------------

USE classicmodels;
-- Subquery is when we are dealing with the unknown value we use subquery
-- Subquery is a combination of select query 
-- IN this is first execute the subquery and then the outerquery will work with the computation result of the subquery

-- display the employeeNumber, employeeName of employee working in the office in USA

SELECT * FROM offices; 
SELECT * FROM employees;

SELECT 
    e.officeCode,
    e.employeeNumber,
    CONCAT(firstName, ' ', lastName) AS employeeName,
    o.addressLine1,
    o.country
FROM
    employees e
        JOIN
    offices o ON o.officeCode = e.officeCode
WHERE
    country = 'USA'; 
    
    
    
    -- display the employeeNumber, employeeName of employee working in the office in USA using subquery

SELECT officeCode FROM offices WHERE country = 'USA';

SELECT 
    employeeNumber,
    CONCAT(firstName, ' ', lastName) AS employeeName
FROM
    employees
WHERE
    officeCode IN (SELECT 
            officeCode
        FROM
            offices
        WHERE
            country = 'USA'); 


-- display customerNumber customerName from customers who have never placed order

SELECT * FROM orders;
SELECT * FROM customers;
SELECT DISTINCT customerNumber FROM orders;

SELECT customerNumber , customerName FROM customers WHERE customerNumber NOT IN (SELECT DISTINCT customerNumber FROM orders);

-- display office which dont have any employee
SELECT * FROM employees;
SELECT* FROM offices;

SELECT DISTINCT officeCode  FROM offices;
SELECT DISTINCT officeCode FROM employees;
SELECT officeCode , city , state FROM offices WHERE officeCode NOT IN (SELECT officeCode FROM employees);

-- display info of products which have never ordered

SELECT * FROM products;
SELECT * FROM orderdetails;

SELECT productCode , productName FROM products;
SELECT DISTINCT  productCode FROM orderDetails;

SELECT productCode , productName FROM products WHERE productCode NOT IN (SELECT DISTINCT  productCode FROM orderdetails);


-- display employee info of employee who have not attented any customer

SELECT * FROM customers;
SELECT * FROM employees ;

SELECT DISTINCT salesRepEmployeeNumber FROM customers;

SELECT employeeNumber , CONCAT(firstName,'',lastName) AS employeeName FROM employees WHERE employeeNumber NOT IN (SELECT DISTINCT salesRepEmployeeNumber FROM customers WHERE salesRepEmployeeNumber IS NOT NULL);

-- display customer info of customer who has made the highest amount in payments
SELECT MAX(amount) FROM payments;
SELECT customerNumber , customerName FROM customers WHERE customerNumber = 
							(SELECT customerNumber FROM payments WHERE amount = 
                            (SELECT MAX(amount) FROM payments));
                            

-- subquery in from condition 
-- -------------------------------
-- display the order with the minimum and maximum items

SELECT orderNumber, COUNT(productCode) AS items FROM orderdetails GROUP BY orderNumber;

SELECT MAX(items), MIN(items) FROM (SELECT orderNumber, COUNT(productCode) AS items FROM orderdetails GROUP BY orderNumber) AS countItems;


-- CORRELATED SUBQurey
-- -------------------------------
-- display productCode , productName, and buyprice of the product whoes buy price are less then the average buyprice
SELECT AVG(buyPrice) FROM products;
SELECT productCode, productName , buyPrice FROM products WHERE buyPrice < (SELECT AVG(buyPrice) FROM products);

-- display productCode , productName, and buyprice of the product whoes buy price are greater then the average buyprice of all product in each  productline  
SELECT productCode, productName , buyPrice FROM products p1 WHERE buyPrice > (SELECT AVG(buyPrice) FROM products p2 WHERE p2.productLine = p1.productLine);

SELECT AVG(buyPrice) FROM products p2 WHERE p2.productLine = p1.productLine; -- inner query/sub query  is not independent , hence error

SELECT * FROM products;
SELECT AVG(buyPrice) FROM products WHERE productLine = 'Motorcycles'; 

-- display officeCode state country of offices with the number of employees greater than the average employee on each office
/*
select Avg(employeeNumber) , officeCode from employees group by officeCode ;
select * from employees;
select * from offices;
select officeCode , state , country from offices where employeeNumber > (select Avg(employeeNumber) , officeCode from employees) group by officeCode;
*/

-- display customer info for customer whose creditLimit is more then the average credit limit of customer in the city

SELECT * FROM customers;

SELECT customerNumber,customerName , AVG(creditLimit) FROM customers;

SELECT customerNumber,customerName, creditLimit, city FROM customers c1 WHERE creditLimit > (SELECT AVG(creditLimit) FROM customers c2 WHERE c2.City = c1.city );

-- display orderNumber orderDate , customerNumber from orders which has price of a product less than 20

select * from orderdetails;

select orderNumber , orderDate , customerNumber from orders o where exists (select productCode from orderdetails od where od.orderNumber =  o.orderNumber and priceEach < 50);
select orderNumber , orderDate , customerNumber from orders o where exists (select 5 from orderdetails od where od.orderNumber =  o.orderNumber and priceEach < 50);

-- We use five just for a word for selecting the query
select 2 , productCode from orderdetails where priceEach < 40;
