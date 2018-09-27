//
//  StringFallbackTest.swift
//  LocalizeTests
//
//  Created by gustavo.grana on 25/09/18.
//  Copyright © 2018 Kekiiwaa. All rights reserved.
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
        XCTAssertTrue(localized == "Solo Español")
    }

    func testKeyOtherLanguage() {
        Localize.update(language: "es")
        let localized = "only.spanish".localize()
        XCTAssertTrue(localized == "Solo Español")
    }

}
