//
//  PopupViewController.swift
//  Movie
//
//  Created by Varol on 13.08.2020.
//  Copyright © 2020 Varol. All rights reserved.
//

import UIKit

class PopupViewController: BaseViewController {

    @IBOutlet weak var titleLabel: BaseLabel!
    @IBOutlet weak var messageLabel: BaseLabel!
    @IBOutlet weak var button: UIButton!
    
    var titleString: String? = nil
    var messageString: String? = nil
    var buttonTitleString: String? = nil
    var onAction: ( () -> Void )?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    convenience init(title:String?, description:String?, buttonTitle:String) {
        self.init()
        
        self.titleString = title
        self.messageString = description
        self.buttonTitleString = buttonTitle
         
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.titleLabel.text = titleString
        self.messageLabel.text = messageString
        self.button.setTitle(buttonTitleString, for: .normal)
    }

    @IBAction func buttonTapped(_ sender: Any) {
        self.onAction?()
    }
    
}
