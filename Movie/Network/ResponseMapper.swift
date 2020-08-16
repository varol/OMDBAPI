//
//  ResponseMapper.swift
//  Movie
//
//  Created by Varol on 14.08.2020.
//  Copyright © 2020 Varol. All rights reserved.
//

import Moya

struct MovieResponseMapper {
    
    static func map<T: Decodable>(_ result: Result<Response, MoyaError>) -> Result<T, MoyaError> {
        switch result {
        case .success(let response):
            do {
                let data = try response.map(T.self)
                return .success(data)
                
            } catch {
                return .failure(MoyaError.requestMapping(error.localizedDescription))
            }
        case .failure(let error):
            return .failure(error)
        }
    }
    
}
