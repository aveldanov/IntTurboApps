//
//  Practice2AppUITests.swift
//  Practice2AppUITests
//
//  Created by Veldanov, Anton on 4/19/21.
//

import XCTest

class Practice2AppUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDetailedViewOpens_WhenCellClicked() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let myTable = app.tables.matching(identifier: "table")
        
        myTable.cells.element(matching: .cell, identifier: "cell0").tap()
        
        
        XCTAssert(app.otherElements["detailedView"].exists)


    }


}
