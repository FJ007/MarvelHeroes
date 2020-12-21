//
//  MarvelHeroesTests.swift
//  MarvelHeroesTests
//
//  Created by Javier Fernández on 20/12/20.
//

import XCTest
@testable import MarvelHeroes

class MarvelHeroesTests: XCTestCase {

    var data: HeroesTest!
    var collectionHeroesView: HeroesView!
    
    // MARK: - CycleTest
    override func setUpWithError() throws {
        data = HeroesTest()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        collectionHeroesView = try XCTUnwrap(storyboard.instantiateViewController(withIdentifier: "HeroesViewID") as? HeroesView)
        
        collectionHeroesView.loadView()
        collectionHeroesView.viewDidLoad()
    }

    override func tearDownWithError() throws {
        data = nil
        collectionHeroesView = nil
    }
    
    // MARK: - Tests
    /// Verificamos que nuestro array de datos no está vacio
    func testDataJSON() {
        XCTAssertFalse(data.heroes.isEmpty, "Datos no recibidos del servidor")
    }
    
    /// Comprobamos si las rows totales de la collection coinciden con nuestro array de datos
    func testCollectionViewRows() {
        XCTAssertEqual(getTotalRowsCollection(), data.heroes.count, "No coincieden el número de datos (row) de la vista con el modelo")
    }

    // MARK: - Utils
    func getTotalRowsCollection() -> Int {
        collectionHeroesView.collectionView.numberOfItems(inSection: 0)
    }
}
