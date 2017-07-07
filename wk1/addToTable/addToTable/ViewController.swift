//
//  ViewController.swift
//  addToTable
//
//  Created by Kristopher Merolla on 7/7/17.
//  Copyright © 2017 Kristopher Merolla. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // save some tasks in view controller
    var tasks = ["Swipe to remove list item", "New items added go to the list", "List will not persist if app closed"]

    // app elements
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    // button (to add beast)
    @IBAction func beastButtonPressed(_ sender: UIButton) {
        // unwrap text
        if let text = taskTextField.text {
            if text != "" { // check text not empty
                tasks.append(text)
            }
        }
        // reset taskTextField after successful append
        taskTextField.text = ""
        // reload table
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //////////////////////////
    // table view functions //
    //////////////////////////
    // show rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count // we want as many rows as tasks
    }
    // fill rows
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row]
        return cell
        
    }
    // delete with a touch
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("Selection: \(indexPath.section) and Row: \(indexPath.row)")
//        tasks.remove(at: indexPath.row)
//        tableView.reloadData()
//    }
    // delete with a swipe
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            tasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableViewRowAnimation.automatic)
        }
    }
}


