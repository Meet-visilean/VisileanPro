//
//  SlideUITest.swift
//  visileanProUITests
//
//  Created by Visilean Meet on 15/04/22.
//

import XCTest

class SlideUITest: XCTestCase {
        var app: XCUIApplication!
        
        override func setUp() {
            super.setUp()
            continueAfterFailure = false
            app = XCUIApplication()
        }
        
        func testSwiping() {
            app.launch()
           
            
            app.tabBars["Tab Bar"].buttons["task list"].tap()
            let isDisplayingOnboarding = app.navigationBars["Task list"].staticTexts["Task list"].exists
                                    
            XCTAssertTrue(isDisplayingOnboarding)
          
            for staticText in  app.staticTexts.allElementsBoundByIndex{

                       if staticText != nil{
                           print(staticText.label)
                       }else{
                           print("No static text found")
                       }

                   }
            XCTAssertTrue(app.staticTexts["All Task"].exists)
            app.swipeLeft()
            
            app.terminate()
        }
    

}
