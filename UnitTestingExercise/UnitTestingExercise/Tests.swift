//
//  Tests.swift
//  UnitTestingExercise
//
//  Created by Vincent Chau on 8/30/16.
//  Copyright © 2016 Vincent Chau. All rights reserved.
//

import Foundation

class Tests {
    let math = Math()
    
    init(){
        testSum()
    }
    
    func testSum() {
        if math.sum(5, b: 5) != 10 {
            print("ERROR: sum is wrong")
        }
    }
}