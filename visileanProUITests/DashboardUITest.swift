//
//  DashboardUITest.swift
//  visileanProUITests
//
//  Created by Visilean Meet on 15/04/22.
//

import XCTest

class DashboardUITest: XCTestCase {
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
    }
    
    func test_DPR6collectioncell() {
        
        app.launch()
            
        
        let collection = XCUIApplication().collectionViews
        XCTAssertEqual(collection.cells.count, 6, "There should be 6 DPR Type")
    }
    
}
