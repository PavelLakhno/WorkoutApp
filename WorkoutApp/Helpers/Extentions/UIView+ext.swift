//
//  UIView+ext.swift
//  WorkoutApp
//
//  Created by user on 19.05.2023.
//

import UIKit

extension UIView {
    func addBottomBorder(with color: UIColor, height: CGFloat) {
        let separator = UIView()
        separator.backgroundColor = color
        separator.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        separator.frame = CGRect(
            x: 0,
            y: frame.height - height,
            width: frame.width,
            height: height
        )
        
        addSubview(separator)
    }
    
    func makeSystem(_ button: UIButton) {
        button.addTarget(
            self,
            action: #selector(handleIn),
            for: [
                .touchDragInside,
                .touchDown,
            ]
        )
        
        button.addTarget(
            self,
            action: #selector(handleOut),
            for: [
                .touchDragOutside,
                .touchCancel,
                .touchUpInside,
                .touchUpOutside,
                .touchDragExit
            ]
        )
    }
    
    @objc func handleIn() {
        UIView.animate(withDuration: 0.15) { self.alpha = 0.55 }
    }
    
    @objc func handleOut() {
        UIView.animate(withDuration: 0.15) { self.alpha = 1 }
    }
    
    func addView(_ view: UIView) {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
}
