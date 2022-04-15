//
//  LoginUITEST.swift
//  visileanProUITests
//
//  Created by Visilean Meet on 15/04/22.
//

import XCTest

class LoginUITEST: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
        XCUIApplication().launch()

    }
    func login_Test1(){
        
        
        let app = XCUIApplication()
        let enterUsernameTextField = app.textFields["Enter UserName"]
        enterUsernameTextField.tap()
        enterUsernameTextField.typeText("meet.shingala@visilean.com")
        let passTF = app.secureTextFields["Enter Password"]
        passTF.tap()
        passTF.typeText("Enter password UI_test")
        
        
        app.toolbars["Toolbar"].buttons["Done"].tap()
        
        app.buttons.containing(.staticText, identifier:"Next").element.tap()
        
    }

}
