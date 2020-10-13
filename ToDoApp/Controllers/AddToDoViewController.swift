//
//  AddToDoViewController.swift
//  ToDoApp
//
//  Created by Jose Martins on 13/10/20.
//

import UIKit

class AddToDoViewController: UIViewController {
    @IBOutlet weak var newTodoTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addTodoButtonAction(_ sender: Any) {
        
        if let newTodo = newTodoTextField.text {
            ToDoService.instance.saveTodo(newTodo: newTodo)
            
            newTodoTextField.text = ""
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
}
