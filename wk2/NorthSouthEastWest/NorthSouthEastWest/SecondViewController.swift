//
//  SecondViewController.swift
//  NorthSouthEastWest
//
//  Created by Kristopher Merolla on 7/12/17.
//  Copyright © 2017 Kristopher Merolla. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var outputLabel: UILabel!
    var output: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        outputLabel.text = output
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

}
