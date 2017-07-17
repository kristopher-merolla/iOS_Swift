//
//  TableViewController.swift
//  Star Wars Encyclopedia
//
//  Created by Kristopher Merolla on 7/14/17.
//  Copyright © 2017 xCoders. All rights reserved.
//

import UIKit

class PeopleViewController: UITableViewController {

    // Initialize as an empty array of strings
    var people = [String]()
    
    // Create table view
    @IBOutlet var appTableView: UITableView!
    
    override func viewDidLoad() {
            super.viewDidLoad()
            // Specify the url that we will be sending the GET Request to
            let url = URL(string: "http://swapi.co/api/people/")
            // Create a URLSession to handle the request tasks
            let session = URLSession.shared
            // Create a "data task" which will request some data from a URL and then run a completion handler after it is done
            let task = session.dataTask(with: url!, completionHandler: {
                data, response, error in
                // We get data, response, and error back. Data contains the JSON data, Response contains the headers and other information about the response, and Error contains an error if one occured
                // A "Do-Try-Catch" block involves a try statement with some catch block for catching any errors thrown by the try statement.
                do {
                    // Try converting the JSON object to "Foundation Types" (NSDictionary, NSArray, NSString, etc.)
                    if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                        if let results = jsonResult["results"] as? NSArray {
                            for person in results {
                                // cast to dictionary for data extraction
                                let personDict = person as! NSDictionary
                                self.people.append(personDict["name"]! as! String)
                            }
                        }
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }
                } catch {
                    print("Something went wrong")
                }
            })
            // Actually "execute" the task. This is the line that actually makes the request that we set up above
            task.resume()
            print("I happen before the response!")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // if we return - sections we won't have any sections to put our rows in
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the count of people in our data array
        return people.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create a generic cell
        let cell = UITableViewCell()
        // set the default cell label to the corresponding element in the people array
        cell.textLabel?.text = people[indexPath.row]
        // return the cell so that it can be rendered
        return cell
    }

}
