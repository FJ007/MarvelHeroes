//
//  SearchResult.swift
//  MarvelHeroes
//
//  Created by Javier Fernández on 22/12/20.
//

import Foundation

struct SearchCharacters: Codable {
    let code: Int
    let status: String
    let copyright: String
    let attributionText: String
    let attributionHTML: String
    let etag: String
    let data: DataCharacters
}

struct DataCharacters: Codable {
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [Hero]
}
