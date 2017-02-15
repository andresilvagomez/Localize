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
        Localize.update(language: .spanish)
        Localize.update(fileName: "lang")
        Localize.testingMode()
    }
    
    func testKeyInOtherLanguage() {
        let localized = "hello.baby".localize(tableName: "other")
        XCTAssertTrue(localized == "Esto es un saludo, el nuevo bebé está aquí!")
    }
    
    func testSearchInOtherFile() {
        let localized = "hello".localize(tableName: "other")
        XCTAssertTrue(localized == "Hola mundo!")
    }
    
}
