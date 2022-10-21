//
//  PasswordTests.swift
//  PasswordTests
//
//  Created by Anca Arhip on 19.10.2022.
//

import XCTest
@testable import Password

final class PasswordLengthCriteriaTests: XCTestCase {

    func testShort() throws {
        XCTAssertFalse(PasswordCriteria.lengthCriteraMet("123456"))
    }

    func testLong() throws {
        XCTAssertFalse(PasswordCriteria.lengthCriteraMet("1234567890123456789012345678901234567"))
    }
    
    func testValidShort() throws {
        XCTAssertTrue(PasswordCriteria.lengthCriteraMet("12345678"))
    }
    
    func testValidLong() throws {
        XCTAssertTrue(PasswordCriteria.lengthCriteraMet("12345678901234567890123456789012"))
    }
}

final class PasswordOtherCriteriaTests {
    func testNoSpaceMet() throws {
        XCTAssertTrue(PasswordCriteria.noSpaceCriteriaMet("asd"))
    }
    func testNoSpaceNotMet() throws {
        XCTAssertTrue(PasswordCriteria.noSpaceCriteriaMet("as d"))
    }
}
