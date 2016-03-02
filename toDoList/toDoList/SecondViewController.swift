//
//  SecondViewController.swift
//  toDoList
//
//  Created by Yonas Kbrom on 2/21/16.
//  Copyright © 2016 iOS Decal. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var itemTitle: UITextField!

    @IBOutlet weak var itemDes: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {// called when 'return' key pressed. return NO to ignore.
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func save(sender: AnyObject) {
        if itemTitle.text?.characters.count > 0 {
            if itemDes.text?.characters.count > 0 {
                controller.addItem(itemTitle.text!, d: itemDes.text!)
                self.view.endEditing(true)
                itemTitle.text = ""
                itemDes.text = ""
                //print(controller.items)
                self.dismissViewControllerAnimated(true, completion: nil)
            }
        }
    }
    
    @IBAction func cancel(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}

