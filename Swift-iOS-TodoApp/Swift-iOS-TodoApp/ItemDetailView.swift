//
//  AddItemTableViewController.swift
//  Swift-iOS-TodoApp
//
//  Created by Pablo Fernandez Guerra on 30/05/2019.
//  Copyright © 2019 Pablo Fernandez Guerra. All rights reserved.
//

import UIKit

protocol AddItemViewControllerDelegate: class {
    func addItemViewControllerDidCancel (_ controller: ItemDetailView)
    func addItemViewController(_ controller: ItemDetailView, didFinishAdding item: CheckListItem)
    func addItemViewController(_ controller: ItemDetailView, didFinishEditing item: CheckListItem)
}

class ItemDetailView: UITableViewController {
    weak var delegate: AddItemViewControllerDelegate?
    
    weak var todoList: TodoList?
    weak var itemToEdit: CheckListItem?

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var addButton: UIBarButtonItem!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    
    @IBAction func cancel(_ sender: Any) {
        delegate?.addItemViewControllerDidCancel(self)
    }
    
    @IBAction func add(_ sender: Any) {
        if let item = itemToEdit, let text = textField.text {
            item.text = text
            delegate?.addItemViewController(self, didFinishEditing: item)
        } else {
            if let item = todoList?.newTodo() {
                if let textField = textField.text {
                    item.text = textField
                }
                
                item.checked = false
                delegate?.addItemViewController(self, didFinishAdding: item)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let item = itemToEdit {
            title = "Edit Item"
            textField.text = item.text
            addButton.isEnabled = true
        }
        
        navigationItem.largeTitleDisplayMode = .never
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
        textField.becomeFirstResponder()
    }
}

extension ItemDetailView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let oldText = textField.text,
            let stringRange = Range(range, in: oldText) else {
                return false
        }
        
        let newText = oldText.replacingCharacters(in: stringRange, with: string)
        
        if newText.isEmpty {
            addButton.isEnabled = false
        } else {
            addButton.isEnabled = true
        }
        
        return true
    }
}
