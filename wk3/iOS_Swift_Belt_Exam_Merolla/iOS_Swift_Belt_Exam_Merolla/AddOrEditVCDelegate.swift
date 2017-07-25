//
//  AddOrEditVCDelegate.swift
//  iOS_Swift_Belt_Exam_Merolla
//
//  Created by Kristopher Merolla on 7/21/17.
//  Copyright © 2017 Kristopher Merolla. All rights reserved.
//

import Foundation

protocol AddOrEditVCDelegate: class {
    // for save we pass back an item
    func itemSaved(by controller: AddOrEditVC, with text: Array<Any>, at indexPath: NSIndexPath?)
}
