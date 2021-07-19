//
//  RomanNumeralsTests.swift
//  RomanNumeralsTests
//
//  Created by Kevin Desai on 7/19/21.
//

import XCTest
@testable import RomanNumerals

class RomanNumeralsTests: XCTestCase {
    
    let controller = RomanNumeralController()
    
    func testMaxValue() {
        let value = "99999"
        controller.convertToRomanNumeral(for: value) { (retVal, err) in
            XCTAssertNil(err)
            XCTAssertNotNil(retVal)
        }
    }
    
    func testDecimalValue() {
        let value = "9.99"
        controller.convertToRomanNumeral(for: value) { (retVal, err) in
            XCTAssertNil(err)
            XCTAssertNotNil(retVal)
            XCTAssertEqual(retVal, "IX")
        }
    }
    
    func testInvalidValue() {
        let value = "badf00d"
        controller.convertToRomanNumeral(for: value) { (retVal, err) in
            XCTAssertNotNil(err)
            XCTAssertNil(retVal)
        }
    }
    
    func testValueWithComma() {
        let value = "1,000"
        controller.convertToRomanNumeral(for: value) { (retVal, err) in
            XCTAssertNil(err)
            XCTAssertNotNil(retVal)
            XCTAssertEqual(retVal, "M")
        }
    }
}
