
use states;

db.city.drop();

db.createCollection("city");

db.city.insert({

		city 	: "pune",
		type	: "urban",
		state	: "mh",
		population : 5600000

});

db.city.insert({

		city 	: "surat",
		type	: "urban",
		state	: "gj",
		population : 7000000

});

db.city.insert({

		city 	: "pune",
		type	: "urban",
		state	: "mh",
		population : 500000

});

db.city.insert({

		city 	: "bangalore",
		type	: "urban",
		state	: "tn",
		population : 7600000

});

db.city.insert({

		city 	: "ab",
		type	: "rural",
		state	: "tn",
		population : 10000

});



/*QUERIES*/

/*-using mapreduce, find statewise population*/

var map = function() {

	emit(this.state,this.population);
	
}

var reduce = function(key , value) {
	
	return Array.sum(value);

}

db.city.mapReduce(map,reduce,'state_pop');
db.state_pop.find();

/*-using mapreduce, find citywise population*/

var map1 = function() {

	emit(this.city,this.population);

}

var reduce1 = function(key,values)	{
	
	return Array.sum(values);
	
}

db.city.mapReduce(map1,reduce1,'pop_city').find();

/*-using mapreduce, find typewise population.*/

var map2 = function()	{
	
	emit(this.type,this.population);

}

var reduce2 = function(key,values) {
	
	return Array.sum(values);
	
}

db.city.mapReduce(map2,reduce2,'pop').find();
