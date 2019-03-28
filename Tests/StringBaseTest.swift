//
//  StringBaseTest.swift
//  Localize
//
//  Copyright © 2017 @andresilvagomez.
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
        XCTAssertEqual(localized, "heymomhowareyoy")
    }

    func testLocalizeProperty() {
        let localized = "hello.world".localized
        XCTAssertEqual(localized, "Hello world!")
    }

    func testLocalizeKey() {
        let localized = "hello.world".localize()
        XCTAssertEqual(localized, "Hello world!")
    }

    func testLocalizeKeyWithValue() {
        let localized = "name".localize(value: "Andres")
        XCTAssertEqual(localized, "Hello Andres")
    }

    func testLocalizeKeyWithValues() {
        let localized = "values".localize(values: "Andres", "Software Developer")
        XCTAssertEqual(localized, "Hello everyone my name is Andres and I'm Software Developer , see you soon")
    }

    func testLocalizeKeyWithDictionary() {
        let localized = "username".localize(dictionary: ["username": "andresilvagomez"])
        XCTAssertEqual(localized, "My username is andresilvagomez")
    }

    func testLocalizeWithTableName() {
        let localized = "other.key".localize(tableName: "Other")
        XCTAssertEqual(localized, "This key exist in other file")
    }

    func testListOfAvailableLanguages() {
        let languages = Localize.availableLanguages
        let array = ["en", "es", "es-CO", "fr"]
        for item in array {
            XCTAssertTrue(languages.contains(item))
        }
    }

    func testCurrentLanguage() {
        let language = Localize.currentLanguage
        XCTAssertEqual(language, "en")
    }
}
