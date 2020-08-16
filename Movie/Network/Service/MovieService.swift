//
//  MovieService.swift
//  Movie
//
//  Created by Varol on 13.08.2020.
//  Copyright © 2020 Varol. All rights reserved.
//

import Moya

protocol MovieServiceProtocol {
    func movieSearch(title: String, completion: @escaping (Result<MovieResponseModel, MoyaError>)->Void )
    func movieDetail(movieID: String, completion: @escaping (Result<MovieDetailResponseModel, MoyaError>)-> Void)
}

struct MovieService: MovieServiceProtocol {
    func movieDetail(movieID: String, completion: @escaping (Result<MovieDetailResponseModel, MoyaError>) -> Void) {
        NetworkManager.request(target: .movieDetail(id: movieID)) { (result) in
            completion(MovieResponseMapper.map(result))
        }
    }
    
    func movieSearch(title: String, completion: @escaping (Result<MovieResponseModel, MoyaError>) -> Void) {
        NetworkManager.request(target: .search(title: title)) { (result) in
            completion(MovieResponseMapper.map(result))
        }
    }
}
