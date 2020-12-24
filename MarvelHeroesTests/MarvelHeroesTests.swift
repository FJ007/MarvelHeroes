//
//  MarvelHeroesTests.swift
//  MarvelHeroesTests
//
//  Created by Javier Fernández on 20/12/20.
//

import XCTest
@testable import MarvelHeroes

class MarvelHeroesTests: XCTestCase {

    var collectionHeroesView: HeroesView!
    
    // MARK: - Lifecycle
    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        collectionHeroesView = try XCTUnwrap(storyboard.instantiateViewController(withIdentifier: "HeroesViewID") as? HeroesView)
        
        collectionHeroesView.loadView()
        collectionHeroesView.viewDidLoad()
    }

    override func tearDownWithError() throws {
        collectionHeroesView = nil
    }
    
    // MARK: - Tests
    func testDataJSON() {
        var charactersResult: SearchCharacters?
        let expectative = expectation(description: "Solicitud de datos JSON al servidor")
        
        if let url = URL(string: DataAPI.getAllHeroesURL()) {
            NetworkingProvider.shared.loadNetworkData(url: url) { data in
                let dataJSON = try? JSONDecoder().decode(SearchCharacters.self, from: data)
                if let result = dataJSON {
                    charactersResult = result
                    expectative.fulfill()
                }
            }
            waitForExpectations(timeout: 3, handler: nil)
            
            let characters = try? XCTUnwrap(charactersResult)
            if let characters = characters {
                XCTAssertFalse(characters.data.results.isEmpty, "Datos no recibidos del servidor")
                XCTAssertEqual(getTotalRowsCollection(), characters.data.results.count, "No coincieden nº items de la collectionView con los datos JSON")
            }
        }
    }

    // MARK: - Utils
    func getTotalRowsCollection() -> Int {
        collectionHeroesView.collectionView.numberOfItems(inSection: 0)
    }
}
