//
//  AddItemTableViewControllerDelegate.swift
//  bucketList
//
//  Created by Kristopher Merolla on 7/10/17.
//  Copyright © 2017 Kristopher Merolla. All rights reserved.
//

import Foundation

protocol AddItemTableViewControllerDelegate: class {
    // for save we pass back an item, hence the second parameter
    func itemSaved(by controller: AddItemTableViewController, with text: String)
    func cancelButtonPressed(by controller: AddItemTableViewController)
}
