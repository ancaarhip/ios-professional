//
//  AccountTest.swift
//  BankeyTests
//
//  Created by Anca Arhip on 18.10.2022.
//

import Foundation

import XCTest

@testable import Bankey

class AccountTest: XCTestCase {
    
    override class func setUp() {
        super.setUp()
    }
    
    func testCanParseAccounts() throws {
        let json = """
         [
           {
             "id": "1",
             "type": "Banking",
             "name": "Basic Savings",
             "amount": 929466.23,
             "createdDateTime" : "2010-06-21T15:29:32Z"
           },
           {
             "id": "2",
             "type": "Banking",
             "name": "No-Fee All-In Chequing",
             "amount": 17562.44,
             "createdDateTime" : "2011-06-21T15:29:32Z"
           },
          ]
        """
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        let accounts = try! decoder.decode([Account].self, from: json.data(using: .utf8)!)
        
        XCTAssertEqual(accounts.count, 2)
        
        let expectedAccounts = [
            Account(id: "1", type: .Banking, name: "Basic Savings", amount: 929466.23, createdDateTime: try! Date("2010-06-21T15:29:32Z", strategy: .iso8601)),
            Account(id: "2", type: .Banking, name: "No-Fee All-In Chequing", amount: 17562.44, createdDateTime: try! Date("2011-06-21T15:29:32Z", strategy: .iso8601))
        ]
        
        for i in 0..<accounts.count {
            XCTAssertEqual(accounts[i].id, expectedAccounts[i].id)
            XCTAssertEqual(accounts[i].type, expectedAccounts[i].type)
            XCTAssertEqual(accounts[i].name, expectedAccounts[i].name)
            XCTAssertEqual(accounts[i].amount, expectedAccounts[i].amount)
            XCTAssertEqual(accounts[i].createdDateTime, expectedAccounts[i].createdDateTime)
        }
    }
}
