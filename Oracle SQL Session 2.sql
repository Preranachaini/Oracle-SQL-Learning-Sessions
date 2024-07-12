select * from employees;

drop table customer;

create table customer(
cust_id number(8) not null,
cust_name varchar2(25),
mobile_no number (10) not null,
DOB date,
city varchar2(20),
email_id varchar2(30)
);

select * from customer

desc customer; -- will shown the type of the table in column

insert into customer
(cust_id,cust_name,mobile_no,DOB,city,email_id)
values(07202401,'Arun Chintal',9963550752,to_date('11/05/2002','mm/dd/yyyy'),'Hyderabad','arunchintal@gmail.com');

insert into customer
(cust_id,cust_name,mobile_no,DOB,city,email_id)
values(100000,'Arun', 9090909090,to_date('08/04/2000','mm/dd/yyyy'),
'Chennai','arun@gmail.com');

insert into customer
(cust_id,cust_name,mobile_no,DOB,city,email_id)
values(07202403,'Prerana Chaini',9955883390,to_date('03/05/1998','dd/mm/yyyy'),'Maharastra','preranachaini@gmail.com');
select * from customer;

-- Updating the data just like how we update in a cell in an Excel sheet. 
UPDATE customer
Set cust_id = 07202404;
where cust_name = 'Prerana Chaini' and cust_id = 07202402;

UPDATE customer
Set cust_id = 07202402;
where city = 'Chennai';

DELETE FROM customer
WHERE cust_name = 'Prerana Chaini';

UPDATE customer
SET cust_id = 07202401
WHERE cust_id = 7202404;

UPDATE customer
SET cust_name = 'Suraj Singh'
WHERE city = 'Chennai';

UPDATE customer
SET cust_id = 07202402
WHERE cust_name = 'Suraj Singh';

select * from customer;

insert into customer
(cust_id,cust_name,mobile_no,DOB,city,email_id)
values(07202403,'Priyanka Chopra',8866554477,to_date('03/03/2001','dd/mm/yyyy'),'Maharastra','priyankachopra@gmail.com');
select * from customer;

insert into customer
(cust_id,cust_name,mobile_no,DOB,city,email_id)
values(07202404,'Rups Sharma',5566332211,to_date('06/12/2003','dd/mm/yyyy'),'Delhi','rups2003@gmail.com');
select * from customer;

insert into customer
(cust_id,cust_name,mobile_no,DOB,city,email_id)
values(07202405,'Anchal Sharma',9392646353,to_date('10/07/2000','dd/mm/yyyy'),'Odhisa','anchalsharma@gmail.com');
select * from customer;

insert into customer
(cust_id,cust_name,mobile_no,DOB,city,email_id)
values(07202406,'Deepika Padukone',7780678439,to_date('15/01/1999','dd/mm/yyyy'),'Gujarat','deepika@gmail.com');
select * from customer;

-- saving the file with the data using commit command.
commit;

-- Rollback is used as an UNDO button on any word doc or paint applicaiton in windows.
rollback;


-- Inserting the data into the table one by one
insert into customer
(cust_id,cust_name,mobile_no,DOB,city,email_id)
values(07202406,'Deepika Padukone',7780678439,to_date('15/01/1999','dd/mm/yyyy'),'Gujarat','deepika@gmail.com');
select * from customer;

insert into customer
(cust_id,cust_name,mobile_no,DOB,city,email_id)
values(07202403,'Priyanka Chopra',8866554477,to_date('03/03/2001','dd/mm/yyyy'),'Maharastra','priyankachopra@gmail.com');
select * from customer;

insert into customer
(cust_id,cust_name,mobile_no,DOB,city,email_id)
values(07202404,'Rups Sharma',5566332211,to_date('06/12/2003','dd/mm/yyyy'),'Delhi','rups2003@gmail.com');
select * from customer;

insert into customer
(cust_id,cust_name,mobile_no,DOB,city,email_id)
values(07202405,'Anchal Sharma',9392646353,to_date('10/07/2000','dd/mm/yyyy'),'Odhisa','anchalsharma@gmail.com');
select * from customer;

insert into customer
(cust_id,cust_name,mobile_no,DOB,city,email_id)
values(07202407,'Ranveer Singh',9966553322,to_date('25/08/1996','dd/mm/yyyy'),null,'ranveers@gmail.com');
select * from customer;

delete from customer 
where cust_id = 07202407;

insert into customer
(cust_id,cust_name,mobile_no,DOB,city,email_id)
values(07202407,'Ranveer Singh',9966553322,to_date('25/08/1996','dd/mm/yyyy'),null,'ranveers@gmail.com');

commit;

update customer
set city = 'Telangana' where cust_id = 07202407;

commit;

-- adding a column using Alter command.
alter table customer
add country varchar2(25);

-- updating the column to INDIA as a whole in one go!
update customer set country = 'India';

select * from customer;

DELETE FROM customer
WHERE cust_id IN (7202403, 7202404, 7202405, 7202407);

rollback;

commit;

-- Trying to update the repeated values using update command
UPDATE customer c2
SET cust_name = 'Pooja Padhy'
WHERE ROWID > (
    SELECT MIN(ROWID)
    FROM customer c1
    WHERE c1.cust_id = 7202406
);

