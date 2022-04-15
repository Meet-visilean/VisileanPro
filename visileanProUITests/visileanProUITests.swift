//
//  visileanProUITests.swift
//  visileanProUITests
//
//  Created by Visilean Meet on 02/02/22.
//

import XCTest

class visileanProUITests: XCTestCase {
    var app: XCUIApplication!
    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    func test1_checkTabbar() {
        
        let tabBar = XCUIApplication().tabBars["Tab Bar"]
        let taskListButton = tabBar.buttons["task list"]
        taskListButton.tap()
        taskListButton.tap()
        
        let leaderboardButton = tabBar.buttons["LeaderBoard"]
        leaderboardButton.tap()
        
        let dashboardButton = tabBar.buttons["dashboard"]
        dashboardButton.tap()
        leaderboardButton.tap()
        leaderboardButton.tap()
        leaderboardButton.tap()
        taskListButton.tap()
        taskListButton.tap()
        taskListButton.tap()
        dashboardButton.tap()
        dashboardButton.tap()
        dashboardButton.tap()
        dashboardButton.tap()
        taskListButton.tap()
        leaderboardButton.tap()
        taskListButton.tap()
        dashboardButton.tap()
        leaderboardButton.tap()
        taskListButton.tap()
        dashboardButton.tap()
        
    }
    func test2_Tasklist_chekdetailsoftask(){
        
        let app = XCUIApplication()
        app.tabBars["Tab Bar"].buttons["task list"].tap()
        app.collectionViews/*@START_MENU_TOKEN@*/.tables.staticTexts["Data Hall A 5.00.A.19"]/*[[".cells.tables",".cells.staticTexts[\"Data Hall A 5.00.A.19\"]",".staticTexts[\"Data Hall A 5.00.A.19\"]",".tables"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["< shingala"]/*[[".buttons[\"< shingala\"].staticTexts[\"< shingala\"]",".staticTexts[\"< shingala\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        app.collectionViews.tables.staticTexts["Test-Task"].tap()
        app.staticTexts["< Test-Task"].tap()
        
        app.collectionViews.tables.staticTexts["task new offline"].tap()
        app.staticTexts["< task new offline"].tap()
    }
    

 
    func test6_Tasklist_slide(){
        
        
        let app = XCUIApplication()
        let taskListButton = app.tabBars["Tab Bar"].buttons["task list"]
        taskListButton.tap()
        app.tabBars["Tab Bar"].buttons["task list"].tap()
        
        let collectionViewsQuery = app.collectionViews
        XCUIApplication().windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .collectionView).element/*@START_MENU_TOKEN@*/.staticTexts["Ready"]/*[[".cells.staticTexts[\"Ready\"]",".staticTexts[\"Ready\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        app.collectionViews/*@START_MENU_TOKEN@*/.tables.staticTexts["Data Hall A 5.00.A.19"]/*[[".cells.tables",".cells.staticTexts[\"Data Hall A 5.00.A.19\"]",".staticTexts[\"Data Hall A 5.00.A.19\"]",".tables"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/.tap()
        app.staticTexts["< shingala"].tap()
        collectionViewsQuery/*@START_MENU_TOKEN@*/.staticTexts["In progress"]/*[[".cells.staticTexts[\"In progress\"]",".staticTexts[\"In progress\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        let rejectedStaticText = collectionViewsQuery/*@START_MENU_TOKEN@*/.staticTexts["Rejected"]/*[[".cells.staticTexts[\"Rejected\"]",".staticTexts[\"Rejected\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        rejectedStaticText.tap()
        collectionViewsQuery/*@START_MENU_TOKEN@*/.staticTexts["Quality Check"]/*[[".cells.staticTexts[\"Quality Check\"]",".staticTexts[\"Quality Check\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        rejectedStaticText.tap()
        collectionViewsQuery/*@START_MENU_TOKEN@*/.staticTexts["In progress"]/*[[".cells.staticTexts[\"In progress\"]",".staticTexts[\"In progress\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        collectionViewsQuery/*@START_MENU_TOKEN@*/.staticTexts["Ready"]/*[[".cells.staticTexts[\"Ready\"]",".staticTexts[\"Ready\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        collectionViewsQuery/*@START_MENU_TOKEN@*/.staticTexts["Make Ready"]/*[[".cells.staticTexts[\"Make Ready\"]",".staticTexts[\"Make Ready\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        collectionViewsQuery/*@START_MENU_TOKEN@*/.staticTexts["All Task"]/*[[".cells.staticTexts[\"All Task\"]",".staticTexts[\"All Task\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        collectionViewsQuery/*@START_MENU_TOKEN@*/.tables.staticTexts["shingala"]/*[[".cells.tables",".cells.staticTexts[\"shingala\"]",".staticTexts[\"shingala\"]",".tables"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["< shingala"]/*[[".buttons[\"< shingala\"].staticTexts[\"< shingala\"]",".staticTexts[\"< shingala\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        
    }
    
    
}
