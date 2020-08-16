//
//  MovieDetailResponseModel.swift
//  Movie
//
//  Created by Varol on 15.08.2020.
//  Copyright © 2020 Varol. All rights reserved.
//

import Foundation

// MARK: - MovieDetailResponseModel
struct MovieDetailResponseModel: Codable {
    let title, year, rated, released: String?
    let runtime, genre, director, writer: String?
    let actors, plot, language, country: String?
    let awards: String?
    let poster: String?
    let ratings: [Rating]?
    let metascore, imdbVotes, imdbID: String?
    let imdbRating: String?
    let type, dvd, boxOffice, production: String?
    let website, response: String?

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case rated = "Rated"
        case released = "Released"
        case runtime = "Runtime"
        case genre = "Genre"
        case director = "Director"
        case writer = "Writer"
        case actors = "Actors"
        case plot = "Plot"
        case language = "Language"
        case country = "Country"
        case awards = "Awards"
        case poster = "Poster"
        case ratings = "Ratings"
        case metascore = "Metascore"
        case imdbRating, imdbVotes, imdbID
        case type = "Type"
        case dvd = "DVD"
        case boxOffice = "BoxOffice"
        case production = "Production"
        case website = "Website"
        case response = "Response"
    }
}

// MARK: - Rating
struct Rating: Codable {
    let source, value: String?

    enum CodingKeys: String, CodingKey {
        case source = "Source"
        case value = "Value"
    }
}
