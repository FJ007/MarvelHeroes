//
//  MarvelHeroesTests.swift
//  MarvelHeroesTests
//
//  Created by Javier Fernández on 20/12/20.
//

import XCTest
@testable import MarvelHeroes

class MarvelHeroesTests: XCTestCase {

    var characters: SearchCharacters!
    var collectionHeroesView: HeroesView!
    
    // MARK: - Lifecycle
    override func setUpWithError() throws {
        characters = try XCTUnwrap(NetworkinkgProvider.shared.searchCharacters)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        collectionHeroesView = try XCTUnwrap(storyboard.instantiateViewController(withIdentifier: "HeroesViewID") as? HeroesView)
        
        collectionHeroesView.loadView()
        collectionHeroesView.viewDidLoad()
    }

    override func tearDownWithError() throws {
        characters = nil
        collectionHeroesView = nil
    }
    
    // MARK: - Tests
    /// Verificamos que nuestro array de datos no está vacio
    func testDataJSON() {
        XCTAssertFalse(characters.data.results.isEmpty, "Datos no recibidos del servidor")
    }
    
    /// Comprobamos si las rows totales de la collection coinciden con nuestro array de datos
    func testCollectionViewRows() {
        XCTAssertEqual(getTotalRowsCollection(), characters.data.results.count, "No coincieden el número de datos (row) de la vista con el modelo")
    }

    // MARK: - Utils
    func getTotalRowsCollection() -> Int {
        collectionHeroesView.collectionView.numberOfItems(inSection: 0)
    }
}
