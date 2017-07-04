// Assignment: Heads or Tails
//
//In this exercise, we are going to focus on writing clean and organized code using functions! When using functions it is important to be descriptive and to organize your code to have a separation of concerns. Let's see this in action:
//
// 1) Create a function tossCoin() -> String
        //Have this function print "Tossing a Coin!"
        //Next have the function randomly pick either "Heads" or "Tails"
        //Have the function print the result
        //Finally, have the function return the result
// 2) Now create another function tossMultipleCoins(Int) -> Double
    //Have this function call the tossCoin function multiple times based on the Integer input
    //Have the function return a Double that reflects the ratio of head toss to total toss

import UIKit


// 1


func tossCoin() -> String {
    let outcome = ["heads","tails"]
    print ("Tossing a Coin!")
    let random = Int(arc4random_uniform(UInt32(2))) // random integer from 0 to 1
    print (outcome[random])
    return outcome[random]
}

//tossCoin()


// 2

func tossMultipleCoins(num: Int) -> Double {
    var heads: Double = 0
    
    for _ in 1...num {
        if (tossCoin() == "heads") {
            heads += 1
        }
    }
    print (heads/Double(num)) // ratio of how many heads tosses to total tosses
    return heads/Double(num)
}


tossMultipleCoins(num: 4)








