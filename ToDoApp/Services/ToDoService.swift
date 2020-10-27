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
            var todos = self.getToDos()
            todos.append(newTodo)
            UserDefaults.standard.set(todos, forKey: self.todosKey)
        }
    }
    
    func removeTodo(index: Int) {
        var todos = self.getToDos()
        todos.remove(at: index)
        UserDefaults.standard.set(todos, forKey: self.todosKey)
    }
    
    func getToDos() -> [String] {
        if let todos = UserDefaults.standard.object(forKey: self.todosKey) as? [String]{
            return todos.reversed()
        }
        
        return []
    }
}
