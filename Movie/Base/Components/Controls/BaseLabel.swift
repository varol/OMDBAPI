//
//  BaseLabel.swift
//  Movie
//
//  Created by Varol on 12.08.2020.
//  Copyright © 2020 Varol. All rights reserved.
//

import UIKit

@IBDesignable
class BaseLabel: UILabel {
    
    var localizeableText:String?
    
    @IBInspectable var borderColor: UIColor = UIColor.clear
        {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var cornerrRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerrRadius
            clipsToBounds = true
        }
    }
    
    @IBInspectable var autoLocalization: Bool = true
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        
        if autoLocalization == true && text != nil {
            localizeableText = text?.localized
            super.text = localizeableText
        }
    }
    
    override var text:String? {
        didSet {
            if autoLocalization == true && text != nil {
                super.text = text?.localized
            } else {
                super.text = text
            }
        }
    }
    
    
    
    @objc func updateText() {
        text = localizeableText
    }
}
