//
//  MarvelHeroesUITests.swift
//  MarvelHeroesUITests
//
//  Created by Javier Fernández on 20/12/20.
//

import XCTest

class MarvelHeroesUITests: XCTestCase {

    var app = XCUIApplication()
    
    // MARK: - CycleTest
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {
        
    }

    // MARK: - Test
    /// Comprobamos que la app arranca y carga el primer navigationBar y el collectionView
    func testRunApp() {
        XCTAssert(app.navigationBars["InitAppListHeroesNavBar"].exists)
        XCTAssert(app.collectionViews["InitAppCollectionView"].exists)
    }
    
    /// Comprobamos los datos entre celdas de la collectionView no estén duplicados
    func testDuplicatedData() {
        XCTAssert(app.navigationBars["InitAppListHeroesNavBar"].exists)
        let collectionView = app.collectionViews["InitAppCollectionView"]
        XCTAssert(collectionView.exists)
        
        let cell1 = collectionView.cells.staticTexts.firstMatch
        collectionView.swipeUp()
        collectionView.swipeUp()
        let cell2 = collectionView.cells.staticTexts.firstMatch
        
        XCTAssertNotEqual(cell1, cell2, "Datos duplicados en la colectionView")
    }
    
    /// Comprobamos el flujo entre vistas de la app
    func testFlowBetweenViews() {
        XCTAssert(app.navigationBars["InitAppListHeroesNavBar"].exists)
        let collectionView = app.collectionViews["InitAppCollectionView"]
        let cell = collectionView.cells.firstMatch
        cell.tap()
        let closeButton = app.buttons["ButtonCloseHeroDetailView"]
        XCTAssert(closeButton.exists)
        closeButton.tap()
        XCTAssert(app.navigationBars["InitAppListHeroesNavBar"].exists)
    }

//    func testLaunchPerformance() throws {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTApplicationLaunchMetric()]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
}
