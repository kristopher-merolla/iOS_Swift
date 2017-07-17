//
//  PeopleInfoVC.swift
//  Star Wars Encyclopedia
//
//  Created by Kristopher Merolla on 7/17/17.
//  Copyright © 2017 xCoders. All rights reserved.
//

import UIKit

class PeopleInfoVC: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var birthYearLabel: UILabel!
    @IBOutlet weak var massLabel: UILabel!
    
    var nameForLabel: String?
    var genderForLabel: String?
    var birthYearForLabel: String?
    var massForLabel: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = nameForLabel
        genderLabel.text = genderForLabel
        birthYearLabel.text = birthYearForLabel
        massLabel.text = massForLabel
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
