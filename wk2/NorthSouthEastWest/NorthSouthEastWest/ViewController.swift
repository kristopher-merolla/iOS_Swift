//
//  ViewController.swift
//  NorthSouthEastWest
//
//  Created by Kristopher Merolla on 7/12/17.
//  Copyright © 2017 Kristopher Merolla. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var textToSend: String?

    @IBAction func northButtonPressed(_ sender: UIButton) {
        textToSend = "North"
    }
    
    @IBAction func eastButtonPressed(_ sender: UIButton) {
        textToSend = "East"
    }
    
    @IBAction func southButtonPressed(_ sender: UIButton) {
        textToSend = "South"
    }
    
    @IBAction func westButtonPressed(_ sender: UIButton) {
        textToSend = "West"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! SecondViewController
        destination.output = textToSend
    }

}

