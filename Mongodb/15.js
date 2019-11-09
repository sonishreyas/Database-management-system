use institute;

db.students.drop();

db.createCollection("students");

db.students.insert ({

		rollno 	: 1,
		name	: 'a',
		age		: 20,
		branch	: 'comp',
		Address : [{
					city 	: 'surat',
					state	: 'gujarat'	
				}],
		hobbies	: 'z'

});

db.students.insert ({

		rollno 	: 2,
		name	: 'b',
		age		: 21,
		branch	: 'comp',
		Address : [{
					city 	: 'surat',
					state	: 'gujarat'	
				}],
		hobbies	: 'x'

});

db.students.insert ({

		rollno 	: 3,
		name	: 'c',
		age		: 19,
		branch	: 'mech',
		Address : [{
					city 	: 'pune',
					state	: 'maharashtra'	
				}],
		hobbies	: 'y'

});

db.students.insert ({

		rollno 	: 4,
		name	: 'd',
		age		: 18,
		branch	: 'civil',
		Address : [{
					city 	: 'surat',
					state	: 'maharashtra'	
				}],
		hobbies	: 'z'

});

db.students.insert ({

		rollno 	: 5,
		name	: 'e',
		age		: 22,
		branch	: 'entc',
		Address : [{
					city 	: 'ahmedabad',
					state	: 'gujarat'	
				}],
		hobbies	: 'zyz'

});

db.students.find().forEach(printjson);

/*QUERIES*/

/*5. Display Student information whose age is greater than 20.*/

printjson({"Query5":" 5. Display Student information whose age is greater than 20."});

db.students.find({ age : { $gt : 20 }}).forEach(printjson);

/*6. Display Student information sorted on name field*/

printjson({"Query 6":" 6. Display Student information sorted on name field"});

db.students.find().sort({name : -1}).forEach(printjson);

/*7. Update student branch Computer of RollNo 3.*/

printjson({"Query 7":"7. Update student branch Computer of RollNo 3."})

db.students.update({rollno : 3}, {$set : {branch : 'comp' }} );

db.students.find({rollno : 3}).forEach(printjson);

/*8. Remove document with RollNo 1*/

printjson({"Query 8":"8. Remove document with RollNo 1"})

db.students.remove({rollno : 1});

db.students.find().forEach(printjson);

/*9. Display Student information whose name starts with A*/

printjson({"Query 9":"9. Display Student information whose name starts with A"});

db.students.find({ name : { $regex : '^c'}}).forEach(printjson);

/* 10. Display the total numbers of documents available in collection.*/

printjson({"Query 10":"10. Display the total numbers of documents available in collection."});

a = db.students.count();

printjson({"Number" : a });

/*11. Display only first 2 documents.*/

printjson({"Query 11":"11. Display only first 2 documents."});

db.students.find().limit(2).forEach(printjson);

/*12. Display all documents instead of first 3.*/

printjson({"Query 12":"12. Display all documents instead of first 3.."});

db.students.find().skip(3).forEach(printjson);

/*13. Display the name of Students who live in Pune City.*/

printjson({"Query 13":"13. Display the name of Students who live in Pune City."});

db.students.find({ 'Address.city' : 'pune'}).forEach(printjson);

/*14. Display the list of different cities from where students are coming.*/

printjson({"Query 14":"14. Display the list of different cities from where students are coming."});

db.runCommand( { distinct : "students" , key : "Address.city"});

/*15. Display the list of different cities with number of students from belonging to that city.*/

printjson({"Query 15":"15. Display the list of different cities with number of students from belonging to that city."});

db.students.aggregate([{$group : {_id : "$Address.city" , num_of_students : {$sum : 1}}}]);

/*16. Display only Name of all students. */

printjson({"Query 16":"16. Display only Name of all students."});

db.students.find({},{name : 1 , _id : 0}).forEach(printjson);

/*17. Display the hobbies of each student.*/

printjson({"Query 17":"17. Display the hobbies of each student."});

db.students.find({},{name : 1 , hobbies : 1, _id : 0}).forEach(printjson);

/*18. drop collection */ 

printjson({"Query 18":" Drop collection"});

db.students.drop();


