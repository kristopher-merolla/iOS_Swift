//
//  ViewController.swift
//  NSEW
//
//  Created by Kristopher Merolla on 7/10/17.
//  Copyright © 2017 Kristopher Merolla. All rights reserved.
//

import UIKit

class ViewController: UIViewController, DirectionButtonDelegate {
    
    @IBOutlet weak var direction: UILabel!
    
    @IBAction func backButtonPressed(_ sender: UIBarButtonItem) {
        print("BACK button pressed")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func northButtonPressed(_ sender: UIButton) {
        print("North Button Pressed")
    }
    
    @IBAction func eastButtonPressed(_ sender: UIButton) {
        print("East Button Pressed")
    }

    @IBAction func southButtonPressed(_ sender: UIButton) {
        print("South Button Pressed")
    }
    
    @IBAction func westButtonPressed(_ sender: UIButton) {
        print("West Button Pressed")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    // define functions to conform to protocol
    func backButtonPressed(by controller: UIViewController) {
        print("hello back")
    }
    
    func northButtonPressed(by controller: UIViewController) {
        print("hello north")
    }
    
    func eastButtonPressed(by controller: UIViewController) {
        print("hello east")
    }
    
    func southButtonPressed(by controller: UIViewController) {
        print("hello south")
    }
    
    func westButtonPressed(by controller: UIViewController) {
        print("hello west")
    }


}

