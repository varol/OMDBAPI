//
//  SplashInteractor.swift
//  CIViperGenerator
//
//  Created by Varol AKSOY on 12.08.2020.
//  Copyright © 2020 Varol AKSOY. All rights reserved.
//

import Foundation

protocol SplashInteractorInterface: class {
    func checkInternetConnection()
    func fetchRemoteConfig()
}
protocol SplashInteractorOutputProtocol {
    func internetConnection(status: Bool)
    func remoteConfig(welcomeText: String)
}

class SplashInteractor {
    var output: SplashInteractorOutputProtocol?
}

extension SplashInteractor: SplashInteractorInterface {
    func fetchRemoteConfig() {
        RemoteConfigManager.shared.loadDefaultValues()
        RemoteConfigManager.shared.fetchRemoteConfig { [weak self] (welcomeText) in
            guard let self = self else {return}
            self.output?.remoteConfig(welcomeText: welcomeText)
        }
    }
    
    func checkInternetConnection() {
        if NetworkManager.shared.isConnectedToInternet() {
            self.output?.internetConnection(status: true)
        } else {
            self.output?.internetConnection(status: false)
        }
    }
}
