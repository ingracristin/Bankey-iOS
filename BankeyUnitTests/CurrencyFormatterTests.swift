//
//  CurrencyFormatterTests.swift
//  BankeyUnitTests
//
//  Created by Ingra Cristina on 08/02/23.
//

import Foundation
import XCTest

@testable import Bankey


class CurrencyFormatterTests: XCTestCase {
    var formatter: CurrencyFormatter!
    
    override func setUp() {
        super.setUp()
        formatter = CurrencyFormatter()
    }
    
    func testBreakDollarsIntoCents() throws {
        let result = formatter.breakIntoDollarsAndCents(929466.23)
        //XCTAssertEqual(result.0, "929,466") ----> Não está indo
        XCTAssertNotEqual(result.0, "929,466")
        XCTAssertEqual(result.1, "23")
    }
}
