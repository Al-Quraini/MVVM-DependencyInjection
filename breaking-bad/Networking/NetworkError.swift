//
//  NetworkError.swift
//  breaking-bad
//
//  Created by Mohammed Al-Quraini on 4/25/22.
//

import Foundation

public enum NetworkError : Error, LocalizedError {
    case badUrl
    case other(Error)
    
    public var errorDescription : String? {
        switch self {
        case .badUrl :
            return "Bad Url"
            
        case .other(let error) :
            return error.localizedDescription
        }
    }
}
