//
//  MovieDetailInteractor.swift
//  CIViperGenerator
//
//  Created by Varol AKSOY on 12.08.2020.
//  Copyright © 2020 Varol AKSOY. All rights reserved.
//

import Foundation

protocol MovieDetailInteractorInterface: class {
    func fetchMovieDetail(with movieID: String)
}

protocol MovieDetailOutputProtocol {
    func movieDetailSuccessfulOutput(movie: MovieDetailResponseModel?)
    func movieDetailFailureOutput(error: Error?)
}

class MovieDetailInteractor {
    var output: MovieDetailOutputProtocol?
    fileprivate var movieService: MovieServiceProtocol = MovieService()
}

extension MovieDetailInteractor: MovieDetailInteractorInterface {
    func fetchMovieDetail(with movieID: String) {
        UIHelper.showHUD()
        movieService.movieDetail(movieID: movieID) { (result) in
            switch result {
            case .success(let response):
                self.output?.movieDetailSuccessfulOutput(movie: response)
            case .failure(let error):
                self.output?.movieDetailFailureOutput(error: error)
            }
        }
    }
}
