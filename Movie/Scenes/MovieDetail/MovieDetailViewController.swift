//
//  MovieDetailViewController.swift
//  Movie
//
//  Created by Varol on 12.08.2020.
//  Copyright © 2020 Varol. All rights reserved.
//

import UIKit
import Kingfisher

protocol MovieDetailViewControllerInterface: class {
    var movieID : String? { get set }
    func showFailureMessage(error: Error)
    func fillFields(with data: MovieDetailResponseModel?)
}

class MovieDetailViewController: BaseViewController {
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: BaseLabel!
    @IBOutlet weak var movieYearLabel: BaseLabel!
    @IBOutlet weak var releasedLabel: BaseLabel!
    @IBOutlet weak var runtimeLabel: BaseLabel!
    @IBOutlet weak var genreLabel: BaseLabel!
    @IBOutlet weak var plotLabel: BaseLabel!
    @IBOutlet weak var IMDBRatingView: CosmosView!
    
    var presenter: MovieDetailPresenterInterface!
    var movieID: String?

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        presenter.viewDidAppear()
    }
}

extension MovieDetailViewController: MovieDetailViewControllerInterface {
    
    func fillFields(with data: MovieDetailResponseModel?) {
        guard let data = data else {return}
        guard let url = URL(string: data.poster ?? "") else {return}
        self.title = "Detail"
        let processor = RoundCornerImageProcessor(cornerRadius: 15)
        posterImageView.kf.indicatorType = .activity
        posterImageView.kf.setImage(with: url, options: [.processor(processor)])
        posterImageView.hero.id = "posterImage"
        movieTitleLabel.text = data.title
        movieYearLabel.text = data.year
        releasedLabel.text = data.released
        runtimeLabel.text = data.runtime
        genreLabel.text = data.genre
        plotLabel.text = data.plot
        if let imdbRating = Double(data.imdbRating ?? ""){
            IMDBRatingView.rating = imdbRating
        }
        UIHelper.hideHUD()

    }

    func showFailureMessage(error: Error) {
        self.showPopup(title: "", message: error.localizedDescription)
    }
}
