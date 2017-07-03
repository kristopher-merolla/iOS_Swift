// Swift Fundamentals II
// Please create a playground and finish these exercises before uploading.

import UIKit

//First, create a loop (either for or while) that prints all of the values from 1-255

var start: Int = 1
var end: Int = 255

for i in start...end {
    print(i)
}

//Next, create a program that prints all of the values from 1-100 that are divisible by 3 or 5 but not both

end = 100

for i in start...end {
    if i % 3 == 0 && i % 5 == 0 {
        continue
    }
    else if i % 3 == 0 {
        print (i)
    }
    else if i % 5 == 0 {
        print (i)
    }
}

//Now modify that program to print "Fizz" when the number is divisible by 3 and "Buzz" when the number is divisible by 5 as well as "FizzBuzz" when the number is divisible by both!.


for i in start...end {
    if i % 3 == 0 && i % 5 == 0 {
        print ("FizzBuzz")
    }
    else if i % 3 == 0 {
        print ("Fizz")
    }
    else if i % 5 == 0 {
        print ("Buzz")
    }
}






