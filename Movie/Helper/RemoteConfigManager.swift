//
//  RemoteConfigManager.swift
//  Movie
//
//  Created by Varol on 12.08.2020.
//  Copyright © 2020 Varol. All rights reserved.
//

import Foundation
import Firebase

class RemoteConfigManager {
    
    public static let shared = RemoteConfigManager()
    private let welcomeKey = "welcome_message"
    private let remoteConfig = RemoteConfig.remoteConfig()
    
    func loadDefaultValues() {
        let appDefaults: [String: Any?] = [
            welcomeKey : ""
        ]
        RemoteConfig.remoteConfig().setDefaults(appDefaults as? [String : NSObject])
    }
    
    func fetchRemoteConfig(completionHandler : @escaping (String)->()) {
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConfig.configSettings = settings
        remoteConfig.fetch {[weak self] (status, error) in
            guard let self = self else {return}
            if status == .success {
                self.remoteConfig.activate() {[weak self] (changed, error) in
                    guard let self = self else {return}
                    let welcomeText = self.remoteConfig[self.welcomeKey].stringValue
                    completionHandler(welcomeText ?? "")
                }
            } else {
                print("Error: \(error?.localizedDescription ?? "No error available.")")
            }
        }
    }
    
}
