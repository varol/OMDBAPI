//
//  AppDelegate.swift
//  Movie
//
//  Created by Varol on 12.08.2020.
//  Copyright © 2020 Varol. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let services: [UIApplicationDelegate] = [
        AppStartService(),
        ApperanceService(),
        FirebaseService()
    ]

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        for service in self.services {
            let _ = service.application?(application, didFinishLaunchingWithOptions: launchOptions)
        }
        
        if #available(iOS 13.0, *){
            window = UIWindow(frame: UIScreen.main.bounds)
        }

        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return true
    }

    // MARK: UISceneSession Lifecycle
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }
}

