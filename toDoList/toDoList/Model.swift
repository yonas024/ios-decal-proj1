//
//  Model.swift
//  toDoList
//
//  Created by Yonas Kbrom on 2/28/16.
//  Copyright © 2016 iOS Decal. All rights reserved.
//

import UIKit

var controller = Model()

struct item {
    var name = "Title"
    var d = "Description"
    var time: NSDate? = nil
    var completed = false
    var bc = UIColor.whiteColor()
    var tc = UITableViewCellAccessoryType.None
}

class Model: NSObject {
    
    var items = [item]()
    
    func addItem(name: String, d: String) {
        items.append(item(name: name, d: d, time: nil, completed: false, bc: UIColor.whiteColor(), tc: UITableViewCellAccessoryType.None))
    }
    
}
