
DROP TABLE IF EXISTS emp;

create table emp (

	E_no int PRIMARY KEY AUTO_INCREMENT,
	E_name varchar(20) NOT NULL, 
	Address varchar(20) DEFAULT 'Nashik',
	Joindate date
	
);

Alter table emp AUTO_INCREMENT = 100;

desc emp;

Alter table emp add Post varchar(20) after Joindate;

desc emp;

insert into emp(E_name,Address,Joindate,Post) values("a","abc",'2018/05/02',"Manager");
insert into emp(E_name,Address,Joindate,Post) values("b","xcv",'2000/01/01',"CEO");
insert into emp(E_name,Address,Joindate,Post) values("c","bnm",'2005/07/21',"Analyst");
insert into emp(E_name,Address,Joindate,Post) values("d","asd",'2016/06/02',"Developer");
insert into emp(E_name,Address,Joindate,Post) values("e","qwe",'2017/12/02',"Assistant Manager");

select * from emp;

Alter table emp add salary int after Post;

update emp set salary = 50000 where E_no = 100;
update emp set salary = 60000 where E_no = 101;
update emp set salary = 70000 where E_no = 102;
update emp set salary = 80000 where E_no = 103;
update emp set salary = 90000 where E_no = 104;

select * from emp;

create or replace view employee as select E_name, salary from emp;  

select * from employee;

create index E_index on emp (E_name);

select * from emp;
