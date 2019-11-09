DROP TABLE IF EXISTS student;
DROP TABLE IF EXISTS teaches;
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
	credits int

);

create table student (
	
	S_id int PRIMARY KEY,
	name varchar(20),
	dept_name varchar(20),
	tot_cred int,
	course_id int, 
	FOREIGN KEY (course_id) REFERENCES course(course_id)

);

create table teaches (

	T_id int,
	course_id int,
	sec_id varchar(2),
	semester int,
	year int,
	FOREIGN KEY (T_id) REFERENCES instructor(T_id),
	FOREIGN KEY (course_id) REFERENCES course(course_id)
	
);

insert into instructor values( 101 , "xx","comp",50000);
insert into instructor values( 102 , "yy","mech",75000);
insert into instructor values( 103 , "zz","entc",40000);
insert into instructor values( 104 , "pp","entc",32000);
insert into instructor values( 105 , "qq","comp",60000);

insert into course values( 1001 , "DBMS","comp", 25);
insert into course values( 1002 , "hhh","comp", 23);
insert into course values( 1003 , "fff","entc", 25);
insert into course values( 1004 , "jjj","entc", 20);
insert into course values( 1005 , "kkk","mech", 25);

insert into student values( 1 , "a","comp",25,1001);
insert into student values( 2 , "b","comp",22,1001);
insert into student values( 3 , "c","mech",23,1005);
insert into student values( 4 , "d","mech",24,1004);
insert into student values( 5 , "e","entc",20,1002);

insert into teaches values( 101 , 1001,"A",5,2019);
insert into teaches values( 104 , 1004,"C",4,2018);
insert into teaches values( 103 , 1003,"B",5,2019);
insert into teaches values( 105 , 1005,"A",3,2017);
insert into teaches values( 102 , 1002,"C",1,2016);

select * from student;
select * from instructor;
select * from course;
select * from teaches;

/*Queries*/

/*1. Find the names of the instructor in the university who have taught the courses semester wise.*/

select name,semester from instructor i,teaches t
where i.T_id = t.T_id order by t.semester;


/*2. Create View on single table which retrieves student details.*/

create view studs as select S_id,name from student;
select * from studs;

/*3. Rename the column of table student from dept_name to deptatrment_name*/

Alter table student
Change Column dept_name department_name varchar(20); 

/*4. Delete student name whose department is NULL*/

Delete from student where department_name = "NULL";  

