//
//  FakeNetworkManager.swift
//  breaking-bad-mock
//
//  Created by Mohammed Al-Quraini on 4/25/22.
//

import Foundation
import breaking_bad

public struct FakeNetworkManager : NetworkManagerProtocol {
    
    var data : Data?
    var error: NetworkError?
    
    public func performRequest<T :Codable>(_ model : T.Type, from url : String,
                                           completion : @escaping (Result<T,NetworkError>) -> Void) {
        
        if let data = data {
                    
                    do {
                        let response = try JSONDecoder().decode(model, from: data)
                        completion(.success(response))
                    } catch  {
                        completion(.failure(.other(error)))
                    }
                    
                }
                
                if let error = error {
                    completion(.failure(.other(error)))
                }
    }
    
}
