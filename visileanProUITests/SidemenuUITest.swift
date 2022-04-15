//
//  SidemenuUITest.swift
//  visileanProUITests
//
//  Created by Visilean Meet on 15/04/22.
//

import XCTest

class SidemenuUITest: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    func test_Sidemenu_RedirectthreAllwpages(){
        
        let app = XCUIApplication()
        app.windows.children(matching: .other).element.tap()
        
        let itemButton = app.navigationBars["Dashboard"].buttons["Item"]
        itemButton.tap()
        itemButton.tap()
        itemButton.tap()
        
        let tablesQuery2 = app.tables
        let dashboardStaticText = tablesQuery2/*@START_MENU_TOKEN@*/.staticTexts["Dashboard"]/*[[".cells.staticTexts[\"Dashboard\"]",".staticTexts[\"Dashboard\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        dashboardStaticText.tap()
        itemButton.tap()
        
        let tablesQuery = tablesQuery2
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["TaskList"]/*[[".cells.staticTexts[\"TaskList\"]",".staticTexts[\"TaskList\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["Task list"].buttons["Item"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["LeaderBoard"]/*[[".cells.staticTexts[\"LeaderBoard\"]",".staticTexts[\"LeaderBoard\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["LeaderBoard"].buttons["Item"].tap()
        dashboardStaticText.tap()
        itemButton.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Sign Out"]/*[[".cells.staticTexts[\"Sign Out\"]",".staticTexts[\"Sign Out\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.alerts["Logout"].scrollViews.otherElements.buttons["CANCEL"].tap()
        itemButton.tap()
        
    }
}
