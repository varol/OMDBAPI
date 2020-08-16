//
//  Constants.swift
//  Movie
//
//  Created by Varol on 13.08.2020.
//  Copyright © 2020 Varol. All rights reserved.
//

import UIKit

struct Constants {
    
    struct BaseURL {
        static let apiKey: String = "48937341"
        static let baseURL: String = "https://www.omdbapi.com/?apikey=\(apiKey)&"
    }
    
    struct CellIdentifiers {
        static let movieCellId: String = "movieCellId"
    }
    
    struct CellHeight {
        static let movieResultCellHeight: CGFloat = 180.0
    }
    static let noImage = "noImage"
}
