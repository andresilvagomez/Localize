//
//  BaseTest.swift
//  Localize
//
//  Copyright © 2017 Kekkiwaa Inc. All rights reserved.
//

import XCTest
import Localize

class BaseTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        Localize.testingMode()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testLocalizeKey() {
        let localized = "hello.world".localize()
        XCTAssertTrue(localized == "Hello world!")
    }
    
    func testLocalizeKeyWithValue() {
        let localized = "name".localize(value: "Andres")
        XCTAssertTrue(localized == "Hello Andres")
    }
    
    func testLocalizeKeyWithValues() {
        let localized = "values".localize(values: "Andres", "Software Developer")
        XCTAssertTrue(localized == "Hello everyone my name is Andres and I'm Software Developer , see you soon")
    }
    
    func testLocalizeKeyWithDictionary() {
        let localized = "username".localize(dictionary: ["username": "andresilvagomez"])
        XCTAssertTrue(localized == "My username is andresilvagomez")
    }
    
    func testLocalizeKeyWithManyLevels() {
        let localized = "level.one.two.three".localize()
        XCTAssertTrue(localized == "This is a multilevel key")
    }
    
    func testLocalizeKeyWithSingleLevel() {
        let localized = "the.same.lavel".localize()
        XCTAssertTrue(localized == "This is a localized in the same level")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
