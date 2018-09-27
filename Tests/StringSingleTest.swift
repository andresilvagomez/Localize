//
//  StringSingleTest.swift
//  LocalizeTests
//
//  Created by Andres Silva Gomez on 5/15/18.
//  Copyright © 2018 Kekiiwaa. All rights reserved.
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
        XCTAssertTrue(localized == "Hello world for all")
    }

    func testLocalizeInSingleStringFileNil() {
        let localized = "hello.world.for.allll".localized
        XCTAssertTrue(localized == "hello.world.for.allll")
    }
}
