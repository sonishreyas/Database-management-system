use department;

db.teachers.drop();

db.createCollection("teachers");

db.teachers.insert({

		name		: 'a',
		department	: 'comp',
		experience	: 10,
		salary		: 50000

});

db.teachers.insert({

		name		: 'b',
		department	: 'mech',
		experience	: 12,
		salary		: 75000

});

db.teachers.insert({

		name		: 'c',
		department	: 'comp',
		experience	: 8,
		salary		: 62000

});

db.teachers.insert({

		name		: 'd',
		department	: 'mech',
		experience	: 20,
		salary		: 150000

});

db.teachers.insert({

		name		: 'e',
		department	: 'entc',
		experience	: 7,
		salary		: 45000

});

db.teachers.insert({

		name		: 'f',
		department	: 'entc',
		experience	: 5,
		salary		: 59000

});

db.teachers.find().forEach(printjson);

/*Queries*/

/*3. Display the department wise average salary.*/

printjson({"Query 3":"3. Display the department wise average salary."});

db.teachers.aggregate( [ { $group : { _id : "$department" , salary_avg : { $avg : "$salary"}}}]);

/*4. Display the no. Of employees working in each department.*/

printjson({"Query 4":"4. Display the no. Of employees working in each department."});

db.teachers.aggregate ( [ { $group : { _id : "$department" , No_of_Employee : {$sum : 1}}}]);

/*5. Display the department wise minimum salary.*/

printjson({"Query 5":"5. Display the department wise minimum salary."});

db.teachers.aggregate([{ $group : { _id : "$department" , MIN_Salary : {$min : "$salary"}}}]);

/*6. Apply index and drop index*/

printjson({"Query 6":"6. Apply index and drop index"});

db.teachers.ensureIndex({'name' : 1});

db.teachers.

db.teachers.dropIndex({'name':1});




