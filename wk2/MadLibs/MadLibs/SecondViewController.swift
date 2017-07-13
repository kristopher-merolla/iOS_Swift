//
//  SecondViewController.swift
//  MadLibs
//
//  Created by Kristopher Merolla on 7/12/17.
//  Copyright © 2017 Kristopher Merolla. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    // declare text input variables
    @IBOutlet weak var adjectiveText: UITextField!
    @IBOutlet weak var verbText1: UITextField!
    @IBOutlet weak var verbText2: UITextField!
    @IBOutlet weak var nounText: UITextField!
    
    var adjective: String?
    var verb1: String?
    var verb2: String?
    var noun: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func submitButtonPressed(_ sender: UIButton) {
        print("submit button pressed")
        
        // grab (unwrap) our text fields
        if let adj = adjectiveText.text {
            adjective = adj
        }
        if let v1 = verbText1.text {
            verb1 = v1
        }
        if let v2 = verbText2.text {
            verb2 = v2
        }
        if let nn = nounText.text {
            noun = nn
        }
        
        self.performSegue(withIdentifier: "unwindToMadLib", sender: self)
    }
    
    

}
