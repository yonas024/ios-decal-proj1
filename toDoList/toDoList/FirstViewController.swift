//
//  FirstViewController.swift
//  toDoList
//
//  Created by Yonas Kbrom on 2/21/16.
//  Copyright © 2016 iOS Decal. All rights reserved.
//

import UIKit

class FirstViewController: UITableViewController {

    let green:UIColor = UIColor(red: 0.251, green: 0.831, blue: 0.494, alpha: 1)
    let white:UIColor = UIColor.whiteColor()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        let currentTime = NSDate()
        for (var i = controller.items.count-1; i >= 0; i--) {
            if controller.items[i].time == nil {
                
            } else if currentTime.timeIntervalSinceDate(controller.items[i].time!) >= 86400 {
                controller.items.removeAtIndex(i)
            }
        }
        tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controller.items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let tblcell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "tableCell")
        tblcell.textLabel?.text = controller.items[indexPath.row].name
        tblcell.detailTextLabel?.text = controller.items[indexPath.row].d
        tblcell.backgroundColor = controller.items[indexPath.row].bc
        tblcell.accessoryType = controller.items[indexPath.row].tc
        return tblcell
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            controller.items.removeAtIndex(indexPath.row)
            tableView.reloadData()
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let selectedCell = tableView.cellForRowAtIndexPath(indexPath)
        selectedCell!.accessoryType = UITableViewCellAccessoryType.Checkmark
        if selectedCell?.backgroundColor != green {
            selectedCell?.backgroundColor = green
            selectedCell!.accessoryType = UITableViewCellAccessoryType.Checkmark
            controller.items[indexPath.row].time = NSDate()
            controller.items[indexPath.row].completed = true
            controller.items[indexPath.row].bc = green
            controller.items[indexPath.row].tc = UITableViewCellAccessoryType.Checkmark
        } else if selectedCell?.backgroundColor != white {
            selectedCell?.backgroundColor = white
            selectedCell!.accessoryType = UITableViewCellAccessoryType.None
            controller.items[indexPath.row].completed = false
            controller.items[indexPath.row].bc = white
            controller.items[indexPath.row].tc = UITableViewCellAccessoryType.None
        }
        selectedCell?.selected = false
        
    }
    
    
    @IBAction func cancel(segue: UIStoryboardSegue) {
        
    }



}

