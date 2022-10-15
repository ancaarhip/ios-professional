//
//  CurrencyFormatterTests.swift
//  BankeyTests
//
//  Created by Anca Arhip on 16.10.2022.
//

import Foundation
import XCTest

@testable import Bankey

class Test: XCTestCase {
    
    var formatter: CurrencyFormatter!
    
    override func setUp() {
        super.setUp()
        formatter = CurrencyFormatter()
    }
    
    func testBreakDollarsIntoCents() throws {
        let result = formatter.breakIntoDollarsAccount(929466.23)
        XCTAssertEqual(result.0, "929,466")
        XCTAssertEqual(result.1, "23")
    }
    
    func testDollarsFormatted() throws {
        let result = formatter.dollarsFormatted(1234.45)
        XCTAssertEqual("$1,234.45", result)
    }
    
    func testZeroDollarsFormatted() throws {
        let result = formatter.dollarsFormatted(0.0)
        XCTAssertEqual("$0.00", result)
    }
}
