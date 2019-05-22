//
//  TodoList.swift
//  Swift-iOS-TodoApp
//
//  Created by Pablo Fernandez Guerra on 18/05/2019.
//  Copyright © 2019 Pablo Fernandez Guerra. All rights reserved.
//

import Foundation

class TodoList {
    var todos: [ChecklistItemModel] = []
    
    init() { 
        let row0Item = ChecklistItemModel()
        let row1Item = ChecklistItemModel()
        let row2Item = ChecklistItemModel()
        let row3Item = ChecklistItemModel()
        let row4Item = ChecklistItemModel()
        
        row0Item.text = "Take a jog"
        row1Item.text = "Watch a movie"
        row2Item.text = "Code an app"
        row3Item.text = "Walk the dog"
        row4Item.text = "Study design patterns"
        
        todos.append(row0Item)
        todos.append(row1Item)
        todos.append(row2Item)
        todos.append(row3Item)
        todos.append(row4Item)
    }
    
    func newTodo() -> ChecklistItemModel {
        let item = ChecklistItemModel()
        item.text = "New todo item"
        
        todos.append(item)
        
        return item
    }
}
