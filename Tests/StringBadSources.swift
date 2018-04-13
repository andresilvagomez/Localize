//
//  StringBadSources.swift
//  LocalizeTests
//
//  Created by Andres Silva Gomez on 4/13/18.
//  Copyright © 2018 Kekiiwaa. All rights reserved.
//

import XCTest
import Localize

class StringBadSources: XCTestCase {
    override func setUp() {
        super.setUp()
        Localize.update(provider: .strings)
        Localize.enableTestingMode()
        Localize.update(language: "en")
        Localize.update(defaultLanguage: "rs")
    }
    
    func testLocalizeInAnyDictionary() {
        let localized = "heymomhowareyoy".localized
        XCTAssertTrue(localized == "heymomhowareyoy")
    }
    
    func testLocalizeProperty() {
        let localized = "hello.world".localized
        XCTAssertTrue(localized == "Hello world!")
    }
    
    func testLocalizeKey() {
        let localized = "hello.world".localize()
        XCTAssertTrue(localized == "Hello world!")
    }
}
