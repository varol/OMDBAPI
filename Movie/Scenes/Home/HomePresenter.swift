//
//  HomePresenter.swift
//  CIViperGenerator
//
//  Created by Varol AKSOY on 13.08.2020.
//  Copyright © 2020 Varol AKSOY. All rights reserved.
//

import Foundation

protocol HomePresenterInterface: class {
    func viewDidAppear()
    func numberOfItems() -> Int
    func getMovieData() -> [MovieItem]?
    func searchMovie(with title: String?)
    func didSelectItemAt(row: Int)
}

class HomePresenter {

    unowned var view: HomeViewControllerInterface
    let router: HomeRouterInterface?
    let interactor: HomeInteractorInterface?
    var movieList : [MovieItem]?{
        didSet{
            self.view.reloadData()
        }
    }
    
    init(interactor: HomeInteractorInterface, router: HomeRouterInterface, view: HomeViewControllerInterface) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension HomePresenter: HomePresenterInterface {
    func didSelectItemAt(row: Int) {
        let movieID = movieList?[row].imdbID
        self.router?.showMovieDetail(with: movieID)
    }
    
    func searchMovie(with title: String?) {
        guard let title = title else {return}
        self.interactor?.searchMovie(with: title)
    }
    
    func getMovieData() -> [MovieItem]? {
        return movieList
    }
    
    func numberOfItems() -> Int {
        return self.movieList?.count ?? 0
    }
    
    func viewDidAppear() {
    }
}


extension HomePresenter: HomeInteractorOutputProtocol {
    func searchMovieSuccessfulOutput(movie: [MovieItem]?) {
        self.movieList = movie
    }
    
    func searchMovieFailureOutput(error: Error?) {
        guard let error = error else {return}
        self.view.showFailureMessage(error: error)
    }
}
