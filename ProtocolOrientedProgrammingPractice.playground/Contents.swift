//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

protocol Ordered {
    func precedes(other: Self) -> Bool // "Self Requirement" placeholder for type that conforms protocol
}

struct Number : Ordered {
    var value:Double = 0
    func precedes(other: Number) -> Bool {
        return self.value < other.value
    }
}