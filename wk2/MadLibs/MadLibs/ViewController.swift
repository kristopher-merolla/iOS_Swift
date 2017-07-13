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
    var madLibStory: String?
    // create story
    var madLib = ["Last week, I heard the most interesting story about my ",".  Apparently, "," has "," and "," while they were sleeping!  Amazing..."]
    
    var story = "Last week, I heard the most interesting story about my ADJ NOUN.  Apparently, NOUN has VERB1 and VERB2 while they were sleeping!  Amazing..."
    
    // create words to insert into story
    var adjectiveForInsert: String?
    var verb1ForInsert: String?
    var verb2ForInsert: String?
    var nounForInsert: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        madLibStory = "..."
        madLibSpace.text = madLibStory
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
            print(adjectiveForInsert ?? "missing adj")
            madLibStory = "Last week, I heard the most interesting story about my " + adjectiveForInsert + nounForInsert + ".  Apparently, " + nounForInsert + " has " + verb1ForInsert + " and " + verb2ForInsert + " while sleeping!  Amazing..."
        }
        madLibSpace.text = madLibStory
    }
    

}

