//
//  HomeRouter.swift
//  CIViperGenerator
//
//  Created by Varol AKSOY on 13.08.2020.
//  Copyright © 2020 Varol AKSOY. All rights reserved.
//

import Foundation
import UIKit

protocol HomeRouterInterface: class {
    func showMovieDetail(with movieID: String?)
}

class HomeRouter: NSObject {

    weak var presenter: HomePresenterInterface?
    weak var viewController: HomeViewController?

    static func setupModule() -> HomeViewController {
        let vc = HomeViewController()
        let interactor = HomeInteractor()
        let router = HomeRouter()
        let presenter = HomePresenter(interactor: interactor, router: router, view: vc)
        
        vc.presenter = presenter
        router.presenter = presenter
        interactor.output = presenter
        router.viewController = vc
        return vc
    }
}

extension HomeRouter: HomeRouterInterface {
    func showMovieDetail(with movieID: String?) {
        guard let movieID = movieID else {return}
        let vc = MovieDetailRouter.setupModule()
        vc.movieID = movieID
        vc.hero.isEnabled = true
        self.viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}

