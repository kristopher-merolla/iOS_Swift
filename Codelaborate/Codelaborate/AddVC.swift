//
//  AddVC.swift
//  Codelaborate
//
//  Created by Kristopher Merolla on 7/13/17.
//  Copyright © 2017 xCoders. All rights reserved.
//

import UIKit

class AddVC: UIViewController {
    
    // setup variables
    @IBOutlet weak var headline: UITextField!
    @IBOutlet weak var language: UITextField!
    @IBOutlet weak var summary: UITextField!
    @IBOutlet weak var experience: UITextField!
    @IBOutlet weak var commitment: UITextField!
    @IBOutlet weak var codersNeeded: UITextField!
    var latitude: Double?
    var longitude: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToAddVC(segue: UIStoryboardSegue) {
        let controller = segue.source as! MapVC
        latitude = controller.annotation.coordinate.latitude
        longitude = controller.annotation.coordinate.longitude
    }
    
}
