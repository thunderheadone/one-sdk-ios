//
//  Dynamic_Initialization_ExampleUITests.swift
//  Dynamic Initialization ExampleUITests
//
//  Created by Alex Nguyen on 2/13/20.
//  Copyright © 2020 Thunderhead One Inc. All rights reserved.
//

import XCTest

class Dynamic_Initialization_ExampleUITests: XCTestCase {
    let app = XCUIApplication()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
    
        app.launch()
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDynamicRegionSelection() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let selectButton = app.buttons["SELECT"]
        var changeButton = app.buttons["CHANGE"]
        
        if (selectButton.exists) {
            selectButton.tap()
        } else {
            changeButton.tap()
        }
        
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["United States"]/*[[".cells.staticTexts[\"United States\"]",".staticTexts[\"United States\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        changeButton = app.buttons["CHANGE"]
        changeButton.tap()
        XCTAssertTrue(app.staticTexts["United States"].exists)
        
        tablesQuery.staticTexts["United Kingdom"].tap()
        changeButton.tap()
        XCTAssertTrue(app.staticTexts["United Kingdom"].exists)
        
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Europe"]/*[[".cells.staticTexts[\"Europe\"]",".staticTexts[\"Europe\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssertTrue(app.staticTexts["Europe"].exists)
    }
    
}
