//
//  ReadingOtherFiles.swift
//  JsonLocalizable
//
//  Copyright © 2017 Kekkiwaa Inc. All rights reserved.
//

import XCTest
import JsonLocalizable

class ReadingOtherFiles: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testOtherEnglish() {
        Localizable.testingMode()
        Localizable.update(language: .english)
        Localizable.update(fileName: "other")
        let result = "hello".localize()
        XCTAssert(result == "Hello world!")
    }
    
    func testSomeItalian() {
        Localizable.testingMode()
        Localizable.update(language: .italian)
        Localizable.update(fileName: "some")
        let result = "hello".localize()
        XCTAssert(result == "Ciao mondo!")
    }
    
    func testFileGerman() {
        Localizable.testingMode()
        Localizable.update(language: .german)
        Localizable.update(fileName: "file")
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
