//
//  DirViewController.swift
//  NSEW
//
//  Created by Kristopher Merolla on 7/10/17.
//  Copyright © 2017 Kristopher Merolla. All rights reserved.
//

import UIKit

class DirViewController: UIViewController, DirectionButtonDelegate {
    
    weak var delegate: DirectionButtonDelegate?
    
    func backButtonPressed(by controller: UIViewController) {
        print("back button pressed dirviewcontroller")
    }
}
