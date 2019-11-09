
DROP TABLE IF EXISTS Account;

DROP TABLE IF EXISTS customer;


create table customer (	
	
	C_id int PRIMARY KEY,
	C_name varchar(20),
	City varchar(20)
					  	
);						
					 
create table Account (

	C_id int,
	Acc_Type varchar(20),
	Amount int,
	FOREIGN KEY (C_id) REFERENCES customer (C_id) ON DELETE CASCADE ON UPDATE CASCADE
						
);
						
/*insert into both the tables*/
insert into customer values (1,"John","Nashik");
insert into customer values (2,"Seema","Aurangabad");
insert into customer values (3,"Aamita","Nagar");
insert into customer values (4,"Rakesh","Pune");
insert into customer values (5,"Samata","Nashik");
insert into customer values (6,"Ankita","Surat");
insert into customer values (7,"Bhavika","Delhi");
insert into customer values (8,"Deepa","Surat");
insert into customer values (9,"Nitin","Nashik");
insert into customer values (10,"John","Nashik");
insert into customer values (11,"Tom","Surat");


insert into Account values (1, "Current","5000");
insert into Account values (2, "Saving","50000");
insert into Account values (3, "Saving","70000");
insert into Account values (4, "Saving","20000");
insert into Account values (5, "Current","35000");
insert into Account values (6, "Loan","400000");
insert into Account values (7, "Current","20000");
insert into Account values (8, "Current","56000");
insert into Account values (9, "Saving","90000");
insert into Account values (10, "Loan","50000");

/*Display both the tables*/
select * from customer;
select * from Account;

/*Queries*/

/* 1. Show the cname, Acc_Type, amount information of customer who is having an saving account.*/

select C_name,Acc_type,Amount 
from customer c, Account a 
where c.C_id = a.C_id AND Acc_type = "Saving";

/*2. Display the data using Natural, left and right join. */

/*NATURAL JOIN*/

select * from customer 
NATURAL JOIN Account;  

/*LEFT JOIN*/

select * from customer 
LEFT JOIN Account ON Account.C_id = customer.C_id;  

/*RIGHT JOIN*/

select * from customer 
RIGHT JOIN Account ON Account.C_id = customer.C_id;  

/*3. Display the information of customers living in the same city as of "pooja‟.*/

select * from customer
where City = (select City from customer where C_name = "Tom"); 
 
/*4. Display the information of account, having less amount than average amount throughout the bank. */

select * from Account
where Amount < (select AVG(Amount) from Account);

/*5. Display the C_id having maximum amount in account.*/

select C_id from Account
where Amount = (select MAX(Amount) from Account);

/*6. Display the amount and acc_type of those customers whose amount is the minimum amount of that Acc_type. */

select Acc_type, MIN(Amount) from Account
group by Acc_type; 

/*7. Display the amount of those accounts whose amount is higher than amount of any saving account amount.*/

select * from Account
where Amount > (select MIN(Amount) from Account where Acc_type = "Saving"); 


