//: Playground - noun: a place where people can play

import UIKit



//Write a program that adds the numbers 1-255 to an array
var myArr = [Int]()

for i in 0...255 {
    myArr.append(i)
}

// print (myArr)


//Swap two random values in the array
//Hint: you can use the arc4random_uniform(UInt32) function to get a random number from 0 to the number passed in. The arc4random_uniform function takes in one parameter that is of the UInt32 type and returns a random number that is of the UInt32 type. How can you deal with this using your knowledge of types?

var random1 = Int(arc4random_uniform(UInt32(myArr.count))) // creates a random number from 0 to the length of the array
var random2 = Int(arc4random_uniform(UInt32(myArr.count))) // creates a random number from 0 to the length of the array
 
swap(&myArr[random1], &myArr[random2])

// print (myArr)


//Now write the code that swaps random values 100 times (You've created a "Shuffle"!)

for i in 0...100 {
    var random1 = Int(arc4random_uniform(UInt32(myArr.count))) // creates a random number from 0 to the length of the array
    var random2 = Int(arc4random_uniform(UInt32(myArr.count))) // creates a random number from 0 to the length of the array
    if (random1 == random2) {
        if random1 == myArr.count {
            random1 -= 1
        }
        else {
            random1 += 1
        }
    }
    swap(&myArr[random1], &myArr[random2])
}

// print (myArr)

//Remove the value "42" from the array and Print "We found the answer to the Ultimate Question of Life, the Universe, and Everything at index __" and print the index of where "42" was before you removed it.

for i in 0..<myArr.count {
    if (myArr[i] == 42) {
        var popped = myArr.remove(at: i)
        print("We found the answer to the Ultimate Question of Life, the Universe, and Everything at index \(i)")
        break
    }
}






