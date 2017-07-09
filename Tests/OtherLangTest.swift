//
//  OtherFileTest.swift
//  Localize
//
//  Copyright © 2017 Kekkiwaa Inc. All rights reserved.
//

import XCTest
import Localize

class OtherLangTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        Localize.update(provider: .json)
        Localize.testingMode()
        Localize.update(language: "it")
    }
    
    func testLocalizeKey() {
        let localized = "hello".localize()
        XCTAssertTrue(localized == "hello")
    }
    
    func testLocalizeKeyUsingDefaultLang() {
        let localized = "hello.world".localize()
        XCTAssertTrue(localized == "Hello world!")
    }
    
}
