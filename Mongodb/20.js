/*👉️ Mongodb Indexes Use A B-Tree Data Structure. */


use school;

db.students.drop();

db.createCollection("students");

db.students.insert({

		Rollno	: 1,
		name	:'Navin',
		subject	:'DMSA',
		marks	: 78
		
});

db.students.insert({

		Rollno	: 2,
		name	:'anusha',
		subject	:'OSD',
		marks	:75
		
});

db.students.insert({

		Rollno	: 3,
		name	:'ravi',
		subject	:'TOC',
		marks	:69
});

db.students.insert({

		Rollno	:4,
		name	:'veena',
		subject	:'TOC',
		marks	:70
		
});

db.students.insert({

		Rollno	:5,
		name	:'Pravini',
		subject	:'OSD',
		marks	:80
		
});

db.students.insert({

		Rollno	:6,
		name	: 'Reena',
		subject	: 'DMSA',
		marks	:50
		
});

db.students.insert({

		Rollno	:7,
		name	:'Geeta',
		subject	:'CN',
		marks	:90
		
});

db.students.insert({

		Rollno	:8,
		name	:'Akash',
		subject	:'CN',
		marks	:85
		
});


/*Queries*/

/* INDEXING */

/*1. Create Single Index,*/

printjson({"Query 1":"1. Create Single Index,"});

db.students.ensureIndex({"name" : 1});

/*2. Create Compound Index,*/

printjson({"Query 2":"2. Create Compound Index"});

db.students.createIndex({"Rollno" : 1,"name" : -1 });

/*3. Create Unique on Collection*/

printjson({"Query 3":"3.Create Unique on Collection"});

db.students.createIndex({"Rollno":1},{unique : true});

/*4. Show Index Information*/

printjson({"Query 4":"4. Show Index Information"});

db.students.getIndexes();

/*5. Remove Index*/

printjson({"Query 5":"5. Remove Index"});

db.students.dropIndexes();

db.students.getIndexes();


/*Aggregation*/

/*1. Write aggregate function to find Max marks of Each Subject.*/

printjson({"Query 1":"1. Write aggregate function to find Max marks of Each Subject.});

db.students.aggregate([{$group : { _id : "$subject" , max_mark : { $max : "$marks"}}}]);

/*2. Write aggregate function to find Min marks of Each Subject.*/

printjson({"Query 2":"2. Write aggregate function to find min marks of Each Subject.});

db.students.aggregate([{ $group : {_id : "$subject" , min_marks :{$min : "$marks"}}}]);

/*3. Write aggregate function to find sum of the marks of Each Subject.*/

printjson({"Query 3":"3. Write aggregate function to find sum of the marks of Each Subject.});

db.students.aggregate([{ $group : { _id : "$subject" , total : {$sum : "$marks"}}}]);

/*4. Write aggregate function to find Avg marks of Each Subject.*/

printjson({"Query 4":"4. Write aggregate function to find Avg marks of Each Subject.});

db.students.aggregate([{ $group : {_id : "$subject" , avg_marks:{$avg : "$marks"}}}]);

/*5. Write aggregate function to find first record Each Subject..*/

printjson({"Query 5":"5. Write aggregate function to find first record Each Subject."});

db.students.aggregate([{ $sort : {Rollno : 1}},{ $group : {	_id:"$subject", firstdoc : { $first : "$name"} }}]);

/*6. Write aggregate function to find last record Each Subject..*/

printjson({"Query 6":"6. Write aggregate function to find last record Each Subject."});

db.students.aggregate([{$sort : { Rollno : 1}},{ $group : { _id: "$subject" , lastdoc: { $last : "$name"}}}]);

/*7. Write aggregate function to find count number of records of each subject*/

printjson({"Query 7":"7. Write aggregate function to find count number of records of each subject"});

db.students.aggregate([{ $group : { _id : "$subject" , countstud : { $sum : 1} }}]);

