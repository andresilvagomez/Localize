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
        Localizable.testingMode()
        Localizable.update(language: .italian)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    /// Try localize a key unexisting in json file
    /// return the same key.
    func testLocalizeKey() {
        let localized = "hello".localize()
        XCTAssertTrue(localized == "hello", "The hello key exist in json file")
    }
    
    /// Try localize a key unexisting in json file
    /// But is present in your default language
    /// return a key in your default language.
    func testLocalizeKeyUsingDefaultLang() {
        let localized = "hello.world".localize()
        XCTAssertTrue(localized == "Hello world!", "The hello.world no exist in base json file")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
