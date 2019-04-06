fun main() 
{
    var cityLocations = listCities()
    println("********Step Two*********")
	cityLocations.forEach({println(it)})
    
    println("********Step Three*********")
    println("The distance between Tacoma and Seatle is: " + 
            distanceFromSeattle(cityLocations[4]) + " kilometers") //Tacoma to Seatle distance
    
    println("********Step Four*********")
    var dists :List<Double> = cityLocations.map {stuff->distanceFromSeattle(stuff)}
    println("A new List with the distances of all cities in list to Seatle: ")
    println(dists)
    
    println("********Step Five*********")
    println("List of cities over 1000KM from Seattle:")
    var is_far :List<City> = cityLocations.filter({distanceFromSeattle(it) > 1000})
    is_far.forEach({println(it.name)}) // prints the name of cities farther than 1000
    
    println("********Step Six*********")
    var west_of_miss :List<String> = cityLocations.filter({it.longitude < -89.97803}).map({it.name})
    println("Cities west of the Mississippi are: " + west_of_miss)
    
	println("********Step Seven*********")
    var farthest :City? = cityLocations.maxBy({distanceFromSeattle(it)})
    println("Max Distance: " + farthest)
    
    println("********Step Eight*********")
    
    var mappedCities :Map<String, City> = 
        cityLocations.associate({cit->Pair(cit.name, cit)})
	for ((a, b) in mappedCities)
    {
        println("Name " + a + ": City " + b)
    }
    if (mappedCities.containsKey("Bozeman"))
    {
        println("The latitude for Bozeman is " + mappedCities.get("Bozeman")?.latitude)    
    }
}

data class City(var name: String, var latitude: Double, var longitude : Double)
{
    //override fun toString() :String
    //{
    //	return ("City(name=" + name + ", latitude="+latitude + ", longitude="+longitude + ")")
    //}
}

fun listCities() : MutableList<City>
{
    var my_list : MutableList<City> = mutableListOf()
    my_list.add(City("Atlanta", 33.7490, -84.3880))
    my_list.add(City("Bozeman", 45.6770, -111.0429))
    my_list.add(City("New York", 40.7128, -74.0060))
    my_list.add(City("San Francisco", 37.7749, -122.4194))
    my_list.add(City("Tacoma", 47.2529, -122.4443))
    return my_list

}

fun distanceFromSeattle(cit :City) :Double
{
    return haversine(cit.latitude, cit.longitude, 47.6062, -122.3321)
}

fun haversine(lat1: Double, lon1: Double, lat2: Double, lon2: Double): Double 
{    
    val R = 6372.8 // in kilometers    
    val l1 = Math.toRadians(lat1)    
    val l2 = Math.toRadians(lat2)    
    val dl = Math.toRadians(lat2 - lat1)    
    val dr = Math.toRadians(lon2 - lon1)    
    return 2 * R * Math.asin(Math.sqrt(Math.pow(Math.sin(dl / 2), 2.0) +
           Math.pow(Math.sin(dr / 2), 2.0) * Math.cos(l1) * Math.cos(l2)))
}
