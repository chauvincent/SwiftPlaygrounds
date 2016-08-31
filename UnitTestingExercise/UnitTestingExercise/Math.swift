//
//  Math.swift
//  UnitTestingExercise
//
//  Created by Vincent Chau on 8/30/16.
//  Copyright © 2016 Vincent Chau. All rights reserved.
//

import Foundation

class Math{
    static let instance = Math()
    
    func sum(a: Int, b: Int) -> Int {
        return a + b;
    }
    func subtract(a: Int, b: Int) -> Int {
        return a - b;
    }
}