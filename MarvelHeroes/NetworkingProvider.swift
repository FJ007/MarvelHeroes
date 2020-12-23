//
//  NetworkingProvider.swift
//  MarvelHeroes
//
//  Created by Javier Fernández on 21/12/20.
//

import Foundation
import UIKit

final class NetworkinkgProvider {
    
    static let shared = NetworkinkgProvider()
    
    var imageCache = NSCache<AnyObject, AnyObject>()
    let dispatchGroup = DispatchGroup()
    var searchCharacters: SearchCharacters?
    
    func fetchHeroes() {
        if let url = URL(string: DataAPI.getAllHeroesURL()) {
            dispatchGroup.enter()
            loadNetworkData(url: url) { data in
                let dataJSON = try? JSONDecoder().decode(SearchCharacters.self, from: data)
                    if let result = dataJSON {
                        self.searchCharacters = result
                        self.dispatchGroup.leave()
                    }
            }
        } else {
            print("ERROR URL!")
        }
    }
}

extension NetworkinkgProvider {
    
    func loadNetworkData (url: URL, completion: @escaping (Data) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let response = response as? HTTPURLResponse, error == nil else {
                if let error = error {
                    print("ERROR: \(error)")
                }
                return
            }
            if response.statusCode == 200 {
                completion(data)
            } else {
                print("ERROR STATUS: \(response.statusCode)")
            }
        }.resume()
    }
    
    func loadNetworkImage (url: URL, completion: @escaping (UIImage) -> Void) {
        if url.absoluteString.contains("image_not_available") {
            if let image = UIImage(named: "image-not-available") {
                completion(image)
            }
        }
        else {
            if let imageCache = imageCache.object(forKey: url as AnyObject) as? UIImage {
                completion(imageCache)
                return
            }
            loadNetworkData(url: url) { data in
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.imageCache.setObject(image, forKey: url as AnyObject)
                        completion(image)
                    }
                }
            }
        }
    }
}
