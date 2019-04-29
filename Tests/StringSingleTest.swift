//
//  StringSingleTest.swift
//  LocalizeTests
//
//  Copyright © 2019 @andresilvagomez.
//

import XCTest
import Localize

class StringSingleTest: XCTestCase {
    override func setUp() {
        super.setUp()
        Localize.update(provider: .strings)
        Localize.update(bundle: Bundle(for: type(of: self)))
        Localize.update(fileName: "OnlyOneLang")
    }

    func testLocalizeInSingleStringFile() {
        let localized = "hello.world.for.all".localized
        XCTAssertEqual(localized, "Hello world for all")
    }

    func testLocalizeInSingleStringFileNil() {
        let localized = "hello.world.for.allll".localized
        XCTAssertEqual(localized, "hello.world.for.allll")
    }
}
