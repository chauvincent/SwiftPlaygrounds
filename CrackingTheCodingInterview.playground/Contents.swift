import UIKit

// Chapter 1:

// Given an array of distinct integer values, find the number of pairs that have the difference k.
// ex: Input: {1, 7, 5, 9, 2, 12, 3}  k = 2 -> there are three pairs (1,3), (3,5), (7,9)

let arr = [1,7,5,9,2,12,3]

func kDifferenceOptimal(array: [Int], k: Int) -> [(Int, Int)] {
    var numTables : [Int:Int] = [:]
    
    for (index, element) in array.enumerate() {
        numTables[element] = index
    } // O(N)
    
    for number in arr {
        let low = number - k
        let hi = number + k
        if (numTables[low] != nil) {
          
        }
        if numTables[hi] != nil {
            
        }
    }
    
    return []
}

//kDifferenceOptimal(arr, k: 2)