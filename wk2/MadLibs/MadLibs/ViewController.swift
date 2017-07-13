//
//  ViewController.swift
//  MadLibs
//
//  Created by Kristopher Merolla on 7/12/17.
//  Copyright © 2017 Kristopher Merolla. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // create the mad lib space
    @IBOutlet weak var madLibSpace: UILabel!
    
    // create words to insert into story
    var adjectiveForInsert: String?
    var verb1ForInsert: String?
    var verb2ForInsert: String?
    var nounForInsert: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        madLibSpace.text = "..."
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! SecondViewController
        destination.adjective = adjectiveForInsert
    }
    
    @IBAction func unwindToMadLib(segue: UIStoryboardSegue) {
        if let sourceViewController = segue.source as? SecondViewController {
            adjectiveForInsert = sourceViewController.adjective
            verb1ForInsert = sourceViewController.verb1
            verb2ForInsert = sourceViewController.verb2
            nounForInsert = sourceViewController.noun
            madLibSpace.text = adjectiveForInsert
        }
    }
    

}

