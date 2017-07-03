// Swift Fundamentals Assignment 1
// Fix the below code
// Convert any unnecessary variables to constants to make the code more efficient

import UIKit

let type: String = "Rectangle"
let description: String = "A quadrilateral with four right angles"

var width: Double = 5
var height: Double = 10.5
var area: Double = width * height

height += 1
width += 1

area = width * height
// Note how you can "interpolate" variables into Strings using the following syntax
print("The shape is a \(type) or \(description) with an area of \(area)")
