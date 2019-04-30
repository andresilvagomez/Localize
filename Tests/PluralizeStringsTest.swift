//
//  PluralizeStringsTest.swift
//  LocalizeTests
//
//  Created by Andres Silva Gomez on 4/30/19.
//  Copyright © 2019 Kekiiwaa. All rights reserved.
//

import XCTest
import Localize

class PluralizeStringsTest: XCTestCase {
    override func setUp() {
        super.setUp()
        Localize.update(provider: .strings)
        Localize.update(bundle: Bundle(for: type(of: self)))
        Localize.update(language: "en")
        Localize.update(fileName: "Strings")
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
        XCTAssertEqual("other.people".pluralize(value: 0, tableName: "Other"), "there are no people")
        XCTAssertEqual("other.people".pluralize(value: 1, tableName: "Other"), "only one person")
        XCTAssertEqual("other.people".pluralize(value: 2, tableName: "Other"), "two people")
        XCTAssertEqual("other.people".pluralize(value: 27, tableName: "Other"), "many people")
        XCTAssertEqual("other.people".pluralize(value: 103, tableName: "Other"), "hundreds of people")
        XCTAssertEqual("other.people".pluralize(value: 1010, tableName: "Other"), "thousand of people")
        XCTAssertEqual("other.people".pluralize(value: 1000000, tableName: "Other"), "millions of people")
        XCTAssertEqual("other.people".pluralize(value: -1, tableName: "Other"), "not defined people")
    }
}
