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

-- To modify the table data type use alter customer modify column_name type(updated value)--


