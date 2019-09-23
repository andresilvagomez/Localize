//
//  StringBaseTestInSpanish.swift
//  Localize
//
//  Copyright © 2019 @andresilvagomez.
//

import XCTest
import Localize

class StringBaseTestInSpanish: XCTestCase {

    override func setUp() {
        super.setUp()
        Localize.update(provider: .strings)
        Localize.update(bundle: Bundle(for: type(of: self)))
        Localize.update(language: "es")
    }

    func testLocalizeKey() {
        let localized = "hello.world".localize()
        XCTAssertEqual(localized, "Hola mundo!")
    }

    func testLocalizeKeyWithValue() {
        let localized = "name".localize(value: "Andres")
        XCTAssertEqual(localized, "Hola Andres")
    }

    func testLocalizeKeyWithValues() {
        let localized = "values".localize(values: "Andres", "Software Developer")
        XCTAssertEqual(localized, "Hola a todos mi nombre es Andres y soy Software Developer, nos vemos pronto")
    }

    func testLocalizeKeyWithDictionary() {
        let localized = "username".localize(dictionary: ["username": "andresilvagomez"])
        XCTAssertEqual(localized, "Mi nombre de usuario es andresilvagomez")
    }

    func testLocalizeKeyWithManyLevels() {
        let localized = "level.one.two.three".localize()
        XCTAssertEqual(localized, "Esta es una llave multinivel")
    }

    func testLocalizeKeyAviableInDefaultLanguage() {
        let localized = "enlish".localize()
        XCTAssertEqual(localized, "This key only exist in english file.")
    }

    func testLocalizeWithTableName() {
        let localized = "other.key".localize(tableName: "Other")
        XCTAssertEqual(localized, "Esta llave existe en otro archivo")
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
        XCTAssertEqual(language, "es")
    }

}
