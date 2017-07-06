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
    
    @IBAction func callButton(_ sender: UIButton) {
        print("Cold Call button pressed!")
        let randomNumber = Int(arc4random_uniform(UInt32(nameArray.count)))
        nameSpace.text = nameArray[randomNumber]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

