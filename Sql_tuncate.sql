-- transaction 
-- Update query set balance = -10000 where account_number = 1001;
-- Update query set balance = +10000 where account_number = 1005;

-- These features must be there when doing any transaction, If these features are not there then 
	-- the transaction is not proper
-- ACID properties
/* A - Atomicity -- Transaction always be execute in a single unit, 
	The rule of the automicity is all the query should executed completely or either non of it execute,
    if the transaction fails in the middel then it rollback and back to its orginial state to maintain 
    the consistency of the data
    */
-- C - Consistency -- The data has to be consistent , consitency sholud be before the transaction and after the transaction
-- I - Isolation  --  Each an evey transaction should be work concurrently without intefering with each other 
				  -- If there are multiple transaction then it 
-- D - Durability -- Once the Commit is executed the data should be permenant refelects in the database 
				  -- Any system failure occur after the commit sholud not effect the data

-- Tcl queries are 
-- commit , rollback, savepoint

create database db_Banking;

use db_Banking;

create table account(
acc_id int primary key,
acc_typ  varchar(50),
balance int
);

Insert into account values(1001, "Saving", 30000);
Insert into account values(1002, "Saving", 25000);
Insert into account values(1003, "Current", 50000);
Insert into account values(1004, "Saving", 70000);

select * from account;

-- a sucessfull transaction
start transaction; -- transaction starts
update account 
set balance = balance - 10000 where acc_id=1001;

select * from account; -- Changes seen in the table are temperory

update account 
set balance = balance + 10000 where acc_id=1004;
commit; -- the transaction ends here

select * from account; -- the changes are seen in the table are permenant after we execute the commit query

-- example of failed transaction
start transaction; -- transaction starts
update account 
set balance = balance - 10000 where acc_id=1001; -- system failure , transraction failed
select * from account; -- Changes seen in the table are temperory
rollback;  -- the transaction ends here
select * from account; -- Changes seen in the table are permenant , here are the temporary changes are undone / revoke


start transaction;
-- query1
-- query2
savepoint sav_pt1;
-- query3
-- query4
-- query5
savepoint sav_pt2;
-- query6
-- query7
rollback to sav_pt1;

commit;

