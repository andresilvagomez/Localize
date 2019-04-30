//
//  PluralizeJsonTest.swift
//  LocalizeTests
//
//  Copyright © 2019 @andresilvagomez.
//

import XCTest
import Localize

class PluralizeJsonTest: XCTestCase {
    override func setUp() {
        super.setUp()
        Localize.update(provider: .json)
        Localize.update(bundle: Bundle(for: type(of: self)))
        Localize.update(language: "en")
    }

    func testPluralize() {
        XCTAssertEqual("people".pluralize(value: 0), "there are no people")
        XCTAssertEqual("people".pluralize(value: 1), "only one person")
        XCTAssertEqual("people".pluralize(value: 2), "two people")
        XCTAssertEqual("people".pluralize(value: 27), "many people")
        XCTAssertEqual("people".pluralize(value: 103), "hundreds of people")
        XCTAssertEqual("people".pluralize(value: 1010), "thousand of people")
        XCTAssertEqual("people".pluralize(value: 1000000), "millions of people")
        XCTAssertEqual("people".pluralize(value: -1), "not defined people")
    }

    func testPluralizeTable() {
        XCTAssertEqual("other.people".pluralize(value: 0, tableName: "other"), "there are no people")
        XCTAssertEqual("other.people".pluralize(value: 1, tableName: "other"), "only one person")
        XCTAssertEqual("other.people".pluralize(value: 2, tableName: "other"), "two people")
        XCTAssertEqual("other.people".pluralize(value: 27, tableName: "other"), "many people")
        XCTAssertEqual("other.people".pluralize(value: 103, tableName: "other"), "hundreds of people")
        XCTAssertEqual("other.people".pluralize(value: 1010, tableName: "other"), "thousand of people")
        XCTAssertEqual("other.people".pluralize(value: 1000000, tableName: "other"), "millions of people")
        XCTAssertEqual("other.people".pluralize(value: -1, tableName: "other"), "not defined people")
    }
}
