//
//  ChecklistItemModel.swift
//  Swift-iOS-TodoApp
//
//  Created by Pablo Fernandez Guerra on 18/05/2019.
//  Copyright © 2019 Pablo Fernandez Guerra. All rights reserved.
//

import Foundation

class CheckListItem: NSObject {
    var text = ""
    var checked = false
    
    public func toggle() {
        self.checked = !self.checked
    }
}
