//
//  Stories.swift
//  MarvelHeroes
//
//  Created by Javier Fernández on 22/12/20.
//

import Foundation

struct Stories: Codable {
    let available: Int
    let collectionURL: String
    let items: [StoryItem]
    let returned: Int
    
    enum CodingKeys: String, CodingKey {
        case available
        case collectionURL = "collectionURI"
        case items
        case returned
    }
}

struct StoryItem: Codable {
    let url: String
    let name: String
    let type: ItemType
    
    enum CodingKeys: String, CodingKey {
        case url = "resourceURI"
        case name
        case type
    }
}

enum ItemType: String, Codable {
    case empty = ""
    case cover = "cover"
    case interiorStory = "interiorStory"
}
