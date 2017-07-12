//
//  ViewController.swift
//  MadLibs
//
//  Created by Kristopher Merolla on 7/12/17.
//  Copyright © 2017 Kristopher Merolla. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var madLibSpace: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        madLibSpace.text = "..."
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

