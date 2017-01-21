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
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testOtherEnglish() {
        Localize.testingMode()
        Localize.update(language: .english)
        Localize.update(fileName: "other")
        let result = "hello".localize()
        XCTAssert(result == "Hello world!")
    }
    
    func testSomeItalian() {
        Localize.testingMode()
        Localize.update(language: .italian)
        Localize.update(fileName: "some")
        let result = "hello".localize()
        XCTAssert(result == "Ciao mondo!")
    }
    
    func testFileGerman() {
        Localize.testingMode()
        Localize.update(language: .german)
        Localize.update(fileName: "file")
        let result = "hello".localize()
        XCTAssert(result == "Hallo Welt!")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
