//
//  AlertTableUIKitTests.swift
//  AlertTableUIKitTests
//
//  Created by Anca Arhip on 07.11.2022.
//

import XCTest
@testable import AlertTableUIKit

final class AlertTableUIKitTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAlertsProviderExpectation() throws {
        
        let alertsProvider = AlertsProvider()
        let expectation = self.expectation(description: "Alerts provider completed download with success")
        var alerts: [Alert] = []
        
        alertsProvider.getAlerts { result in
            switch result {
            case .success(let received):
                expectation.fulfill()
                alerts = received
            case .failure(let error):
                XCTFail("Expected alerts, got: \(error)")
            }
        
        }
        
        waitForExpectations(timeout: 5)
        
        XCTAssert(alerts.count != 0)
        
    }

}
