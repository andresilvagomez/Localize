//
//  BaseTest.swift
//  Localize
//
//  Copyright © 2017 @andresilvagomez.
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
        UserDefaults.standard.removeObject(forKey: LocalizeStorageKey)
        XCTAssertTrue(Localize.currentLanguage == Locale.preferredLanguages.first)
    }
    
    func testSameKeyWithTableName() {
        let localized = "heymamiwhereareyou".localize(values: "", "", tableName: "heymamiwhereareyou")
        XCTAssertTrue(localized == "heymamiwhereareyou")
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
        let languages = Localize.availableLanguages
        XCTAssertTrue(languages.count == 3)
    }
    
    func testCurrentLanguage() {
        let language = Localize.currentLanguage
        XCTAssertTrue(language == "en")
    }
    
}
