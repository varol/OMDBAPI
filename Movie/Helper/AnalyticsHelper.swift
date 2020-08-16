//
//  AnalyticsHelper.swift
//  Movie
//
//  Created by Varol on 15.08.2020.
//  Copyright © 2020 Varol. All rights reserved.
//

import Foundation
import Firebase

final class AnalyticsHelper: NSObject {
  
    static var shared = AnalyticsHelper()
    
    func detailScreen(data: MovieDetailResponseModel?){
        guard let title = data?.title else {return}
        guard let rating = data?.imdbRating else {return}
        guard let movieID = data?.imdbID else {return}
        guard let genre = data?.genre else {return}

        Analytics.logEvent("MovieDetailScreen",parameters: ["title": title,
                                                            "rating": rating,
                                                            "movieID": movieID,
                                                            "genre": genre])
    }
    
    func errorLog(error: Error?){
        guard let error = error else {return}
        Analytics.logEvent("error", parameters: ["error" : error.localizedDescription])
    }
}
