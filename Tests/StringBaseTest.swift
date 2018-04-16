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
        Localize.update(bundle: Bundle(for: type(of: self)))
        Localize.update(language: "en")
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
        let languages = Localize.availableLanguages
        XCTAssertTrue(languages == ["en", "es", "fr"])
    }
    
    func testCurrentLanguage() {
        let language = Localize.currentLanguage
        XCTAssertTrue(language == "en")
    }
    
}
