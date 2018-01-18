//
//  Item.swift
//  Listly
//
//  Created by Saeed Rahman on 17/1/2018.
//  Copyright © 2018 Saeed Rahman. All rights reserved.
//

import Foundation
class ToDoItem {

    struct ToDoItem {
    var title: String
    
    init(title: String) {
        self.title = title
        }
    }
    
    static var highPriorityItems = [ToDoItem]()
    static var lowPriorityItems = [ToDoItem]()
}
