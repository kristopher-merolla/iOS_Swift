//
//  ViewController.swift
//  Codelaborate
//
//  Created by Kristopher Merolla on 7/13/17.
//  Copyright © 2017 xCoders. All rights reserved.
//

import UIKit
import CoreData

class MainVC: UIViewController {
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveAndUnwidToMainVC(segue: UIStoryboardSegue) {
        print("unwound to main vc")
        var valid = true
        let controller = segue.source as! AddVC
        let project = NSEntityDescription.insertNewObject(forEntityName: "ProjectItem", into: managedObjectContext) as! ProjectItem
        if let commitment = Double(controller.commitment.text!) {
            project.commitment = commitment
        } else {
            valid = false
        }
        if let experience = Double(controller.experience.text!) {
            project.experience = experience
        } else {
            valid = false
        }
        if let headline = controller.headline?.text! {
            project.headline = headline
        } else {
            valid = false
        }
        if let language = controller.language?.text! {
            project.language = language
        } else {
            valid = false
        }
        if let latitude = controller.latitude {
            project.latitude = latitude
        } else {
            valid = false
        }
        if let longitude = controller.longitude {
            project.longitude = longitude
        } else {
            valid = false
        }
        if let people = Int16(controller.codersNeeded.text!) {
            project.people = people
        } else {
            valid = false
        }
        if let summary = controller.summary?.text! {
            project.summary = summary
        } else {
            valid = false
        }
        
        // after setting attributes, save the project
        if valid {
            if managedObjectContext.hasChanges {
                do {
                    try managedObjectContext.save()
                    print("Success")
                } catch {
                    print("\(error)")
                }
            }
        } else {
            print("not validate")
        }
        
    }

}

