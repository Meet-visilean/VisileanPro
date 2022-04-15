//
//  LoginvalidationTest.swift
//  visileanProTests
//
//  Created by Visilean Meet on 06/04/22.
//

import XCTest
@testable import visileanPro
class LoginvalidationTest: XCTestCase {

    func test_LoginValidation_With_EmptyStrings_Returns_ValidationFailure(){

            // ARRANGE
            let validation = LoginValidation()
            let request = LoginRequest(email: "", password: "")

            // ACT
        let result = validation.checkValidation(loginrequest: request)

            // ASSERT
            XCTAssertFalse(result.result)
            XCTAssertNotNil(result.message)
            XCTAssertEqual(result.message, "Please enter email")

        }
    
    func test_LoginValidation_With_email_Returns_validEmailenter(){

            // ARRANGE
            let validation = LoginValidation()
            let request = LoginRequest(email: "mewqet", password: "")

            // ACT
        let result = validation.checkValidation(loginrequest: request)

            // ASSERT
            XCTAssertFalse(result.result)
            XCTAssertNotNil(result.message)
            XCTAssertEqual(result.message, "Please enter valid email")

        }
    
    func test_LoginValidation_With_password_Returns_ValidationFailure(){

            // ARRANGE
            let validation = LoginValidation()
            let request = LoginRequest(email: "shingala@gmail.com", password: "")

            // ACT
        let result = validation.checkValidation(loginrequest: request)

            // ASSERT
            XCTAssertFalse(result.result)
            XCTAssertNotNil(result.message)
            XCTAssertEqual(result.message, "Please enter password")

        }
    
    func test_LoginValidation_With_properemailandpass_Returns_DONE(){

            // ARRANGE
            let validation = LoginValidation()
            let request = LoginRequest(email: "shingala@gmail.com", password: "123")

            // ACT
        let result = validation.checkValidation(loginrequest: request)

            // ASSERT
            XCTAssertTrue(result.result)
            XCTAssertNotNil(result.message)
            XCTAssertEqual(result.message, "valid id and pass")

        }

}
