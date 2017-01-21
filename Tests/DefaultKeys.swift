//
//  DefaultKeys.swift
//  Localize
//
//  Copyright © 2017 Kekkiwaa Inc. All rights reserved.
//

import XCTest
import Localize

class DefaultKeys: XCTestCase {
    
    override func setUp() {
        super.setUp()
        Localize.testingMode()
        Localize.update(language: .spanish)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        let localized = "enlish".localize()
        XCTAssertTrue(localized == "This key only exist in english file.")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
