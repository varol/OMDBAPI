//
//  MovieDetailRouter.swift
//  CIViperGenerator
//
//  Created by Varol AKSOY on 12.08.2020.
//  Copyright © 2020 Varol AKSOY. All rights reserved.
//

import Foundation
import UIKit

protocol MovieDetailRouterInterface: class {

}

class MovieDetailRouter: NSObject {

    weak var presenter: MovieDetailPresenterInterface?
    weak var viewController: UIViewController?
    weak var navigationController: UINavigationController?

    static func setupModule() -> MovieDetailViewController {
        let vc = MovieDetailViewController()
        let interactor = MovieDetailInteractor()
        let router = MovieDetailRouter()
        let presenter = MovieDetailPresenter(interactor: interactor, router: router, view: vc)

        vc.presenter = presenter
        router.presenter = presenter
        interactor.output = presenter
        router.viewController = vc
        return vc
    }
}

extension MovieDetailRouter: MovieDetailRouterInterface {

}

