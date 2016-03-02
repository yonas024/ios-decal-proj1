//
//  StatsViewController.swift
//  toDoList
//
//  Created by Yonas Kbrom on 2/28/16.
//  Copyright © 2016 iOS Decal. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {

    @IBOutlet weak var taskNumber: UILabel!
    
    @IBOutlet weak var tasksCompleted: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        var count = 0
        for item in controller.items {
            if item.completed == true {
                count += 1
            }
        }
        
        if count == 0 {
            taskNumber.textColor = UIColor.redColor()
        } else {
            taskNumber.textColor = UIColor.greenColor()
        }
        taskNumber.text = "\(count)"
        tasksCompleted.text = "tasks completed"
        
    }
    
}
