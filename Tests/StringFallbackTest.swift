//
//  StringFallbackTest.swift
//  LocalizeTests
//
//  Copyright © 2019 @andresilvagomez.
//

import XCTest
import Localize

class StringFallbackTest: XCTestCase {

    override func setUp() {
        super.setUp()
        Localize.update(provider: .strings)
        Localize.update(bundle: Bundle(for: type(of: self)))
        Localize.update(language: "es-CO")
    }

    func testKeyMainLanguage() {
        let localized = "only.spanish".localize()
        XCTAssertEqual(localized, "Solo Español")
    }

    func testKeyOtherLanguage() {
        Localize.update(language: "es")
        let localized = "only.spanish".localize()
        XCTAssertEqual(localized, "Solo Español")
    }

}
