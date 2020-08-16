//
//  SplashViewController.swift
//  CIViperGenerator
//
//  Created by Varol AKSOY on 12.08.2020.
//  Copyright © 2020 Varol AKSOY. All rights reserved.
//

import UIKit

protocol SplashViewControllerInterface: class {
    func setWelcomeText(welcomeText: String)
    func noConnection()
}

class SplashViewController: BaseViewController {
    @IBOutlet weak var welcomeLabel: BaseLabel! 
    
    var presenter: SplashPresenterInterface?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        presenter?.viewDidAppear()
    }
    
    
}

extension SplashViewController: SplashViewControllerInterface {
    func setWelcomeText(welcomeText: String) {
        self.welcomeLabel.text = welcomeText
    }
    
    func noConnection() {
        self.showPopup(title: "No Internet!", message: "Please check that you are connected to the Internet and try again.")
    }
}
