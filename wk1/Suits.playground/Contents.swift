// Suits
// Given the following three variables write a for-in loop that will have the following output in the Assistant Editor.

import UIKit

let suits = ["Clubs", "Diamonds", "Hearts", "Spades"]
let cards = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
var deckOfCards = [String: [Int]]()


for i in 0..<suits.count {
    deckOfCards[suits[i]] = cards
}




print(deckOfCards)