update customer
set cust_id = 07202407
where city = 'Gujarat';

update customer
set cust_id = 07202406
where mobile_no = 7780678439;

update customer
set cust_id = 07202407
where cust_name = 'Pooja Padhy' 
and mobile_no = 7780678439;

-- We cannot try bulk action to update in oracle sql
update customer
set cust_id = (07202408,07202409,07202410,07202411)
where cust_name = ('Pooja Padhy','Pooja Padhy','Pooja Padhy','Pooja Padhy')
and mobile_no = (8866554477,5566332211,9392646353,9966553322);

-- Update statement for each row individually
UPDATE customer
SET cust_id = 07202408
WHERE cust_name = 'Pooja Padhy' AND mobile_no = 8866554477;

UPDATE customer
SET cust_id = 07202409
WHERE cust_name = 'Pooja Padhy' AND mobile_no = 5566332211;

UPDATE customer
SET cust_id = 07202410
WHERE cust_name = 'Pooja Padhy' AND mobile_no = 9392646353;

UPDATE customer
SET cust_id = 07202411
WHERE cust_name = 'Pooja Padhy' AND mobile_no = 9966553322;

select * from customer;

UPDATE customer
SET cust_name = 'Sachin Varma'
WHERE cust_id = 07202408;


--updated the names of the repeated rows
UPDATE customer
SET cust_name = 'Sachin Varma'
WHERE cust_id = 07202408;

UPDATE customer
SET cust_name = 'Archie'
WHERE cust_id = 07202409;

UPDATE customer
SET cust_name = 'Varun'
WHERE cust_id = 07202410;

UPDATE customer
SET cust_name = 'Shruti'
WHERE cust_id = 07202411;

update customer
set country = 'India';

-- updating the numbers of the repeated rows
UPDATE customer
SET mobile_no = 5522336650
WHERE cust_id = 07202408;

UPDATE customer
SET mobile_no = 9988776655
WHERE cust_id = 07202409;

UPDATE customer
SET mobile_no = 8877445500
WHERE cust_id = 07202410;

UPDATE customer
SET mobile_no = 9900553322
WHERE cust_id = 07202411;


commit;
select * from customer;
-- To modify the table data type use alter customer modify column_name type(updated value)--


-- SESSION 02 
-- After loggining in im seeing that the Arun chintal's Cust_id is on 02, so now lets first set it to the original one and then lets start working oon today's task!

update customer
set cust_id = 07202401
where cust_name = 'Arun Chintal';

commit;

-- How to create a BACKUP TABLE. 
-- 1. Creat a backup table
-- 2. Restore the data
-- 3. Modify the data type
-- 4. Truncate the old table database,
-- 5. Drop the backup table


CREATE TABLE customer_bckup AS SELECT * FROM customer;
select * from customer_bckup; -- now we have created a backup table and restored the data from the old table customer.

alter table customer_bckup
modify cust_id number(10);

desc customer_bckup; -- now we havce sucessfully changed the data type or vakue of the customer ID. Now we can either truncate the old DB or keep it as it is. I will be deleting this DB as this is made just for example purpose. and lastly drop the DB.

select * from customer;
drop table customer_bckup;

-- Now we will see RENAME Command
-- We have to change the MOBILE_NO to Mob_No'
select * from customer;

alter table customer
rename column MOBILE_NO to Mob_No;


-- if you want to rename the table name then,

rename customer to cust_table;

-- Lets work on the COnstraints PK, FK, NOT NULL, UNIQUE, CHECK.

Create table customer_test(
Cust_id number(10) primary key,
cust_name varchar2(20) not null,
Mob_no number(10) unique check (length(Mob_no)=10),
age number(2) check(age>=18),
city_id number(3) references city(city_id));

create table city(
city_id number(3) not null,
city_name varchar2(30));

insert into city values (10,'Odhisa');
insert into city values (20,'Telangana');
insert into city values (30,'Delhi');
insert into city values (40,'Mumbai');
insert into city values (50,'West Bengal');

commit;

select * from city;


-- you can see that i have not assigned any PK in the City table therefore now we have to assign a PK in the city table only then we cn create a Customer_test table.

alter table city add primary key(city_id);

-- now the table customer_test is created. Inserting values into the table

select * from customer_test;

insert into customer_test values (202401,'Prerana',8899665544,25,10);
insert into customer_test values (202402,'Priyanka',9988554411,50,30);
insert into customer_test values (202403,'Kavita',5588774400,30,20);
insert into customer_test values (202404,'Sandeep',5588220033,60,40);

-- Incase you want to see the constraints
select * from all_constraints where owner = 'CORE' and table_name = 'CUSTOMER_TEST';

desc customer_test;

commit;

-- Delete Casecade means where deleting the foreign key table would delete the rows in the original table. for example if you delete the city code 20 using dlete casecade, all the records would be deleted in the customer_test having city code as 20.
select * from customer_test;

alter table customer_test
drop constraint SYS_C007096;

alter table customer_test
add constraint city_fk
foreign key (city_id)
references city(city_id)
on delete cascade;

delete from city where city_id = 40;
-- Now you will see that the record of city id 40 has been deleted from the FK and the cutomer_test table too.





