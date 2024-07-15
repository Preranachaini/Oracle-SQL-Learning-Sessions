--Session 03 on SELECT Statement

select * from employees;
-- here the *brepresents all the columns of the table.

-- if you want to see only selective columns then the symtax would be,
select employee_id, first_name,last_name from employees;

-- columns alias name
select employee_id as associate_id, first_name,last_name from employees;

select employee_id associate_id, first_name,last_name from employees; -- OR it can be writtern as; 

-- concate the last name and first name, using concate function
select employee_id associate_id, first_name,last_name, concat(concat(first_name,' '),last_name)full_name from employees; -- why are we using 2 concats at the same time? it is because if we do noyt use it we will get without space between first & last name, therefore, when we use it we get a space in bvetween.
select employee_id associate_id, first_name,last_name, first_name||' '||last_name full_name from employees; -- it can also be writtern as this way using apipe symbol.

-- Column Calculations

-- 1. Calculating Annual Salary
select employee_id associate_id, first_name,last_name, salary,salary+1000 new_salary from employees; -- adding 1000 as new_salary 
select employee_id associate_id, first_name,last_name, salary,salary*12 annual_salary from employees; -- taking out annual salary by multiplying 12 to it.

-- Calculating all the distinct departments
select * from employees;

select department_id from employees;
select count(distinct department_id) from employees; -- it will exclude all the NULL values

-- WHERE clause, it restricts the select statement.
select * from employees where salary > 10000;
select * from employees where salary < 5000;

-- using AND and BETWEEN clauses for analysis'
select * from employees where salary < 5000 and salary >1000;
select * from employees where salary not between 3000 and 8000;

select * from employees where department_id = 60;
select * from employees where department_id in (60,50,10); -- IN command is used only when there are more than 1 keywords and the same will be done for STRINGS !!
select * from employees where department_id not in (30,40);

-- Using LOGICAL fucntions
select * from employees where department_id = 60 and salary > 5000; -- both the statements will be clesred
select * from employees where department_id = 60 or salary > 5000; -- either one of the statemnet will be cleared 
select * from employees where department_id = 60 or (salary > 5000 and department_id = 30);

-- RowID is UNIQUE for every record even if we delete one row from the database.
select rownum, rowid from employees;

select * from employees where rownum<10; -- ROWNUM nwill not work for symbols > and = independently.

select * from employees where commission_pct > 0.25;
select count(*) from employees where commission_pct > 0.25;

select distinct * from employees where commission_pct>0.25;

-- wil give you all the distinct commission percemtages;
SELECT DISTINCT commission_pct 
FROM employees;


select employee_id, first_name, last_name, hire_date, to_char(hire_date,'yyyy'),to_char(hire_date,'Month'),to_char(hire_date,'Day'),to_char(hire_date,'dd') from employees;

select * from employees where to_char(hire_date,'yyyy') = 2003;   -- Since the year is not having separate column to it thereofre we are reqiuerd to use to_char and YYYY to get the information.
--Session 03 on SELECT Statement

select * from employees;
-- here the *brepresents all the columns of the table.

-- if you want to see only selective columns then the symtax would be,
select employee_id, first_name,last_name from employees;

-- columns alias name
select employee_id as associate_id, first_name,last_name from employees;

select employee_id associate_id, first_name,last_name from employees; -- OR it can be writtern as; 

-- concate the last name and first name, using concate function
select employee_id associate_id, first_name,last_name, concat(concat(first_name,' '),laste_name)full_name from employees;
--Session 03 on SELECT Statement

select * from employees;
-- here the *brepresents all the columns of the table.

-- if you want to see only selective columns then the symtax would be,
select employee_id, first_name,last_name from employees;

-- columns alias name
select employee_id as associate_id, first_name,last_name from employees;
-- OR it can be writtern as; 
select employee_id associate_id, first_name,last_name from employees;


-- In order to get a specific date from the DB we have to use to_char in case when the column material is separable and to_date in case of dates;
SELECT * 
FROM employees 
WHERE hire_date between TO_DATE('01-04-01') and to_date('31-03-05');

select * from employees where to_char(hire_date,'FMDay')='Monday'; -- to get for a specific Day
select * from employees where to_char(hire_date,'FMMonth')='April'; -- to get for a specific Month

select * from employees where to_char(hire_date,'mm')='02';
select * from employees where to_char(hire_date,'mmyyyy')='062003';

-- Selecting employees whose name starts from A, or/and ends with a, or has an in inbetween. The same can be done for the numbers e.g salary
select * from employees where first_name like'A%';
select * from employees where last_name like'%s';
select * from employees where first_name like'%an%';
select * from employees where first_name like'A%s';
select * from employees where first_name like'A%' and commission_pct is not null;

-- ORDER BY, reframes the value in form that has been asked.

select * from employees order by first_name desc; -- in case there are small charates (lower cae) then it eill come first as it has lower value than upper characters.
select * from employees order by salary desc;
select * from employees order by hire_date asc, salary;
select * from employees order by 6 asc, 8; -- we can also use column no.s to direct the SQL use the data from thedesired column number.

