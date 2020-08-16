//
//  SplashRouter.swift
//  CIViperGenerator
//
//  Created by Varol AKSOY on 12.08.2020.
//  Copyright © 2020 Varol AKSOY. All rights reserved.
//

import Foundation
import UIKit
import Hero
protocol SplashRouterInterface: class {
    func showHomeScreen()
}

class SplashRouter: NSObject {

    weak var presenter: SplashPresenterInterface?
    private weak var viewController: SplashViewController?

    static func setupModule() -> SplashViewController {
        let vc = SplashViewController()
        let interactor = SplashInteractor()
        let router = SplashRouter()
        let presenter = SplashPresenter(interactor: interactor, router: router, view: vc)

        vc.presenter = presenter
        router.presenter = presenter
        interactor.output = presenter
        router.viewController = vc

        return vc
    }
}

extension SplashRouter: SplashRouterInterface {
    func showHomeScreen() {
        guard let window = viewController?.view.window else { return }
        let vc = HomeRouter.setupModule()
        UIHelper.showHUD()
        let nav = UINavigationController(rootViewController: vc)
        nav.hero.isEnabled = true
        nav.heroNavigationAnimationType = .zoom
        window.rootViewController = nav
    }
}

