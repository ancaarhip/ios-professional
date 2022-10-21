//
//  PasswordStatusViewTest.swift
//  PasswordTests
//
//  Created by Anca Arhip on 21.10.2022.
//

import XCTest

@testable import Password

final class PasswordStatusViewTest_Inline_Validation: XCTestCase {
    
    var statusView: PasswordStatusView!
    let validPassword = "34324234"
    let shortPassword = "asd"
    
    override func setUp() {
        super.setUp()
        
        statusView = PasswordStatusView()
        statusView.shouldResetCriteria = true
    }
    
    func testValidPassword() throws {
        statusView.updateDisplay(validPassword)
        XCTAssertTrue(statusView.lengthCriteriaView.isCriteriaMet)
        XCTAssertTrue(statusView.lengthCriteriaView.isCheckMarkImage)
    }
    
    func testTooShort() throws {
        statusView.updateDisplay(shortPassword)
        XCTAssertFalse(statusView.lengthCriteriaView.isCriteriaMet)
        XCTAssertTrue(statusView.lengthCriteriaView.isResetImage)
    }
}

final class PasswordStatusViewTest_Final_Validation: XCTestCase {
    
    var statusView: PasswordStatusView!
    let validPassword = "34324234"
    let shortPassword = "asd"
    
    override func setUp() {
        super.setUp()
        
        statusView = PasswordStatusView()
        statusView.shouldResetCriteria = false
    }
    
    func testValidPassword() throws {
        statusView.updateDisplay(validPassword)
        XCTAssertTrue(statusView.lengthCriteriaView.isCriteriaMet)
        XCTAssertTrue(statusView.lengthCriteriaView.isCheckMarkImage)
    }
    
    func testTooShort() throws {
        statusView.updateDisplay(shortPassword)
        XCTAssertFalse(statusView.lengthCriteriaView.isCriteriaMet)
        XCTAssertTrue(statusView.lengthCriteriaView.isXmarkImage)
    }
}

final class PasswordStatusView_Three_Or_Four_Validation: XCTestCase {
    var statusView: PasswordStatusView!
    
    let validPassword = "Asdfg@d23"
    let noUppercase = "asdfg@d23"
    let noLowercase = "ASDFG@D23"
    let twoCriteria = "asdfg@ddd"

    override func setUp() {
        super.setUp()
        statusView = PasswordStatusView()
    }
    
    func testValidPassword() throws {
        XCTAssertTrue(statusView.validate(validPassword))
    }
    func testNoUppercasePassword() throws {
        XCTAssertTrue(statusView.validate(noLowercase))
    }
    func testTwoCriteriaPassword() throws {
        XCTAssertFalse(statusView.validate(twoCriteria))
    }
}
