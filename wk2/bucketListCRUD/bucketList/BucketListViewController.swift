//
//  ViewController.swift
//  bucketList
//
//  Created by Kristopher Merolla on 7/7/17.
//  Copyright © 2017 Kristopher Merolla. All rights reserved.
//

import UIKit

// need to add the AddItemTableViewControllerDelegate to the class line
class BucketListViewController: UITableViewController, AddItemTableViewControllerDelegate {
    
    var items = ["Go to the moon","Eat a candy bar","Swim in the Amazon","Ride a motor bike in Tokyo"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // how many cells to display
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    // what does each cell look like
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListItemCell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
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
    
    // need to override the prepare for segue function
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // check for segue type
        if segue.identifier == "AddItemSegue" { // segue can be nammed on the main.storyboard
            let navigationController = segue.destination as! UINavigationController
            let addItemTableViewController = navigationController.topViewController as! AddItemTableViewController
            addItemTableViewController.delegate = self
        } else if segue.identifier == "EditItemSegue" { // segue can be nammed on the main.storyboard
            let navigationController = segue.destination as! UINavigationController
            let addItemTableViewController = navigationController.topViewController as! AddItemTableViewController
            addItemTableViewController.delegate = self
            // use sent index path to set item in table view controller
            let indexPath = sender as! NSIndexPath
            let item = items[indexPath.row]
            addItemTableViewController.item = item
            addItemTableViewController.indexPath = indexPath
            
        }
        
        
    }
    // add the function that lets this file be a cancel button delegate
    func cancelButtonPressed(by controller: AddItemTableViewController) {
        print("I'm the hidden controller BUT I am responding to the cancel button press on the top view controller")
        // remove top view controller
        dismiss(animated: true, completion: nil)
    }
    // add item
    func itemSaved(by controller: AddItemTableViewController, with text: String, at indexPath: NSIndexPath?) {
        // unwrap index path (if exists)
        if let ip = indexPath {
            // update existing item
            items[ip.row] = text
        } else {
            // add the item (from text box) into table view array
            items.append(text)
        }
        print("text from top view recieved \(text)")
        
        // reload table view
        tableView.reloadData()
        // remove top view controller
        dismiss(animated: true, completion: nil)
    }

}

