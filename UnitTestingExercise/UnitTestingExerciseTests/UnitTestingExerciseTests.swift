//
//  UnitTestingExerciseTests.swift
//  UnitTestingExerciseTests
//
//  Created by Vincent Chau on 8/30/16.
//  Copyright © 2016 Vincent Chau. All rights reserved.
//
import XCTest
@testable import UnitTestingExercise

class UnitTestingExerciseTests: XCTestCase {
    // Common Practice:
    // Break the test first then fix it

    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    func testAddition() {
        XCTAssertNotNil(Math.instance)
        
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
