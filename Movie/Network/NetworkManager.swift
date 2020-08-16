//
//  NetworkManager.swift
//  Movie
//
//  Created by Varol on 12.08.2020.
//  Copyright © 2020 Varol. All rights reserved.
//

import Foundation
import Moya
import Alamofire

enum Results<T> {
    case success(T)
    case failure(Error)
}

class NetworkManager {
    static let shared = NetworkManager()
    let reachabilityManager = NetworkReachabilityManager()?.isReachable
    
    func isConnectedToInternet() -> Bool {
        return reachabilityManager ?? false
    }
    
    private static let provider = MoyaProvider<MovieAPI>(plugins: [])
    
    @discardableResult
    public static func request(target: MovieAPI,  completion: @escaping (Result<Response, MoyaError>) -> Void ) -> Cancellable  {
        
        provider.request(target) { result in
            
            switch result {
            case .success(let response):
                
                do {
                    let filteredResponse = try response.filterSuccessfulStatusCodes()
                    completion(.success(filteredResponse))
                } catch  {
                    completion(.failure(MoyaError.underlying(error, response)))
                }
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

}
