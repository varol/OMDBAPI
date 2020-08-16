//
//  ApperanceService.swift
//  Movie
//
//  Created by Varol on 12.08.2020.
//  Copyright © 2020 Varol. All rights reserved.
//

import UIKit
import Hero
class ApperanceService: NSObject {
    override init() {
    }
}

extension ApperanceService: UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        setupNavigationBar()
        Hero.shared.containerColor = .clear
        return true
    }
    
    func setupNavigationBar() {
        let navbarApperance = UINavigationBar.appearance()
        navbarApperance.tintColor = UIColor.darkGray
        navbarApperance.barStyle = .default
        navbarApperance.barTintColor = .white
        navbarApperance.isTranslucent = false
        navbarApperance.shadowImage = UIImage()
        navbarApperance.backItem?.title = ""
//        let BarButtonItemAppearance = UIBarButtonItem.appearance()
//        BarButtonItemAppearance.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.clear], for: .normal)
//        BarButtonItemAppearance.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.clear], for: .highlighted)
//        let attrs: [NSAttributedString.Key: Any] = [
//            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .bold),
//            NSAttributedString.Key.foregroundColor: UIColor(named: "LoodosBackgroundColor")! ]
//        navbarApperance.titleTextAttributes = attrs
        navbarApperance.backIndicatorImage = UIImage(named: "iconLeftArrow")
        navbarApperance.backIndicatorTransitionMaskImage = UIImage(named: "iconLeftArrow")
    }

    
    func setupTabbar() {
    }

}
