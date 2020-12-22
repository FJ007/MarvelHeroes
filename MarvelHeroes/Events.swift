//
//  Events.swift
//  MarvelHeroes
//
//  Created by Javier Fernández on 22/12/20.
//

import Foundation

struct Events: Codable {
    let available: Int
    let collectionURI: String
    let items: [EventItem]
    let returned: Int
}

struct EventItem: Codable {
    let url: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case url = "resourceURI"
        case name
    }
}
