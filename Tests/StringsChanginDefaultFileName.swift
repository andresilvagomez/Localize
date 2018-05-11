//
//  StringsChanginDefaultFileName.swift
//  Localize
//
//  Copyright © 2017 @andresilvagomez.
//

import XCTest
import Localize

class StringsChanginDefaultFileName: XCTestCase {
    
    override func setUp() {
        super.setUp()
        Localize.update(provider: .strings)
        Localize.update(language: "en")
        Localize.update(fileName: "Other")
        Localize.update(bundle: Bundle(for: type(of: self)))
    }
    
    func testKeyInOtherLanguage() {
        let localized = "hello.baby".localize()
        XCTAssertTrue(localized == "This is a welcome, new baby is here!")
    }
    
    func testSearchInOtherFile() {
        let localized = "hello.world".localize(tableName: "Strings")
        XCTAssertTrue(localized == "Hello world!")
    }
    
}
