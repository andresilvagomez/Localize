//
//  JsonChanginFileName.swift
//  Localize
//
//  Copyright © 2017 Kekiiwaa. All rights reserved.
//

import XCTest
import Localize

class JsonChanginFileName: XCTestCase {
    
    override func setUp() {
        super.setUp()
        Localize.update(provider: .json)
        Localize.update(language: "es")
        Localize.update(fileName: "lang")
        Localize.enableTestingMode()
    }
    
    func testKeyInOtherLanguage() {
        let localized = "hello.baby".localize(tableName: "other")
        XCTAssertTrue(localized == "Esto es un saludo, el nuevo bebé está aquí!")
    }
    
    func testSearchInOtherFile() {
        let localized = "hello".localize(tableName: "other")
        XCTAssertTrue(localized == "Hola mundo!")
    }
    
    func testNameForLanguage() {
        let localized = Localize.displayNameForLanguage("es")
        XCTAssertTrue(localized == "Español")
    }
    
    func testNameBadForLanguage() {
        let localized = Localize.displayNameForLanguage("esus")
        XCTAssertTrue(localized == "")
    }
}
