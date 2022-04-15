//
//  LeaderboardUITest.swift
//  visileanProUITests
//
//  Created by Visilean Meet on 15/04/22.
//

import XCTest

class LeaderboardUITest: XCTestCase {
    var app: XCUIApplication!
  
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
    }
    
    func test_Leaderboard10Entrycheck() {
     
        app.launch()
        
        app.tabBars["Tab Bar"].buttons["LeaderBoard"].tap()
        let table = XCUIApplication().tables
        XCTAssertEqual(table.cells.count, 10, "There should be 10 Winner name Entry in leaderboard page")
    }

}
