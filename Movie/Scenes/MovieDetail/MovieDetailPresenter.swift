//
//  MovieDetailPresenter.swift
//  CIViperGenerator
//
//  Created by Varol AKSOY on 12.08.2020.
//  Copyright © 2020 Varol AKSOY. All rights reserved.
//

import Foundation

protocol MovieDetailPresenterInterface: class {
    func viewDidAppear()
}

class MovieDetailPresenter {

    unowned var view: MovieDetailViewControllerInterface
    let router: MovieDetailRouterInterface?
    let interactor: MovieDetailInteractorInterface?

    init(interactor: MovieDetailInteractorInterface, router: MovieDetailRouterInterface, view: MovieDetailViewControllerInterface) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension MovieDetailPresenter: MovieDetailPresenterInterface {
    func viewDidAppear() {
        guard let movieID = view.movieID else {return}
        self.interactor?.fetchMovieDetail(with: movieID)
    }
}

extension MovieDetailPresenter: MovieDetailOutputProtocol {
    func movieDetailSuccessfulOutput(movie: MovieDetailResponseModel?) {
        guard let movie = movie else {return}
        self.view.fillFields(with: movie)
        AnalyticsHelper.shared.detailScreen(data: movie)
    }
    
    func movieDetailFailureOutput(error: Error?) {
        guard let error = error else {return}
        view.showFailureMessage(error: error)
        AnalyticsHelper.shared.errorLog(error: error)
    }
}
