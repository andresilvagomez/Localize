//
//  ReadingOtherFiles.swift
//  Localize
//
//  Copyright © 2017 Kekkiwaa Inc. All rights reserved.
//

import XCTest
import Localize

class ReadingOtherFiles: XCTestCase {
    
    override func setUp() {
        super.setUp()
        Localize.update(provider: .json)
    }
    
    func testOtherEnglish() {
        Localize.enableTestingMode()
        Localize.update(language: "en")
        Localize.update(fileName: "other")
        let result = "hello".localize()
        XCTAssert(result == "Hello world!")
    }
    
    func testSomeItalian() {
        Localize.enableTestingMode()
        Localize.update(language: "it")
        Localize.update(fileName: "some")
        let result = "hello".localize()
        XCTAssert(result == "Ciao mondo!")
    }
    
    func testFileGerman() {
        Localize.enableTestingMode()
        Localize.update(language: "de")
        Localize.update(fileName: "file")
        let result = "hello".localize()
        XCTAssert(result == "Hallo Welt!")
    }
    
}
