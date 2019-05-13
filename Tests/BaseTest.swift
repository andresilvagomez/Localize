//
//  BaseTest.swift
//  Localize
//
//  Copyright © 2019 @andresilvagomez.
//

import XCTest
import Localize

class BaseTest: XCTestCase {
    override func setUp() {
        super.setUp()
        Localize.update(provider: .json)
        Localize.update(bundle: Bundle(for: type(of: self)))
        Localize.update(language: "en")
    }

    func testRemoveKeyAndGetDefaultForLang() {
        UserDefaults.standard.removeObject(forKey: localizeStorageKey)
        XCTAssertEqual(Localize.currentLanguage, Locale.preferredLanguages.first)
    }

    func testSameKeyWithTableName() {
        let localized = "heymamiwhereareyou".localize(values: "", "", tableName: "heymamiwhereareyou")
        XCTAssertEqual(localized, "heymamiwhereareyou")
    }

    func testLocalizeInAnyDictionary() {
        let localized = "heymomhowareyoy".localized
        XCTAssertEqual(localized, "heymomhowareyoy")
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
        XCTAssertEqual(localized, "Hello everyone my name is Andres and I'm Software Developer, see you soon")
    }

    func testLocalizeKeyWithDictionary() {
        let localized = "username".localize(dictionary: ["username": "andresilvagomez"])
        XCTAssertEqual(localized, "My username is andresilvagomez")
    }

    func testLocalizeKeyWithManyLevels() {
        let localized = "level.one.two.three".localize()
        XCTAssertEqual(localized, "This is a multilevel key")
    }

    func testLocalizeKeyWithSingleLevel() {
        let localized = "the.same.lavel".localize()
        XCTAssertEqual(localized, "This is a localized in the same level")
    }

    func testSearchInOtherFile() {
        let localized = "hello.baby".localize(tableName: "other")
        XCTAssertEqual(localized, "This is a welcome, new baby is here!")
    }

    func testCheckIfKeyExist() {
        XCTAssertTrue(Localize.localizeExists(forKey: "hello.baby", table: "other"))
        XCTAssertTrue(Localize.localizeExists(forKey: "the.same.lavel"))
        XCTAssertFalse(Localize.localizeExists(forKey: "hello.baby2"))
    }

    func testListOfAvailableLanguages() {
        let languages = Localize.availableLanguages
        XCTAssertEqual(languages.count, 3)
    }

    func testCurrentLanguage() {
        let language = Localize.currentLanguage
        XCTAssertEqual(language, "en")
    }
}
