//
//  UIViewControllerExtension.swift
//  ToDoApp
//
//  Created by Jose Martins on 13/10/20.
//

import UIKit

extension UIViewController {

    func showToast(message : String, offSetY: CGFloat, completion: @escaping () -> ()) {
        var newOffSetY: CGFloat = self.view.frame.size.height - 100
        
        if offSetY != 0 {
            newOffSetY = offSetY + 150
        }

        let toastLabel = UILabel(
            frame: CGRect(
                x: self.view.frame.size.width / 2 - 75,
                y: newOffSetY,
                width: 150,
                height: 35
            )
        )
                
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        toastLabel.textColor = UIColor.black
        toastLabel.font = UIFont.systemFont(ofSize: 13)
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
            
        self.view.addSubview(toastLabel)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            toastLabel.removeFromSuperview()
            completion()
        }
    }
    
}
