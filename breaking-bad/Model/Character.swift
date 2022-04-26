//
//  Character.swift
//  breaking-bad
//
//  Created by Mohammed Al-Quraini on 4/25/22.
//

import Foundation

struct Character : Codable {
    let img : String
    let name : String
    let occupation : [String]
    let status : String
    let nickname : String
    let appearance : [Int]
}
