//
//  AccountSummaryViewControllerTests.swift
//  BankeyTests
//
//  Created by Anca Arhip on 18.10.2022.
//

import Foundation

import XCTest

@testable import Bankey

class AccountSummaryViewControllerTests: XCTestCase {
    
    var vc: AccountSummaryViewController!
    
    var mockManager: MockProfileManager!
    
    class MockProfileManager: ProfileManageable {
        
        var profile: Profile?
        var error: NetworkError?
        
        func fetchProfile(forUserId userId: String, completion: @escaping ((Result<Bankey.Profile, Bankey.NetworkError>) -> Void)) {
            if error != nil {
                completion(.failure(error!))
                return
            }
            profile = Profile(id: "1", firstName: "FirstName", lastName: "LastName")
            completion(.success(profile!))
        }
    }
    
    override func setUp() {
        super.setUp()
        vc = AccountSummaryViewController()
//        vc.loadViewIfNeeded()
        mockManager = MockProfileManager()
        vc.profileManager = mockManager
    }
    
    func testTitleAndMessageForServerError() throws {
        let titleAndMessage = vc.titleandErrorMessageForTesting(for: .decodingError)
        XCTAssertEqual(titleAndMessage.0, "Decoding Error")
        XCTAssertEqual(titleAndMessage.1, "We could not process you request. Please try again")
    }
    
    func testTitleAndMessageForDecodingError() throws {
        let titleAndMessageS = vc.titleandErrorMessageForTesting(for: .serverError)
        XCTAssertEqual(titleAndMessageS.0, "Server Error")
        XCTAssertEqual(titleAndMessageS.1, "Ensure you are connected to the internet. Please try again")
    }
    
    func testAlertForServerError() throws {
        mockManager.error = NetworkError.serverError
        vc.fetchProfileForTesting()
        
        XCTAssertEqual("Server Error", vc.errorAlert.title)
        XCTAssertEqual("Ensure you are connected to the internet. Please try again", vc.errorAlert.message)
    }
    
    func testAlertForDecodingError() throws {
        mockManager.error = NetworkError.decodingError
        vc.fetchProfileForTesting()
        
        XCTAssertEqual("Decoding Error", vc.errorAlert.title)
        XCTAssertEqual("We could not process you request. Please try again", vc.errorAlert.message)
    }
}
