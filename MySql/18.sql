
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS project;

create table employee (

	Eid int PRIMARY KEY,
	name varchar(20),
	address varchar(20),
	salary int,
	commision int
	
);

create table project (

	PrNo int PRIMARY KEY,
	addr varchar(20)

);

insert into employee values(1,"Amit","Pune",35000,5000);
insert into employee (Eid,name,address,salary) values(2,"Sneha","Pune",55000);
insert into employee values(3,"Savita","Nasik",28000,2000);
insert into employee (Eid,name,address,salary) values(4,"Pooja","Mumbai",19000);
insert into employee values(5,"Sagar","Mumbai",25000,3000);

insert into project values(10,"Mumbai");
insert into project values(20,"Pune");
insert into project values(30,"Jalgaon");


select * from employee;
select * from project;

/*Queries*/

/*1. Find different locations from where employees belong to?*/

select distinct(address) from employee;

/*2. What is maximum and minimum salary?*/

select min(salary),max(salary) from employee; 

/*3. Display the content of employee table according to the ascending order of salary amount.*/

select * from employee 
order by salary asc;

/*4. Find the name of employee who lived in Nasik or Pune city.*/

select name from employee 
where address in ("Nasik","Pune"); 

/*5. Find the name of employees who does not get commission.*/

select name from employee
where commision is NULL;

/*6. Change the city of Amit to Nashik.*/

update employee 
set address = "Nasik" 
where name = "Amit"; 

/*7. Find the information of employees whose name starts with „A‟.*/

select * from employee
where name like "A%";

/*8. Find the count of staff from Mumbai.*/

select count(*) as No_Of_Employee,address from employee 
where address = "Mumbai";

/*9. Find the count of staff from each city*/

select address,count(*) as staff from employee
group by address;

/*10. Find the address from where employees are belonging as well as where projects are going on.*/

select distinct(address) from employee 
inner join project 
on employee.address = project.addr;

/*11. Find city wise minimum salary.*/

select address from employee 
where salary = (select min(salary) from employee);

/*12. Find city wise maximum salary having maximum salary greater than 26000*/

select address,max(salary) from employee
group by address;

/*13. Delete the employee who is having salary greater than 30,000.*/

select * from employee;

delete from employee where salary > 30000;

select * from employee;







