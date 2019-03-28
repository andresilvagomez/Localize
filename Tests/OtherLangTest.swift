//
//  OtherFileTest.swift
//  Localize
//
//  Copyright © 2017 @andresilvagomez.
//

import XCTest
import Localize

class OtherLangTest: XCTestCase {

    override func setUp() {
        super.setUp()
        Localize.update(provider: .json)
        Localize.update(bundle: Bundle(for: type(of: self)))
        Localize.update(language: "it")
    }

    func testLocalizeKey() {
        let localized = "hello".localize()
        XCTAssertEqual(localized, "hello")
    }

    func testLocalizeKeyUsingDefaultLang() {
        let localized = "hello.world".localize()
        XCTAssertEqual(localized, "Hello world!")
    }

}
