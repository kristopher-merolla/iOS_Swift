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
        // specify the url that we will be sending the GET Request to
        let url = URL(string: "http://swapi.co/api/people/")
        // create a URLSession to handle the request tasks
        let session = URLSession.shared
        // create a "data task" to make the request and run the completion handler
        let task = session.dataTask(with: url!, completionHandler: {
            // see: Swift closure expression syntax
            data, response, error in
            // data -> JSON data, response -> headers and other meta-information, error-> if one occurred
            // "do-try-catch" blocks execute a try statement and then use the catch statement for errors
            do {
                // try converting the JSON object to "Foundation Types" (NSDictionary, NSArray, NSString, etc.)
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                    // Why do we need to optionally unwrap jsonResult["results"]
                    // Try it without the optional unwrapping and you'll see that the value is actually an optional
                    if let results = jsonResult["results"] {
                        // coercing the results object as an NSArray and then storing that in resultsArray
                        let resultsArray = results as! NSArray
                        for i in 0..<resultsArray.count {
                            // grab the names from the resultsArray and populate the people array
                            let person = (resultsArray[i] as AnyObject)["name"]! as! String
                            print(person)
                            self.people.append(person)
                        }
                        // now we can run NSArray methods like count and firstObject
                        // print(resultsArray.count)
                        // print((resultsArray[0] as AnyObject)["name"]! ?? "No Name For Index")
                        // print(resultsArray.firstObject as Any)
                    }
                    // refresh the table view
                    self.appTableView.reloadData()
                }
            } catch {
                print(error)
            }
        })
        // execute the task and wait for the response before
        // running the completion handler. This is async!
        task.resume()
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
