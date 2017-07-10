//
//  AddItemTableViewController.swift
//  bucketList
//
//  Created by Kristopher Merolla on 7/10/17.
//  Copyright © 2017 Kristopher Merolla. All rights reserved.
//

import UIKit

class AddItemTableViewController: UITableViewController {
    
    // setup delegate so the CancelButtonDelegate.swift functions can be run
    weak var delegate: AddItemTableViewControllerDelegate?
    // declare string variable, so we can use in segue
    var item: String?
    // declare index path variable, to use in segue
    var indexPath: NSIndexPath?
    
    @IBOutlet weak var itemTextField: UITextField!

    // button press functions
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        // call the function on the delage swift file
        delegate?.cancelButtonPressed(by: self)
    }
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        let text = itemTextField.text! // force unwrap
        delegate?.itemSaved(by: self, with: text, at: indexPath)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // init "item"
        itemTextField.text = item

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



}
