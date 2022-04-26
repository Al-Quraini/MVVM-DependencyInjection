//
//  NetworkManager.swift
//  breaking-bad
//
//  Created by Mohammed Al-Quraini on 4/25/22.
//

import Foundation

public protocol NetworkManagerProtocol  {
    func performRequest<T :Codable>(_ model : T.Type, from url : String,
                                    completion : @escaping (Result<T,NetworkError>) -> Void)
}

public struct NetworkManager : NetworkManagerProtocol {
    
    public func performRequest<T :Codable>(_ model : T.Type, from url : String,
                                    completion : @escaping (Result<T,NetworkError>) -> Void) {
        
        guard let url = URL(string: url) else {
            completion(.failure(.badUrl))
            return
        }
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(.other(error)))
                return
            }
            
            if let safeData = data {
                do {
                    let response = try JSONDecoder().decode(model, from: safeData)
                    completion(.success(response))
                } catch let error {
                    completion(.failure(.other(error)))
                    return
                }
            }
            
        }
        
        task.resume()
        
    }
}
