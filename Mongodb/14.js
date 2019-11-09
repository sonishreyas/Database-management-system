use college;

db.Teachers.drop();
db.Department.drop();
db.Students.drop();

db.createCollection("Teachers");
db.createCollection("Department");
db.createCollection("Students");

db.Teachers.insert({
		
		Tname 			: 'a',
		dno 			: 1,
		Experience 		: 15,
		Salary 			: 30000,
		Date_of_joining : '12/12/19'
		
});

db.Teachers.insert({
		
		Tname 			: 'b',
		dno 			: 2,
		Experience 		: 1,
		Salary 			: 200000,
		Date_of_joining : '2/2/19'
		
});

db.Teachers.insert({
		
		Tname 			: 'c',
		dno 			: 3,
		Experience 		: 14,
		Salary 			: 300000,
		Date_of_joining : '3/3/19'
		
});

db.Teachers.insert({
		
		Tname 			: 'd',
		dno 			: 2,
		Experience 		: 18,
		Salary 			: 500000,
		Date_of_joining : '15/4/19'
		
});

db.Department.insert({

		Dno		:	1,
		Dname 	: 'COMP'

});

db.Department.insert({

		Dno		:	2,
		Dname 	: 'ENTC'

});

db.Department.insert({

		Dno		:	3,
		Dname 	: 'IT'

});

db.Students.insert({

		Sname : 's',
		rollno : 1,
		class : 'TE'
});

db.Students.insert({

		Sname : 't',
		rollno : 2,
		class : 'FE'
});

db.Students.insert({

		Sname : 'u',
		rollno : 3,
		class : 'SE'
});

db.Teachers.find().forEach(printjson);
db.Department.find().forEach(printjson);
db.Students.find().forEach(printjson);


/*QUERIES*/

/*2. Find the information about all teachers of Dno=2 and having salary greater than or equal to 10,000/-*/

printjson({"Query 2":" 2. Find the information about all teachers of Dno=2 and having salary greater than or equal to 10,000/-"});

db.Teachers.find({dno : 2, Salary : {$gte : 30000}}).forEach(printjson);

/*3. Find the student information having Roll_no=2 or Sname='xyz'*/

printjson({"Query 3":" 3. Find the student information having Roll_no=2 or Sname='xyz'"});

db.Students.find({rollno : 2 , Sname : 't'}).forEach(printjson);

/*4. Update student name whose Roll_No=5*/

printjson({"Query 4":" 4. Update student name whose Roll_No=5"});

db.Students.update({rollno : 3}, {$set:{Sname : 'shreyas'}});

db.Students.find().forEach(printjson);

/*5. Delete all student whose Class is 'FE'*/

printjson({"Query 5":"5. Delete all student whose Class is 'FE' "});

db.Students.remove({class : 'FE'});

db.Students.find().forEach(printjson);

/*6. Find information of Teachers whose Experience is more than 10 years*/

printjson({"Query 6":"6. Find information of Teachers whose Experience is more than 10 years "});

db.Teachers.find( { Experience : { $gt : 10 } } ).sort({Experience: 1}).forEach(printjson);

/*7. Apply index on Students Collection*/

printjson({"Query 7":" 7. Apply index on Students Collection"});

db.Students.ensureIndex({'Sname' : 1});
