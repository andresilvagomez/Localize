//
//  OtherFileTest.swift
//  JsonLocalizable
//
//  Copyright © 2017 Kekkiwaa Inc. All rights reserved.
//

import XCTest
import JsonLocalizable

class OtherLangTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        let localize = Localizable.shared
        localize.defaultLanguage = .italian
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testLocalizeKey() {
        let localized = "hello".localize()
        XCTAssertTrue(localized == "hello")
    }
    
    func testLocalizeKeyUsingDefaultLang() {
        let localized = "hello.world".localize()
        XCTAssertTrue(localized == "Hello world!")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
