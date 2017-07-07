//
//  ViewController.swift
//  tickTackToe
//
//  Created by Kristopher Merolla on 7/6/17.
//  Copyright © 2017 Kristopher Merolla. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var clicks = 0
    // blue = X, red = O
    let colors = ["blue","red"]
    
    // board[0] = top row
    // board[1] = mid row
    // board[2] = bot row
    var board = [["","",""],["","",""],["","",""]]
    var winner = ""
    
    @IBOutlet weak var winnerLabel: UILabel!
    // top row
    @IBOutlet weak var topMiddleButton: UIButton!
    @IBOutlet weak var topLeftButton: UIButton!
    @IBOutlet weak var topRightButton: UIButton!
    // middle row
    @IBOutlet weak var midLeftButton: UIButton!
    @IBOutlet weak var midMiddleButton: UIButton!
    @IBOutlet weak var midRightButton: UIButton!
    // bottom row
    @IBOutlet weak var botLeftButton: UIButton!
    @IBOutlet weak var botMiddleButton: UIButton!
    @IBOutlet weak var botRightButton: UIButton!
    
    // top row clicks
    @IBAction func topLeft(_ sender: UIButton) {
        // only update the square and click counter if it hasn't already been clicked
        if board[0][0] == "" {
            // check which player clicked (blue first, then red)
            if clicks % 2 == 0 {
                topLeftButton.backgroundColor = UIColor.blue
            } else {
                topLeftButton.backgroundColor = UIColor.red
            }
            // update board array
            if clicks % 2 == 0 {
                board[0][0] = "X"
                // check if you have won!
                winCheck(row:0, col:0, val:"X")
            } else {
                board[0][0] = "O"
                // check if you have won!
                winCheck(row:0, col:0, val:"O")
            }
            // increment the click counter
            clicks += 1
        }
    }
    @IBAction func topMiddle(_ sender: UIButton) {
        // only update the square and click counter if it hasn't already been clicked
        if board[0][1] == "" {
            // check which player clicked (blue first, then red)
            if clicks % 2 == 0 {
                topMiddleButton.backgroundColor = UIColor.blue
            } else {
                topMiddleButton.backgroundColor = UIColor.red
            }
            // update board array
            if clicks % 2 == 0 {
                board[0][1] = "X"
            } else {
                board[0][1] = "O"
            }
            // increment the click counter
            clicks += 1
        }
    }
    @IBAction func topRight(_ sender: UIButton) {
        if board[0][2] == "" {
            // check which player clicked (blue first, then red)
            if clicks % 2 == 0 {
                topRightButton.backgroundColor = UIColor.blue
            } else {
                topRightButton.backgroundColor = UIColor.red
            }
            // update board array
            if clicks % 2 == 0 {
                board[0][2] = "X"
            } else {
                board[0][2] = "O"
            }
            // increment the click counter
            clicks += 1
        }
    }
    // mid row clicks
    @IBAction func midLeft(_ sender: UIButton) {
        if board[1][0] == "" {
            // check which player clicked (blue first, then red)
            if clicks % 2 == 0 {
                midLeftButton.backgroundColor = UIColor.blue
            } else {
                midLeftButton.backgroundColor = UIColor.red
            }
            // update board array
            if clicks % 2 == 0 {
                board[1][0] = "X"
            } else {
                board[1][0] = "O"
            }
            // increment the click counter
            clicks += 1
        }
    }
    @IBAction func midMiddle(_ sender: UIButton) {
        if board[1][1] == "" {
            // check which player clicked (blue first, then red)
            if clicks % 2 == 0 {
                midMiddleButton.backgroundColor = UIColor.blue
            } else {
                midMiddleButton.backgroundColor = UIColor.red
            }
            // update board array
            if clicks % 2 == 0 {
                board[1][1] = "X"
            } else {
                board[1][1] = "O"
            }
            // increment the click counter
            clicks += 1
        }
    }
    @IBAction func midRight(_ sender: UIButton) {
        if board[1][2] == "" {
            // check which player clicked (blue first, then red)
            if clicks % 2 == 0 {
                midRightButton.backgroundColor = UIColor.blue
            } else {
                midRightButton.backgroundColor = UIColor.red
            }
            // update board array
            if clicks % 2 == 0 {
                board[1][2] = "X"
            } else {
                board[1][2] = "O"
            }
            // increment the click counter
            clicks += 1
        }
    }
    // bottom row clicks
    @IBAction func botLeft(_ sender: UIButton) {
        if board[2][0] == "" {
            // check which player clicked (blue first, then red)
            if clicks % 2 == 0 {
                botLeftButton.backgroundColor = UIColor.blue
            } else {
                botLeftButton.backgroundColor = UIColor.red
            }
            // update board array
            if clicks % 2 == 0 {
                board[2][0] = "X"
            } else {
                board[2][0] = "O"
            }
            // increment the click counter
            clicks += 1
        }
    }
    @IBAction func botMiddle(_ sender: UIButton) {
        if board[2][1] == "" {
            // check which player clicked (blue first, then red)
            if clicks % 2 == 0 {
                botMiddleButton.backgroundColor = UIColor.blue
            } else {
                botMiddleButton.backgroundColor = UIColor.red
            }
            // update board array
            if clicks % 2 == 0 {
                board[2][1] = "X"
            } else {
                board[2][1] = "O"
            }
            // increment the click counter
            clicks += 1
        }
    }
    @IBAction func botRight(_ sender: UIButton) {
        if board[2][2] == "" {
            // check which player clicked (blue first, then red)
            if clicks % 2 == 0 {
                botRightButton.backgroundColor = UIColor.blue
            } else {
                botRightButton.backgroundColor = UIColor.red
            }
            // update board array
            if clicks % 2 == 0 {
                board[2][2] = "X"
            } else {
                board[2][2] = "O"
            }
            // increment the click counter
            clicks += 1
        }
    }
    
    // check for a win
    func winCheck(row:Int, col:Int, val:String) {
        if (row==0 && col==0) {
            if (board[0][1]==val && board[0][2]==val) || (board[1][0]==val && board[2][0]==val) || (board[1][1]==val && board[2][2]==val) {
                    print("win")
                    winner = val
            }
        }
        if (row==0 && col==1) {
            if (board[0][0]==val && board[0][2]==val) || (board[1][1]==val && board[2][1]==val) {
                    print("win")
                    winner = val
            }
        }
        if (row==0 && col==2) {
            if (board[0][0]==val && board[0][1]==val) || (board[1][2]==val && board[2][2]==val) || (board[1][1]==val && board[2][0]==val) {
                    print("win")
                    winner = val
            }
        }
        if (row==1 && col==0) {
            if (board[1][1]==val && board[1][2]==val) || (board[0][0]==val && board[2][0]==val) {
                    print("win")
                    winner = val
            }
        }
        if (row==1 && col==1) {
            if (board[1][0]==val && board[1][2]==val) || (board[0][2]==val && board[2][0]==val) || (board[0][1]==val && board[2][1]==val) || (board[0][0]==val && board[2][2]==val) {
                    print("win")
                    winner = val
            }
        }
        if (row==1 && col==2) {
            if (board[1][0]==val && board[1][1]==val) || (board[0][2]==val && board[2][2]==val) {
                    print("win")
                    winner = val
            }
        }
        if (row==2 && col==0) {
            if (board[2][1]==val && board[2][2]==val) || (board[0][0]==val && board[1][0]==val) || (board[0][2]==val && board[1][1]==val) {
                    print("win")
                    winner = val
            }
        }
        if (row==2 && col==1) {
            if (board[2][0]==val && board[2][2]==val) || (board[0][1]==val && board[1][1]==val) {
                    print("win")
                    winner = val
            }
        }
        if (row==2 && col==2) {
            if (board[2][0]==val && board[2][1]==val) || (board[0][2]==val && board[1][2]==val) || (board[0][0]==val && board[1][0]==val) {
                    print("win")
                    winner = val
            }
        }
        // check if winner exists
        if winner == "X" {
            print("Blue wins")
            winnerLabel.text = "The winner is " + "Blue!"
            winnerLabel.isHidden = false
        }
        if winner == "O" {
            print("Red Wins")
            winnerLabel.text = "The winner is " + "Blue!"
            winnerLabel.isHidden = false
        }
    }
    
    // reset button click
    @IBAction func reset(_ sender: UIButton) {
        initTTT()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initTTT()
    }
    
    // initialize (OR RESET) the board
    func initTTT() {
        winnerLabel.isHidden = true
        clicks = 0
        winner = ""
        board = [["","",""],["","",""],["","",""]]
        topRightButton.backgroundColor = UIColor.lightGray
        topMiddleButton.backgroundColor = UIColor.lightGray
        topLeftButton.backgroundColor = UIColor.lightGray
        midLeftButton.backgroundColor = UIColor.lightGray
        midMiddleButton.backgroundColor = UIColor.lightGray
        midRightButton.backgroundColor = UIColor.lightGray
        botLeftButton.backgroundColor = UIColor.lightGray
        botMiddleButton.backgroundColor = UIColor.lightGray
        botRightButton.backgroundColor = UIColor.lightGray
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

