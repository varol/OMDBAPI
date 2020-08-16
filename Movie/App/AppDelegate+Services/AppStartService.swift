//
//  AppStartService.swift
//  Movie
//
//  Created by Varol on 12.08.2020.
//  Copyright © 2020 Varol. All rights reserved.
//

import UIKit
#if DEBUG
import Bagel
#endif

class AppStartService: NSObject {
    var window: UIWindow?
}

extension AppStartService: UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        #if DEBUG
        Bagel.start()
        #endif

        if #available(iOS 13.0, *) {
            return true
        } else {
            window = UIWindow(frame: UIScreen.main.bounds)
            return true
        }
    }
}
