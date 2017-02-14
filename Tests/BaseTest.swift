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
        Localize.update(provider: .json)
        Localize.testingMode()
        Localize.update(language: .english)
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
    
    func testSearchInOtherFile() {
        let localized = "hello.baby".localize(tableName: "other")
        XCTAssertTrue(localized == "This is a welcome, new baby is here!")
    }
    
    func testListOfAvailableLanguages() {
        let languages = Localize.availableLanguages()
        XCTAssertTrue(languages == ["en", "es"])
    }
    
    func testCurrentLanguage() {
        let language = Localize.language()
        XCTAssertTrue(language == "en")
    }
    
}
