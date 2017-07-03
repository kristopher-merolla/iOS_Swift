// Swift Fundamentals Assignment 1
// Fix the below code

var type: String = "Rectangle"
var description: String = "A quadrilateral with four right angles"

var width: Int = 5
var height: Double = 10.5
var area = width * height

height++
width++

area = width * height
// Note how you can "interpolate" variables into Strings using the following syntax
print("The shape is a \(type) or \(description) with an area of \(area)")
