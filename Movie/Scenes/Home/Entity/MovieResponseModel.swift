//
//  MovieResponseModel.swift
//  Movie
//
//  Created by Varol on 13.08.2020.
//  Copyright © 2020 Varol. All rights reserved.
//

import Foundation

// MARK: - MovieResponseModel
struct MovieResponseModel: Codable {
    let totalResults, response: String?
    let search: [MovieItem]?

    enum CodingKeys: String, CodingKey {
        case totalResults
        case response = "Response"
        case search = "Search"
    }
}

// MARK: - SearchItem
struct MovieItem: Codable {
    let year: String?
    let type: String?
    let title, imdbID: String?
    let poster: String?

    enum CodingKeys: String, CodingKey {
        case year = "Year"
        case type = "Type"
        case title = "Title"
        case imdbID
        case poster = "Poster"
    }
}
