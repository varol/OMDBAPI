//
//  HomeInteractor.swift
//  CIViperGenerator
//
//  Created by Varol AKSOY on 13.08.2020.
//  Copyright © 2020 Varol AKSOY. All rights reserved.
//

import Foundation

protocol HomeInteractorInterface: class {
    func searchMovie(with title: String)
}
protocol HomeInteractorOutputProtocol {
    func searchMovieSuccessfulOutput(movie: [MovieItem]?)
    func searchMovieFailureOutput(error: Error?)

}

class HomeInteractor {
    var output: HomeInteractorOutputProtocol?
    fileprivate var movieService: MovieServiceProtocol = MovieService()
}

extension HomeInteractor: HomeInteractorInterface {
    func searchMovie(with title: String) {
        UIHelper.showHUD()
        movieService.movieSearch(title: title) { (result) in
            switch result {
            case .success(let response):
                self.output?.searchMovieSuccessfulOutput(movie: response.search)
            case .failure(let error):
                self.output?.searchMovieFailureOutput(error: error)
            }
            UIHelper.hideHUD()
        }
    }
}
