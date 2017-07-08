//
//  ViewController.swift
//  bucketList
//
//  Created by Kristopher Merolla on 7/7/17.
//  Copyright © 2017 Kristopher Merolla. All rights reserved.
//

import UIKit

class BucketListViewController: UITableViewController {
    
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


}

