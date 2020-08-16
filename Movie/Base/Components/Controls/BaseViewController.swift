//
//  BaseViewController.swift
//  Movie
//
//  Created by Varol on 12.08.2020.
//  Copyright © 2020 Varol. All rights reserved.
//

import UIKit
import PopupDialog
import Hero
class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.hero.isEnabled = true
        self.view.heroModifiers = [.useNoSnapshot]
        navigationItem.backBarButtonItem?.title = ""
//         navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }
    
    func showPopup(title: String, message: String) {
        let popupVC = PopupViewController(title: title, description: message, buttonTitle: "Close")
        let _ = popupVC.view
        let popup = PopupDialog(viewController: popupVC,
                                buttonAlignment: .horizontal,
                                transitionStyle: .zoomIn,
                                tapGestureDismissal: true,
                                panGestureDismissal: false)
        popupVC.onAction = { [weak self] in
            guard self != nil else {return}
            popup.dismiss()
        }
        popup.view.backgroundColor = .clear
        present(popup, animated: true, completion: nil)
    }
    
}
