//
//  MarvelDataAPI.swift
//  MarvelHeroes
//
//  Created by Javier Fernández on 21/12/20.
//

import Foundation

// https://developer.marvel.com/documentation/authorization

struct DataAPI {
    static let mainURL = "https://gateway.marvel.com:443/v1/public/characters"
    static let ts = "1"
    static let apiKey = "9fbf6495c4d40b6b81df06bf92f12ca1"
    static let hash = "76ef495656a227983ebed502bab079e9"
    
    // MARK: - Funcs
    static func getAllHeroesURL() -> String {
        "\(DataAPI.mainURL)?ts=\(DataAPI.ts)&apikey=\(DataAPI.apiKey)&hash=\(DataAPI.hash)"
    }
}

