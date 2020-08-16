//
//  MovieAPI.swift
//  Movie
//
//  Created by Varol on 13.08.2020.
//  Copyright © 2020 Varol. All rights reserved.
//

import Moya

enum MovieAPI {
    case search(title: String)
    case movieDetail(id: String)
}

extension MovieAPI: TargetType {
    var sampleData: Data {
        return Data()
    }
    
    var baseURL: URL {
        return URL(string: Constants.BaseURL.baseURL)!
    }
    
    var path: String {
        switch self {
        case .search:
            return ""
        case .movieDetail:
            return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .search:
            return .get
        case .movieDetail:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .search:
            return .requestParameters(parameters: parameters, encoding: URLEncoding(destination: .queryString))
        case .movieDetail:
            return .requestParameters(parameters: parameters, encoding: URLEncoding(destination: .queryString))
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var parameters: [String : Any] {
        switch self {
        case .search(let title):
            return [
                "s": title,
            ]
        case .movieDetail(let id):
            return [
                "i": id
            ]
        }
    }
    
}
