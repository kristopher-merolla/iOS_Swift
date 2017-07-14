//
//  AllVC.swift
//  Codelaborate
//
//  Created by Kristopher Merolla on 7/13/17.
//  Copyright © 2017 xCoders. All rights reserved.
//

import UIKit
import CoreData

class AllVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var tableView: UITableView!
    
    
    // for storing projects in array
    var items = [ProjectItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        grabAllProjects()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func unwindToAllVC(segue: UIStoryboardSegue) {
        print("unwound to all vc")
    }
    
    func grabAllProjects() {
        let itemRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ProjectItem")
        // grab all items
        do {
            // get the results by executing the fetch request we made earlier
            let results = try managedObjectContext.fetch(itemRequest)
            // downcast the results as an array of AwesomeEntity objects
            items = results as! [ProjectItem]
            // print the details of each item
            for item in items {
                print("\(String(describing: item.headline))")
            }
        } catch {
            // print the error if it is caught (Swift automatically saves the error in "error")
            print("\(error)")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProjectCell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row].headline!
        cell.detailTextLabel?.text = items[indexPath.row].language!
        return cell
    }
    
    // need to override the prepare for segue function
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = sender as! UITableViewCell
        print(indexPath.textLabel?.text! ?? "Nope")

//        if segue.identifier == "ShowProject" { // segue can be nammed on the main.storyboard
            let navigationController = segue.destination as! UINavigationController
            let ShowVC = navigationController.topViewController as! ShowVC
//            // use sent index path to set item in table view controller
//            let indexPath = sender as! NSIndexPath
//            let item = items[indexPath.row]
//            print(item)
            ShowVC.showItem = indexPath.textLabel?.text!
//
//        }
    }
    
    

}
