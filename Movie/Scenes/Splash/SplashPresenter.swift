//
//  SplashPresenter.swift
//  CIViperGenerator
//
//  Created by Varol AKSOY on 12.08.2020.
//  Copyright © 2020 Varol AKSOY. All rights reserved.
//

import Foundation

protocol SplashPresenterInterface: class {
    func viewDidAppear()
}

class SplashPresenter {

    unowned var view: SplashViewControllerInterface
    let router: SplashRouterInterface?
    let interactor: SplashInteractorInterface?

    init(interactor: SplashInteractorInterface, router: SplashRouterInterface, view: SplashViewControllerInterface) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension SplashPresenter: SplashPresenterInterface {
    func viewDidAppear() {
        self.interactor?.checkInternetConnection()
    }
}

extension SplashPresenter : SplashInteractorOutputProtocol {
    func remoteConfig(welcomeText: String) {
        DispatchQueue.main.async {
            self.view.setWelcomeText(welcomeText: welcomeText)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.router?.showHomeScreen()
        }
    }
    
    func internetConnection(status: Bool) {
        if status {
            self.interactor?.fetchRemoteConfig()
        } else {
            self.view.noConnection()
        }
    }
}
