//
//  ToDoListViewController.swift
//  ToDoApp
//
//  Created by Jose Martins on 13/10/20.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    var todos: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            ToDoService.instance.removeTodo(index: indexPath.row)
            self.updateToDos()
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.updateToDos()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.todos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell")!
        cell.textLabel?.text = todos[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func updateToDos() {
        todos = ToDoService.instance.getToDos()
        tableView.reloadData()
    }
    
}
