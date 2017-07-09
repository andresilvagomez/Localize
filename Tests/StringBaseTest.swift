//
//  StringBaseTest.swift
//  Localize
//
//  Copyright © 2017 Kekiiwaa. All rights reserved.
//

import XCTest
import Localize

class StringBaseTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        Localize.update(provider: .strings)
        Localize.testingMode()
        Localize.update(language: "en")
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
    
    func testLocalizeWithTableName() {
        let localized = "other.key".localize(tableName: "Other")
        XCTAssertTrue(localized == "This key exist in other file")
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
