//
//  ViewController.swift
//  ninjaGold
//
//  Created by Kristopher Merolla on 7/6/17.
//  Copyright © 2017 Kristopher Merolla. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var scoreValue: Int = 0

    // define variables
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var farmEarn: UILabel!
    @IBOutlet weak var caveEarn: UILabel!
    @IBOutlet weak var houseEarn: UILabel!
    @IBOutlet weak var casinoEarn: UILabel!
    
    // define button clicks
    @IBAction func farm(_ sender: UIButton) {
        // earn from 10-20 golds
        let randomNum = Int(arc4random_uniform(11)) + 10
        scoreValue += randomNum
        score.text = String(scoreValue)
        farmEarn.text = "You earned "+String(randomNum)
        farmEarn.isHidden = false
        caveEarn.isHidden = true
        houseEarn.isHidden = true
        casinoEarn.isHidden = true
    }
    @IBAction func cave(_ sender: UIButton) {
        // earn from 5 to 10 golds
        let randomNum = Int(arc4random_uniform(6)) + 5
        scoreValue += randomNum
        score.text = String(scoreValue)
        caveEarn.text = "You earned "+String(randomNum)
        farmEarn.isHidden = true
        caveEarn.isHidden = false
        houseEarn.isHidden = true
        casinoEarn.isHidden = true
    }
    @IBAction func house(_ sender: UIButton) {
        // earn from 2 to 5 golds
        let randomNum = Int(arc4random_uniform(4)) + 2
        scoreValue += randomNum
        score.text = String(scoreValue)
        houseEarn.text = "You earned "+String(randomNum)
        farmEarn.isHidden = true
        caveEarn.isHidden = true
        houseEarn.isHidden = false
        casinoEarn.isHidden = true
    }
    @IBAction func casino(_ sender: UIButton) {
        // earn / lose 0 to 50 golds
        let randomNum = Int(arc4random_uniform(101)) - 50
        scoreValue += randomNum
        score.text = String(scoreValue)
        if randomNum >= 0 {
            casinoEarn.text = "You earned "+String(randomNum)
        } else {
            casinoEarn.text = "You lost "+String(randomNum)
        }
        farmEarn.isHidden = true
        caveEarn.isHidden = true
        houseEarn.isHidden = true
        casinoEarn.isHidden = false
    }
    @IBAction func reset(_ sender: UIButton) {
        initialize()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initialize()
    }
    
    func initialize() {
        score.text = String(0)
        scoreValue = 0
        farmEarn.isHidden = true
        caveEarn.isHidden = true
        houseEarn.isHidden = true
        casinoEarn.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

