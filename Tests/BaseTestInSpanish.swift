//
//  BaseTestInSpanish.swift
//  Localize
//
//  Copyright © 2017 @andresilvagomez.
//

import XCTest
import Localize

class BaseTestInSpanish: XCTestCase {
    override func setUp() {
        super.setUp()
        Localize.update(provider: .json)
        Localize.update(bundle: Bundle(for: type(of: self)))
        Localize.update(language: "es")
    }

    func testRemoveKeyAndGetDefaultForLang() {
        UserDefaults.standard.removeObject(forKey: localizeStorageKey)
        XCTAssertEqual(Localize.currentLanguage, Locale.preferredLanguages.first)
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
        XCTAssertEqual(localized, "Hola a todos mi nombre es Andres y soy Software Developer , nos vemos pronto")
    }

    func testLocalizeKeyWithDictionary() {
        let localized = "username".localize(dictionary: ["username": "andresilvagomez"])
        XCTAssertEqual(localized, "Mi nombre de usuario es andresilvagomez")
    }

    func testLocalizeKeyWithManyLevels() {
        let localized = "level.one.two.three".localize()
        XCTAssertEqual(localized, "Esta es una llave multinivel")
    }

    func testLocalizeKeyWithSingleLevel() {
        let localized = "the.same.lavel".localize()
        XCTAssertEqual(localized, "Esto es una internazionalizacion en el mismo nivel")
    }

    func testDefaultValuesFromOtherLanguage() {
        let localized = "enlish".localize()
        XCTAssertEqual(localized, "This key only exist in english file.")
    }

    func testListOfAvailableLanguages() {
        let languages = Localize.availableLanguages
        XCTAssertEqual(languages.count, 3)
    }

    func testCurrentLanguage() {
        let language = Localize.currentLanguage
        XCTAssertEqual(language, "es")
    }
}
