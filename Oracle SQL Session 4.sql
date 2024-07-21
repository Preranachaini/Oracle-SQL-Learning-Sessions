-- There are 2 types of Joins 
-- 1. Not EQUI JOIN -- using >,<,=>,<= symbols
-- 2. EQUI JOIN -- using = symbol 

--  It can be done oin 2 methods 
-- 1. ANSI METHOD
-- 2. Inplicit method


-- IMPLICIT METHOD
select a.department_id, b.employee_id, b.first_name, b.last_name, b.hire_date from departments a, employees b -- this is INNER JOIN
where a.manager_id = b.manager_id
and b.department_id is null ;

select a.department_id, b.employee_id, b.first_name, b.last_name, b.hire_date from departments a, employees b -- this is LEFT JOIN
where a.manager_id (+) = b.manager_id
and b.department_id is null ;

select a.department_id, b.employee_id, b.first_name, b.last_name, b.hire_date from departments a, employees b -- this is RIGHT JOIN
where a.manager_id = b.manager_id (+)
and b.department_id is null ;

select a.department_id, b.employee_id, b.first_name, b.last_name, b.hire_date from departments a, employees b -- this is FULL JOIN
where a.manager_id (+) = b.manager_id
and b.department_id is null 
union
select a.department_id, b.employee_id, b.first_name, b.last_name, b.hire_date from departments a, employees b 
where a.manager_id = b.manager_id (+)
and b.department_id is null ;


-- ANSI Method
select  a.department_name, b.employee_id, b.first_name, b.last_name, b.hire_date from employees b -- this is FULL JOIN
full join departments a on b.manager_id = a.manager_id;

select  a.department_name, b.employee_id, b.first_name, b.last_name, b.hire_date from employees b -- this is LEFT JOIN
left join departments a on b.manager_id = a.manager_id;

select  a.department_name, b.employee_id, b.first_name, b.last_name, b.hire_date from employees b -- this is RIGHT JOIN
right join departments a on b.manager_id = a.manager_id;

select  a.department_name, b.employee_id, b.first_name, b.last_name, b.hire_date from employees b -- this is INNER JOIN
inner join departments a on b.manager_id = a.manager_id;

-- Further SELF join can alaso be done in the dataset used giving different alias to the columns


------------- AGGREGATES in SQL --------------------------
-- 1. Max
-- 2. Min
-- 3. Sum
-- 4. Avg
-- 5. Count

-- It never counts the NULL values
-- ALways calculates in COLUMN LEVEL

create table students (
student_rollno number(3),
Student_name VARCHAR2(30),
student_yearofstudy number(10),
Maths number(6),
Physics number(6),
Chemistry number(6),
Bio number(6));

INSERT INTO STUDENTS VALUES ('10', 'Prerana', '56', '90', '95', '97', '79');

-- A quick fact : to update a table within secounds!! create a table named "students" (as above) then hit refresh and open the table, go to DATA, >> add required no.of RROWS >> copy teh data froom EXCEL & Paste it in the the DATA TABLE!

select * from students; --  The table has updated within secounds!

update students set student_yearofstudy = 2 where student_name = 'Prerana';

-- This syntax will hellp us find the total no.of marks ROW wise, as said before the aggregate functions would work column wise SUM cannt be used!! Hnece this syntax.
select student_rollno,
Student_name ,
student_yearofstudy ,
Maths ,
Physics ,
Chemistry ,
Bio , (Maths+Physics+Chemistry+Bio)total_marks from students; --- total Marks column been added in the rightmost end.

-- as we can see a NULL value in the column in order to get rid of the null value and get the total marks the syntax will be
select student_rollno,
Student_name ,
student_yearofstudy ,
Maths ,
Physics ,
Chemistry ,
nvl(Bio,0) , (Maths+Physics+Chemistry+nvl(Bio,0))total_marks from students --The NVL function in SQL is used to replace null values in queries with a specified default or value


select student_rollno,
Student_name ,
student_yearofstudy ,
Maths ,
Physics ,
Chemistry ,
nvl(Bio,0) , (Maths+Physics+Chemistry+nvl(Bio,0))total_marks,  (Maths+Physics+Chemistry+nvl(Bio,0))/4 avg_marks from students; -- a function showing AVERAGE MARKS 

select max(Maths) from students;

select min(Maths) from students;

select avg(Maths) from students;

select count(Maths) from students;

select round(avg(Maths),2) from students;

select sum(Maths) from students;


-- What is a GROUP BY command? 
-- The GROUP BY function in SQL is used to group rows that have the same values in specified columns into summary rows. 
-- This is particularly useful when you want to perform aggregate operations, like counting the number of rows, calculating averages, or summing values, for each group of rows.
-- for example whenever we are required to find answers in city wise, gender wise, country wise etc GROUP WISE COMMAND SHOUL BEE USEDD!!!

select avg(maths) from students group by student_yearofstudy;
select avg(chemistry) from students group by student_yearofstudy;
select avg(physics) from students group by student_yearofstudy;

select * from employees;


-- example of using the GROUP BY function and JOIN funciton both together using both the methods as mentioned above 
-- 1. IMPLICIT METHOD
select a.department_name, round(avg(b.salary),3) from employees b, departments a
where b.department_id = a.department_id
group by a.department_name;

-- 2. ANSI METHOD
select a.department_name, round(avg(b.salary),3) from employees b
join departments a on b.department_id = a.department_id
group by a.department_name;

-- MAKE SURE TO USE THE SAME NAMES OF THE COLUMN WHEN EVER GROUP BY FUNCTION IS USED INITIALLY AFTER SELECT AND WHILE GROUPING IT just like how DEPARTMENT_NAME has been used.


-- Quick Q 
-- 1. WHat are the distinct departments and their department id's?
select distinct(department_id), department_name from departments;

-- 2. how many employees are getting more than 10k salary and ffrom which department along with the deprtamnt id?
select count(e.employee_id) count_of_ees, d.department_name, d.department_id, e.salary from employees e, departments d
where e.department_id = d.department_id
and e.salary > 10000
group by d.department_id, d.department_name, e.salary;

select count(e.employee_id) count_of_ees, d.department_name, d.department_id, e.salary from employees e
join departments d on e.department_id = d.department_id
where e.salary > 10000 group by d.department_id, d.department_name, e.salary
order by salary desc;

