//
//  Practice3AppUITests.swift
//  Practice3AppUITests
//
//  Created by Veldanov, Anton on 4/20/21.
//

import XCTest

class Practice3AppUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let table = app.tables.matching(identifier: "table")
        let cell = table.cells.element(matching: .cell, identifier: "cell0")
        
        cell.tap()
        
        
sleep(5)
        
        XCTAssert(app.otherElements["detailedView"].exists)
        
        sleep(5)

    }
}
