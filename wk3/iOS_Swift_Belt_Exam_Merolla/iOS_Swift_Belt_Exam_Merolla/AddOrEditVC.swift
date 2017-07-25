//
//  AddOrEditVC.swift
//  iOS_Swift_Belt_Exam_Merolla
//
//  Created by Kristopher Merolla on 7/21/17.
//  Copyright © 2017 Kristopher Merolla. All rights reserved.
//

import UIKit

class AddOrEditVC: UIViewController {
    
    // setup a delegate to run functions
    weak var delegate: AddOrEditVCDelegate?
    var indexPath: NSIndexPath?
    var event = ["title","info","time"]
    
    // text fields to use in update of data
    @IBOutlet weak var titleLabel: UITextField!
    @IBOutlet weak var infoLabel: UITextField!
    @IBOutlet weak var timeLabel: UIDatePicker!
    // variables to use in segue
    var eventTitle: String?
    var eventInfo: String?
    var eventTime: String?

    @IBAction func saveButtonPressed(_ sender: UIButton) {
        print("save button pressed")
        // save the data
        let eventTitle = titleLabel.text!
        let eventInfo = infoLabel.text!
        let eventTime = "11:50 AM PST"
        event[0] = eventTitle
        event[1] = eventInfo
        event[2] = eventTime
        print(event)
        // call save function (delegate)
        delegate?.itemSaved(by: self, with: event, at: indexPath)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeLabel.datePickerMode = UIDatePickerMode.time
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
