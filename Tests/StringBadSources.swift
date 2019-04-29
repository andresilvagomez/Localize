//
//  StringBadSources.swift
//  LocalizeTests
//
//  Copyright © 2019 @andresilvagomez.
//

import XCTest
import Localize

class StringBadSources: XCTestCase {
    override func setUp() {
        super.setUp()
        Localize.update(provider: .strings)
        Localize.update(bundle: Bundle(for: type(of: self)))
        Localize.update(language: "en")
        Localize.update(defaultLanguage: "rs")
    }

    func testLocalizeInAnyDictionary() {
        let localized = "heymomhowareyoy".localized
        XCTAssertEqual(localized, "heymomhowareyoy")
    }

    func testLocalizeProperty() {
        let localized = "hello.world".localized
        XCTAssertEqual(localized, "Hello world!")
    }

    func testLocalizeKey() {
        let localized = "hello.world".localize()
        XCTAssertEqual(localized, "Hello world!")
    }
}
