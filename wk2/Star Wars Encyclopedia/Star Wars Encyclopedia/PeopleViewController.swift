//
//  TableViewController.swift
//  Star Wars Encyclopedia
//
//  Created by Kristopher Merolla on 7/14/17.
//  Copyright © 2017 xCoders. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    
}

class PeopleViewController: UITableViewController {

    // Initialize as an empty array of strings
    var people = [[String]]()
    
    // Create table view
    @IBOutlet var appTableView: UITableView!
    
    let personSegueIdentifier = "ShowPersonSegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        StarWarsModel.getAllPeople(completionHandler: { // passing what becomes "completionHandler" in the 'getAllPeople' function definition in StarWarsModel.swift
            data, response, error in
            do {
                // Try converting the JSON object to "Foundation Types" (NSDictionary, NSArray, NSString, etc.)
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                    if let results = jsonResult["results"] as? NSArray {
                        for person in results {
                            let personDict = person as! NSDictionary
                            let personArray = [(personDict["name"]! as! String),(personDict["mass"]! as! String),(personDict["birth_year"]! as! String),(personDict["gender"]! as! String)]
                            self.people.append(personArray)
                            // self.people.append(personDict["name"]! as! String)
                        }
                    }
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print("Something went wrong")
            }
        })
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
        // Create a person cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath) as! PersonTableViewCell
        // set the default cell label to the corresponding element in the people array
        cell.nameLabel?.text = people[indexPath.row][0]
        // return the cell so that it can be rendered
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if  segue.identifier == personSegueIdentifier,
            let destination = segue.destination as? PeopleInfoVC,
            let personIndex = tableView.indexPathForSelectedRow?.row {
                // print(personIndex)
                // print("about to set destination.nameForLabel...")
                destination.nameForLabel = people[personIndex][0]
                destination.massForLabel = people[personIndex][1]
                destination.birthYearForLabel = people[personIndex][2]
                destination.genderForLabel = people[personIndex][3]
            }
    }
    
    @IBAction func unwindToPeopleVC(segue: UIStoryboardSegue) {
        // print("unwound to people view controller!")
    }
    

}
