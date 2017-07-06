//
//  ViewController.swift
//  coldCall
//
//  Created by Kristopher Merolla on 7/6/17.
//  Copyright © 2017 Kristopher Merolla. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let nameArray = ["James","Brittany","Jon","Cindy","Norman","Bret","Matt","Lauren"]
    
    
    
    @IBOutlet weak var nameSpace: UILabel!
    @IBOutlet weak var numberSpace: UILabel!
    
    @IBAction func callButton(_ sender: UIButton) {
        print("Cold Call button pressed!")
        let randomNumber = Int(arc4random_uniform(UInt32(nameArray.count)))
        nameSpace.text = nameArray[randomNumber]
        numberSpace.text = String(randomNumber+1)
        numberSpace.isHidden = false
        if (randomNumber+1 <= 2) {
            numberSpace.textColor = UIColor.red
        }
        else if (randomNumber+1 > 2 && randomNumber+1 <= 4) {
            numberSpace.textColor = UIColor.yellow
        }
        else if (randomNumber+1 > 4 && randomNumber+1 <= 6) {
            numberSpace.textColor = UIColor.blue
        } else {
            numberSpace.textColor = UIColor.green
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        numberSpace.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

