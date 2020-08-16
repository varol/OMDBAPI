//
//  FirebaseService.swift
//  Movie
//
//  Created by Varol on 12.08.2020.
//  Copyright © 2020 Varol. All rights reserved.
//

import UIKit
import Firebase

class FirebaseService: NSObject {
    override init() {
    }
}

extension FirebaseService: UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        // configure firebase
        FirebaseApp.configure()
        FirebaseConfiguration.shared.setLoggerLevel(.error)
        return true
    }
    
}
