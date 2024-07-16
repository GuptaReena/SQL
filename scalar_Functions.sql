-- Two types of functions Scalar functions and Aggregate Function

-- Scalar fucnctions work of individual input and produce an indivudual output
-- Aggregate dunctions work on group of input and produce a single output



-- example of scalar function

select * from products; 
select * from offices;
select * from orders;
select * from payments; 
select * from order_details;
select * from productlines;
select * from employees;
select * from customers;

-- To get the values in Upper case 
select productCode , productName , UCASE(productLine) from products;
-- To get the values in Lower case 
select productCode , productName , LCASE(productLine) from products;


-- example of String Functions

-- To concat the two string  we use concat()
select customerNumber , concat(contactFirstName,' ',contactLastName) as fullName from customers;

-- If we want the length of a particular columne value we use char_length()
select customerNumber , customerName , char_length(customerName) as Length from customers;

-- If we want to get character from the left and right we use string functions as left() and right() 
select productCode, left(productCode,3) as code,  right(productCode, 4) from products;

-- If we want to get character from middle we use substring
select productCode, productName , substr(productName ,6,4) as shortForm, trim(substr(productName ,6,4)) as trim from products;

-- Numeric Scalar functions

select productCode , productName , buyPrice, round(buyPrice,0),round(buyPrice,1),floor(buyPrice),ceil(buyPrice) from products;

-- This function return the e^x where x is the arugment and 'e' is the Euler's constant , the base of the natural number.
select round(exp(2));

-- Date scalar functions

select customerNumber, paymentDate, Day(paymentDate), DayName(paymentDate), Month(paymentDate), Year(paymentDate) from payments;

select customerNumber, paymentDate, dayname(paymentDate), dayofweek(paymentDate), dayofmonth(paymentDate), dayofyear(paymentDate) from payments;

select customerNumber, paymentDate, datediff(current_date(), paymentDate) from payments;

select * from orders; 
-- how quickly the order is shipped 
select orderNumber , orderDate, shippedDate, datediff(shippedDate, orderDate) from orders;

-- assuming that the return date is with in 20days from the order date , display the return date for each order

select orderNumber, orderDate, date_add(orderDate, interval(30) day) from orders;

select orderNumber , orderDate , date_format(orderDate, '%Y') from orders;
select orderNumber , orderDate , date_format(orderDate, '%D %b %Y' ) from orders;
select orderNumber , orderDate , date_format(orderDate, '%Y %M %d') from orders;

-- Advance Function

select orderNumber, orderDate, comments , ifnull(comments, 'N/A')as comments from orders;

-- If the order is shipped in 2 days, display shipped early
-- If the order is shipped in 3 to 4 days display shipped
-- if the order is shipped in 5 or more days display late

select orderNumber , orderDate, shippedDate, datediff(shippedDate, orderDate) ,
case 
	when datediff(shippedDate, orderDate) <=2 then 'Shipped early'
    when datediff(shippedDate, orderDate) >2 && datediff(shippedDate, orderDate) <=4 then 'Shipped'
    when datediff(shippedDate, orderDate) >4 then 'Shipped late'
end as 'shipped Status'
from orders;


-- Aggregate Functions

select * from products;
-- find the count of the product 
select productCode, productName, count(productCode) from products;

-- find the sums of amounts
select * from payments;
select sum(amount) from payments;

-- find how many offices are there

select * from offices; 

select count(officeCode) from offices;

-- find out how many avg payment 
select AVG(amount)  from payments;

-- find out how many avg payment were received in 2004
select AVG(amount)  from payments where Year(paymentDate) = 2004;

-- find out how many avg payment were received in each year
select AVG(amount), year(paymentDate) from payments group by  Year(paymentDate);

-- find out how many total payment were received in each year
select SUM(amount), year(paymentDate) from payments group by  Year(paymentDate);

-- find the number of customers in each city
select * from customers;
select count(customerNumber), city from customers group by  city; 

-- find the average buyprice of each productLine of the products
select AVG(buyPrice) , productLine from Products GROUP BY productLine;

-- find the average buyprice of cars productLine of products

select AVG(buyPrice) , productLine from Products where productLine Like '%Cars%' GROUP BY productLine;

-- find the number of customer in each city in the countries France, Sweden , Denmark

SELECT 
    COUNT(customerNumber), city, country
FROM
    customers
WHERE
    country IN ('France' , 'Sweden', 'Denmark')
GROUP BY city , country
order By country;


-- display count of employee in each JOB title
select * from employees; 

select jobTitle , count(employeeNumber) from employees GROUP BY jobTitle;

-- select number of orders of each year status wise

select * from orders;  

SELECT 
    YEAR(orderDate), status, COUNT(orderNumber)
FROM
    orders
GROUP BY status , YEAR(orderDate)
ORDER BY YEAR(orderDate) , status;

-- find the average buyprice of each productLine of the products
select AVG(buyPrice) , productLine from Products GROUP BY productLine having AVG(buyPrice) > 50;

-- find the average buyprice of cars productLine of products
select AVG(buyPrice) , productLine from Products where productLine Like '%Cars%' GROUP BY productLine; -- recommended
select AVG(buyPrice) , productLine from Products GROUP BY productLine having productLine Like '%Cars%'; -- not recommended 

-- find the number of customer in each city in the countries France, Sweden , Denmark whoes count is less than 2
select country , city, count(customerNumber) 
from customers 
where country IN ('France','Sweden','Denmark') 
GROUP BY city , country
having count(customerNumber) < 2
order by country , city ; 



 
