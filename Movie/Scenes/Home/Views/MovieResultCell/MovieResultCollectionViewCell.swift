//
//  MovieResultCollectionViewCell.swift
//  Movie
//
//  Created by Varol on 13.08.2020.
//  Copyright © 2020 Varol. All rights reserved.
//

import UIKit
import Kingfisher
import Hero
class MovieResultCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var moviePosterImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: BaseLabel!
    @IBOutlet weak var movieYearLabel: BaseLabel!
    @IBOutlet weak var movieGenreLabel: BaseLabel!
    @IBOutlet weak var movieIMDBIDLabel: BaseLabel!
    @IBOutlet weak var seperatorView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        seperatorView.layer.shadowColor = UIColor.black.cgColor
        seperatorView.layer.shadowOpacity = 1
        seperatorView.layer.shadowOffset = .zero
        seperatorView.layer.shadowRadius = 10
    }

    func configure(with data: MovieItem?){
        guard let data = data else {return}
        movieTitleLabel.text = data.title
        
        
        if let poster = data.poster {
            if poster != "N/A" {
                let url = URL(string: poster)
                let processor = RoundCornerImageProcessor(cornerRadius: 30)
                moviePosterImageView.kf.indicatorType = .activity
                moviePosterImageView.kf.setImage(with: url, placeholder: UIImage(named: Constants.noImage), options: [.processor(processor)])
            } else {
                moviePosterImageView.image = UIImage(named: Constants.noImage)
            }
        }
        moviePosterImageView.hero.id = "posterImage"
        movieYearLabel.text = data.year
        movieGenreLabel.text = data.type?.capitalized
        movieIMDBIDLabel.text = data.imdbID
    }
}
