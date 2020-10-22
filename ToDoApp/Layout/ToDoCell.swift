//
//  ToDoCell.swift
//  ToDoApp
//
//  Created by Jose Martins on 22/10/20.
//

import UIKit

class ToDoCell: UITableViewCell {
    @IBOutlet weak var taskNameLabel: UILabel!
    
    func fillUI(taskName: String) {
        taskNameLabel.text = taskName
    }
}
