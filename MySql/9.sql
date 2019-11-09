DROP TABLE IF EXISTS student;
DROP TABLE IF EXISTS course;
DROP TABLE IF EXISTS instructor;

create table instructor (

	T_id int PRIMARY KEY,
	name varchar(20),
	dept_name varchar(20),
	salary int 
);

create table course (

	course_id int PRIMARY KEY,
	name varchar(20),
	dept_name varchar(20),
	credits int,
	T_id int,
	FOREIGN KEY (T_id) REFERENCES instructor(T_id) ON DELETE CASCADE

);

create table student (
	
	S_id int PRIMARY KEY,
	name varchar(20),
	dept_name varchar(20),
	tot_cred int,
	course_id int, 
	FOREIGN KEY (course_id) REFERENCES course(course_id)
);

insert into instructor values( 101 , "xx","comp",50000);
insert into instructor values( 102 , "yy","mech",75000);
insert into instructor values( 103 , "zz","entc",40000);
insert into instructor values( 104 , "pp","entc",32000);
insert into instructor values( 105 , "qq","comp",60000);

insert into course values( 1001 , "DBMS","comp", 25,101);
insert into course values( 1002 , "hhh","comp", 23,105);
insert into course values( 1003 , "fff","entc", 25,104);
insert into course values( 1004 , "jjj","entc", 20,103);
insert into course values( 1005 , "kkk","mech", 25,102);

insert into student values( 1 , "a","comp",25,1001);
insert into student values( 2 , "b","comp",22,1001);
insert into student values( 3 , "c","mech",23,1005);
insert into student values( 4 , "d","mech",24,1004);
insert into student values( 5 , "e","entc",20,1002);




select * from student;
select * from instructor;
select * from course;

/*Queries*/

/*1. Find the average salary of instructor in those departments where the average salary is more than Rs. 42000/-.*/

select avg(salary),dept_name from instructor 
group by dept_name having avg(salary) > 42000;

/*2. Increase the salary of each instructor in the computer department by 10%.*/

update instructor 
set salary = salary + 0.1*salary 
where dept_name = "comp";  

/*3. Find the names of instructors whose names are neither "Amol‟ nor "Amit‟.*/

select * from instructor
where name NOT IN ("Amol","Amit");

/*4. Find the names of student which contains „am‟ as its substring.*/

select * from student 
where name LIKE "%am%";

/*5. Find the name of students from computer department that “DBMS” courses they take.*/

select S_id from student s, course c
where s.course_id = c.course_id AND c.name = "DBMS";












