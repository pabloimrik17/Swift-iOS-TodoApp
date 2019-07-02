//
//  TodoList.swift
//  Swift-iOS-TodoApp
//
//  Created by Pablo Fernandez Guerra on 18/05/2019.
//  Copyright © 2019 Pablo Fernandez Guerra. All rights reserved.
//

import Foundation

class TodoList {
    private let tittles = ["A", "B", "C"]
    
    var todos: [CheckListItem] = []
    
    init() { 
        let row0Item = CheckListItem()
        let row1Item = CheckListItem()
        let row2Item = CheckListItem()
        let row3Item = CheckListItem()
        let row4Item = CheckListItem()
        
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
    
    func newTodo() -> CheckListItem {
        let item = CheckListItem()
        item.text = self.randomTitle()
        item.checked = true
        
        todos.append(item)
        
        return item
    }
    
    private func randomTitle() -> String {
        let randomNumber = Int.random(in: 0 ... tittles.count - 1)
        
        return tittles[randomNumber]
    }
}
