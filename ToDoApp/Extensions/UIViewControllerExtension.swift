//
//  UIViewControllerExtension.swift
//  ToDoApp
//
//  Created by Jose Martins on 13/10/20.
//

import UIKit

extension UIViewController {

    func showToast(message : String, offSetY: CGFloat = 0, _ size: CGFloat = 13) {
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
        toastLabel.font = UIFont.systemFont(ofSize: size)
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
            
        self.view.addSubview(toastLabel)
            
        UIView.animate(
            withDuration: 5.0,
            delay: 0.1,
            options: .curveEaseOut, animations: {
             toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    
}
