//
//  NetworkingTests.swift
//  BankeyTests
//
//  Created by Anca Arhip on 21.10.2022.
//

import Foundation

import XCTest

@testable import Bankey

class NetworkingTests: XCTestCase {
    
    func testProfileManagerExpectation() throws {
        let profileManager = ProfileManager()
        let expectation = self.expectation(description: "Profile manager completed asyn task call success completion")
        var receivedProfile: Profile?
        
        
        profileManager.fetchProfile(forUserId: "1") { result in
            switch result {
            case .success(let profile):
                receivedProfile = profile
                expectation.fulfill()
            case .failure(let error):
                XCTFail("Expected profile, got: \(error)")
            }
            
        }
        
        waitForExpectations(timeout: 5)
        
        XCTAssertEqual(receivedProfile!.firstName, "Kevin")
    }
}
