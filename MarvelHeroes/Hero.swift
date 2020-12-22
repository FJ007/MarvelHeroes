//
//  Hero.swift
//  MarvelHeroes
//
//  Created by Javier Fernández on 21/12/20.
//

import Foundation

struct Hero: Codable {
    let id: Int
    let name: String
    let description: String
    let modified: String
    let thumbnail: Thumbnail
    let resourceURI: String
    let comics: Comics
    let series: Series
    let stories: Stories
    let events: Events
    let urls: [ExternalURLs]
}

// MARK: - Thumbnail
struct Thumbnail: Codable {
    let path: String
    let extensionImage: Extension
    
    enum CodingKeys: String, CodingKey {
        case path
        case extensionImage = "extension"
    }
    
    func getImageURL() -> String {
        "\(path).\(extensionImage)"
    }
}

enum Extension: String, Codable {
    case gif = "gif"
    case jpg = "jpg"
}

// MARK: - ExternalURLs
struct ExternalURLs: Codable {
    let type: URLType
    let url: String
}

enum URLType: String, Codable {
    case detail
    case wiki
    case comiclink
}

