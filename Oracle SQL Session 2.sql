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





