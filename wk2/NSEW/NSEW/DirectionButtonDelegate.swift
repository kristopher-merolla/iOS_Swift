//
//  DirectionButtonDelegate.swift
//  NSEW
//
//  Created by Kristopher Merolla on 7/10/17.
//  Copyright © 2017 Kristopher Merolla. All rights reserved.
//

import UIKit

protocol DirectionButtonDelegate: class {
    
    // back button
    func backButtonPressed(by controller: UIViewController)
    // directional buttons
    func northButtonPressed(by controller: UIViewController)
    func eastButtonPressed(by controller: UIViewController)
    func southButtonPressed(by controller: UIViewController)
    func westButtonPressed(by controller: UIViewController)
    
}
