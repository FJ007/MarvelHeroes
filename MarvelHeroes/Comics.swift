//
//  Comics.swift
//  MarvelHeroes
//
//  Created by Javier Fernández on 22/12/20.
//

import Foundation

struct Comics: Codable {
    let available: Int
    let collectionURI: String
    let items: [ComicItem]
    let returned: Int
}

struct ComicItem: Codable {
    let url: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case url = "resourceURI"
        case name
    }
}
