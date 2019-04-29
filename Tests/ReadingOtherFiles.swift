//
//  ReadingOtherFiles.swift
//  Localize
//
//  Copyright © 2019 @andresilvagomez.
//

import XCTest
import Localize

class ReadingOtherFiles: XCTestCase {

    override func setUp() {
        super.setUp()
        Localize.update(provider: .json)
    }

    func testOtherEnglish() {
        Localize.update(bundle: Bundle(for: type(of: self)))
        Localize.update(language: "en")
        Localize.update(fileName: "other")
        let result = "hello".localize()
        XCTAssertEqual(result, "Hello world!")
    }

    func testSomeItalian() {
        Localize.update(bundle: Bundle(for: type(of: self)))
        Localize.update(language: "it")
        Localize.update(fileName: "some")
        let result = "hello".localize()
        XCTAssertEqual(result, "Ciao mondo!")
    }

    func testFileGerman() {
        Localize.update(bundle: Bundle(for: type(of: self)))
        Localize.update(language: "de")
        Localize.update(fileName: "file")
        let result = "hello".localize()
        XCTAssertEqual(result, "Hallo Welt!")
    }

}
