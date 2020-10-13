//
//  ToDoService.swift
//  ToDoApp
//
//  Created by Jose Martins on 13/10/20.
//

import Foundation

class ToDoService {
    static let instance = ToDoService()
    private let todosKey = "todos"
    
    func saveTodo(newTodo: String) {
        if !newTodo.isEmpty {
            if let savedTodos = UserDefaults.standard.object(forKey: self.todosKey) {
                var newTodos = savedTodos as! [String]
                newTodos.append(newTodo)
                UserDefaults.standard.setValue(newTodos, forKey: self.todosKey)
            }
        }
    }
    
    func getToDos() -> [String] {
        if let todos = UserDefaults.standard.object(forKey: self.todosKey) {
            return todos as! [String]
        }
        
        return []
    }
}
