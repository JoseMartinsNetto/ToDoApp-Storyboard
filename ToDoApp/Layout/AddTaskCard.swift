//
//  AddTaskCard.swift
//  ToDoApp
//
//  Created by Jose Martins on 23/10/20.
//

import UIKit

class AddTaskCard: UIView {
    let textField: UITextField = {
       let textField = UITextField()
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        textField.attributedPlaceholder = NSAttributedString(string: "Digite aqui a tarefa...",
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 8
        textField.textColor = .darkText
        textField.returnKeyType = .go
        
        return textField
    }()
    
    let addButton: UIButton = {
        let button = UIButton()
        button.size(size: .init(width: 40, height: 40))
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.backgroundColor = .red
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowRadius = 3.0
        button.layer.shadowOpacity = 0.1
        button.layer.shadowOffset = CGSize(width: 1, height: 1)
        button.layer.masksToBounds = false
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemGray
        
        let stackView = UIStackView(arrangedSubviews: [textField, addButton])
        stackView.distribution = .fill
        stackView.axis = .horizontal
        stackView.spacing = 20
        
        addSubview(stackView)
        stackView.fill(
            top: topAnchor,
            leading: leadingAnchor,
            bottom: nil,
            trailing: trailingAnchor,
            padding: .init(top: 10, left: 5, bottom: 0, right: 5)
        )
        
        textField.becomeFirstResponder()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
