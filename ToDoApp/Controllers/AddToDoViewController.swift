//
//  AddToDoViewController.swift
//  ToDoApp
//
//  Created by Jose Martins on 13/10/20.
//

import UIKit

class AddToDoViewController: UIViewController {
    @IBOutlet weak var newTodoTextField: UITextField!
    var keyboardHeigh: CGFloat?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(onKeyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    @objc func onKeyboardShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            self.keyboardHeigh = keyboardSize.height
        }
    }
    
    @IBAction func addTodoButtonAction(_ sender: Any) {
        
        if let newTodo = newTodoTextField.text {
            ToDoService.instance.saveTodo(newTodo: newTodo)
            
            newTodoTextField.text = ""
            
            self.showToast(message: "Tarefa adicionada!", offSetY: keyboardHeigh!)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
}
