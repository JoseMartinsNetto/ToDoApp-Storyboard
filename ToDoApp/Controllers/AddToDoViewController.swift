//
//  AddToDoViewController.swift
//  ToDoApp
//
//  Created by Jose Martins on 13/10/20.
//

import UIKit

class AddToDoViewController: UIViewController {
    @IBOutlet weak var newTodoTextField: UITextField!
    @IBOutlet weak var addTaskButton: UIButton!
    
    var keyboardHeigh: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(onKeyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        setupView()
    }
    
    func setupView() {
        setupTextField()
        setupButton()
    }
    
    func setupButton() {
        addTaskButton.layer.cornerRadius = 20
        addTaskButton.layer.borderWidth = 0.5
        addTaskButton.layer.borderColor = .init(red: 220/255, green: 134/255, blue: 0, alpha: 1)
    }
    
    func setupTextField() {
        newTodoTextField.layer.cornerRadius = 20
        newTodoTextField.layer.borderWidth = 0.5
        newTodoTextField.layer.borderColor = UIColor.black.cgColor
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
            
            self.showToast(message: "Tarefa adicionada!", offSetY: keyboardHeigh)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
}
