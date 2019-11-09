use film;

db.movies.drop();

db.createCollection("movies");

db.movies.insert({

		name : 'Avenger',
		type : 'Action',
		budget : 10000000,
		producer :[{
					 name : 'abc',
					 address : 'pune'
				}]	
		});
		
db.movies.insert({

		name : 'El Camino',
		type : 'Drama',
		budget : 200000000,
		producer :[{
					 name : 'Vince',
					 address : 'mumbai'
				}]	
							 
		});
		
db.movies.insert({

		name : 'ABCD',
		type : 'horror',
		budget : 100000,
		producer : [{
					 name : 'xyz',
					 address : 'kerela'
				}]
							 
		}		
);

db.movies.find().forEach(printjson);

printjson({"query": "Queries"});
/* QUERIES */

/*1. Find the name of the movie having budget greater than 2,00,000.*/

printjson({"Query 1": "1. Find the name of the movie having budget greater than 2,00,000."});

db.movies.find({"budget" : {$gt : 200000}}).forEach(printjson);

/*2. Find the name of producer who lives in Pune*/

printjson({"Query 2" : "2. Find the name of producer who lives in Pune"});

db.movies.find( { 'producer.address' : 'pune'} ).forEach(printjson);

/*3. Update the type of movie “action” to “horror”*/

printjson({"Query 3":" 3. Update the type of movie “action” to “horror"});

db.movies.update({'type':'Action'},{$set:{'type':'horror'}});

db.movies.find().forEach(printjson);

/*4. Find all the documents produced by name “producer1” with their address*/

printjson({"Query 4":" 4. Find all the documents produced by name “producer1” with their address"});

db.movies.find({'producer.name' : 'abc'}).forEach(printjson);


