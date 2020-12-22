//
//  Series.swift
//  MarvelHeroes
//
//  Created by Javier Fernández on 22/12/20.
//

import Foundation

struct Series: Codable {
    let available: Int
    let collectionURL: String
    let items: [SerieItem]
    let returned: Int
    
    enum CodingKeys: String, CodingKey {
        case available
        case collectionURL = "collectionURI"
        case items
        case returned
    }
}

struct SerieItem: Codable {
    let url: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case url = "resourceURI"
        case name
    }
}
