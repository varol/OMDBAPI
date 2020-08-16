//
//  BaseComponentView.swift
//  Movie
//
//  Created by Varol on 13.08.2020.
//  Copyright © 2020 Varol. All rights reserved.
//

import UIKit

class BaseComponentView: UIControl {
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        self.loadComponent()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        self.loadComponent()
    }
    
    func loadComponent() {
        
        let views = loadView()
        
        if let view = views?.first {
            
            self.insertSubview(view, at: 0)
            view.frame = self.bounds
            
            view.translatesAutoresizingMaskIntoConstraints = false
            
            view.topAnchor.constraint(equalTo: self.topAnchor, constant: 1.0).isActive = true
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 1.0).isActive = true
            view.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 1.0).isActive = true
            view.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 1.0).isActive = true
        }
    }
    
    func loadView() -> [UIView]? {
        return Bundle.main.loadNibNamed(String(describing: type(of: self)), owner: self, options: nil) as? [UIView]
    }
    
    func setShadow() {
        layer.shadowOffset = CGSize(width: 0, height: 1)
        layer.shadowOpacity = 0.1
        layer.shadowRadius = 4.0
        layer.shadowColor = UIColor.black.cgColor
    }
}
