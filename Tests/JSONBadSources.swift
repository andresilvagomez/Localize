//
//  JSONBadSources.swift
//  LocalizeTests
//
//  Created by Andres Silva Gomez on 4/13/18.
//  Copyright © 2018 Kekiiwaa. All rights reserved.
//

import XCTest
import Localize

class JSONBadSources: XCTestCase {
    override func setUp() {
        super.setUp()
        Localize.update(provider: .json)
        Localize.enableTestingMode()
        Localize.update(language: "en")
        Localize.update(defaultLanguage: "rs")
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
    
    func testWithTableName() {
        let localized = "test.in.table".localize(tableName: "langTable")
        XCTAssertTrue(localized == "Test in table name")
    }
    
    func testWithBadTableName() {
        let localized = "test.in.table".localize(tableName: "langTablesss")
        XCTAssertTrue(localized == "test.in.table")
    }
    
    func testBadValueForKeyInLevels() {
        let localized = "test.in.table".localized
        XCTAssertTrue(localized == "test.in.table")
    }
    
    func testBadJSONFormat() {
        let localized = "test.in.table".localize(tableName: "badJSON")
        XCTAssertTrue(localized == "test.in.table")
    }
    
    func testNameForLanguage() {
        let localized = Localize.displayNameForLanguage("es")
        XCTAssertTrue(localized == "Spanish")
    }
    
    func testRestDefaultLang() {
        Localize.resetLanguage()
        XCTAssertTrue(true)
    }
}
