//
//  VIewControllerTests.swift
//  PasswordTests
//
//  Created by Anca Arhip on 21.10.2022.
//

import Foundation

import XCTest

@testable import Password

class VIewControllerTests_NewPassword_Validation: XCTestCase {
    
    var vc: ViewController!
    
    let validPassword = "Asdf123@"
    let shortPassword = "Asdf12@"
    let invalidPassword = "Asdf123@-"
    
    override func setUp() {
        super.setUp()
        vc = ViewController()
        vc.loadViewIfNeeded()
    }
    
    func testEmptyPassword() throws {
        vc.newPasswordText = ""
        vc.resetPasswordButtonTapped(sender: UIButton())
        XCTAssertEqual(vc.newPasswordTextField.errorLabel.text, "Enter your password")
    }
    
    func testCriteriaNotMet() throws {
        vc.newPasswordText = shortPassword
        vc.resetPasswordButtonTapped(sender: UIButton())
        XCTAssertEqual(vc.newPasswordTextField.errorLabel.text, "Your password must meet the requirements below")
    }
    
    func testInvalidCriteria() throws {
        vc.newPasswordText = invalidPassword
        vc.resetPasswordButtonTapped(sender: UIButton())
        XCTAssertEqual(vc.newPasswordTextField.errorLabel.text, "Enter valid chars with no spaces")
    }
}

final class ViewController_ConfirmPassword_Validation: XCTestCase {
    var vc: ViewController!
    let validPassword = "Asdf123@"
    let confirmPasswordNoMatch = "Asdf123@1"
    
    override func setUp(){
        super.setUp()
        vc = ViewController()
    }
    
    func testPasswordMatch() throws {
        vc.newPasswordText = validPassword
        vc.confirmPasswordText = validPassword
        XCTAssertEqual(vc.confirmPasswordTextField.errorLabel.text, "")
    }
    
    func testPasswordNoMatch() throws {
        vc.newPasswordText = validPassword
        vc.confirmPasswordText = confirmPasswordNoMatch
        vc.resetPasswordButtonTapped(sender: UIButton())
        XCTAssertEqual(vc.confirmPasswordTextField.errorLabel.text, "Passwords do not match")
    }
}


class ViewControllerTests_Alert: XCTestCase {
    var vc: ViewController!
    
    let validPassword = "Asdf123@"
    let shortPassword = "Asdf12@"
    
    override func setUp() {
        super.setUp()
        
        vc = ViewController()
    }
    
    func testSuccessAlert() throws {
        vc.newPasswordText = validPassword
        vc.confirmPasswordText = validPassword
        vc.resetPasswordButtonTapped(sender: UIButton())
        
        XCTAssertNotNil(vc.alert)
    }
    
    func testShowError() throws {
        vc.newPasswordText = validPassword
        vc.confirmPasswordText = shortPassword
        vc.resetPasswordButtonTapped(sender: UIButton())
        
        XCTAssertNil(vc.alert)
    }
}
