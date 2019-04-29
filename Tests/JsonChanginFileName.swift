//
//  JsonChanginFileName.swift
//  Localize
//
//  Copyright © 2019 @andresilvagomez.
//

import XCTest
import Localize

class JsonChanginFileName: XCTestCase {

    override func setUp() {
        super.setUp()
        Localize.update(provider: .json)
        Localize.update(language: "es")
        Localize.update(fileName: "lang")
        Localize.update(bundle: Bundle(for: type(of: self)))
    }

    func testKeyInOtherLanguage() {
        let localized = "hello.baby".localize(tableName: "other")
        XCTAssertEqual(localized, "Esto es un saludo, el nuevo bebé está aquí!")
    }

    func testSearchInOtherFile() {
        let localized = "hello".localize(tableName: "other")
        XCTAssertEqual(localized, "Hola mundo!")
    }

    func testNameForLanguage() {
        let localized = Localize.displayNameForLanguage("es")
        XCTAssertEqual(localized, "Español")
    }

    func testNameBadForLanguage() {
        let localized = Localize.displayNameForLanguage("esus")
        XCTAssertEqual(localized, "")
    }
}
