//
//  TableViewController.swift
//  iOS_Swift_Belt_Exam_Merolla
//
//  Created by Kristopher Merolla on 7/21/17.
//  Copyright © 2017 Kristopher Merolla. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController, AddOrEditVCDelegate {
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // setup section array (for section titles)
    var section = ["Incomplete","Complete"]
    // items array to populate section from core data
    var items = [[EventListItem],[CompletedItem]]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // set header titles
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.section[section]
    }
    // how many sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.section.count
    }
    // how many rows per section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items[section].count
    }
    // what to populate the table cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
        cell.textLabel?.text = self.items[indexPath.section][indexPath.row]
        return cell
    }
    
    
    // for unwind segue
    @IBAction func unwindToTable(segue:UIStoryboardSegue) {
        print("inside the unwindToTable function")
    }
    
    // func to add new event
    func itemSaved(by controller: AddOrEditVC, with text: Array<Any>, at indexPath: NSIndexPath?) {
        print("item saved")
        print(text)
        // reload the table
        tableView.reloadData()
        // remove top view controller
        dismiss(animated: true, completion: nil)
    }
    
    // for the edit functionality (better UI look!)
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        // use the sender (indexPath) to retrieve the item from the array
        performSegue(withIdentifier: "EditItemSegue", sender: indexPath)
    }
    
    // add swipte to delete
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        items.remove(at: indexPath.row)
        tableView.reloadData()
        
    }
    
    func fetchAllItems() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "EventListItem")
        do {
            let result = try managedObjectContext.fetch(request)
            items = result as! [EventListItem]
        } catch {
            print("\(error)")
        }
    }
    
    // need to override the prepare for segue function
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // check for segue type
//        if segue.identifier == "AddItemSegue" { // segue can be nammed on the main.storyboard
//            let navigationController = segue.destination as! UINavigationController
//            let addOrEditVC = navigationController.topViewController as! AddOrEditVC
//            addOrEditVC.delegate = self
//        } else if segue.identifier == "EditItemSegue" { // segue can be nammed on the main.storyboard
//            print("edit item segue hit")
//            let navigationController = segue.destination as! UINavigationController
//            let addItemTableViewController = navigationController.topViewController as! AddItemTableViewController
//            addItemTableViewController.delegate = self
//            // use sent index path to set item in table view controller
//            let indexPath = sender as! NSIndexPath
//            let item = items[indexPath.row]
//            addItemTableViewController.item = item
//            addItemTableViewController.indexPath = indexPath
//        }
        
        
    }




}












