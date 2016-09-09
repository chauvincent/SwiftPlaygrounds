import UIKit

/*
    Given an array of distinct integer values, find the number of pairs that have the difference k.
    ex: Input: {1, 7, 5, 9, 2, 12, 3}  k = 2 -> there are three pairs (1,3), (3,5), (7,9)
*/

// Good problems before the book problems:
// K-Difference via Hashing
/*

 func kDifferenceOptimal(array: [Int], k: Int) -> [(Int, Int)] 
 {
    var numTables : [Int:Int] = [:]
    var solution : [(Int, Int)] = []
    
    for (index, element) in array.enumerate() 
    {
        numTables[element] = index
    } // O(N)
    
    for number in arr 
    {
        let low = number - k
        let hi = number + k
        if (numTables[low] != nil) 
        {
            solution.append(number,low)
            numTables.removeValueForKey(number)
        }
        if numTables[hi] != nil 
        {
            solution.append(number, hi)
            numTables.removeValueForKey(number)
        }
    } // O(N)
    
    return solution  // O(N + N)
}

let arr = [1,7,5,9,2,12,3]
kDifferenceOptimal(arr, k: 2)
*/

// 1.1 isUnique: All unique characters Cannot use data structure
/*
 func isUnique(query: String) -> Bool 
 {
    
    if query.characters.count > 128 
    {
        return false;
    }
    var alphabets = Array(count: 128, repeatedValue: 0)

    for uni in query.unicodeScalars 
    {
        let asciiChar = uni.value
        let index = Int(asciiChar)
     
        if alphabets[index] != 0 
        {
            return false;
        }
        alphabets[index] += 1
    }

    return true; // O(128) -> O(1)
 }
 
isUnique("AB!CD!")
*/

// 1.2 checkPermutation? Given two strings write a method to decide if one is a permutation of other.
/*
    func isPermutation(str1: String, str2: String) -> Bool
    {
    
        if str1.characters.count != str2.characters.count
        {
            return false;
        }
    
        var index = 0;
        var asciiBucket = Array(count: 128, repeatedValue: 0)
        var asciiBucket2 = Array(count: 128, repeatedValue: 0)
    
        for unicode in str1.unicodeScalars
        {
            let char1 = Int(unicode.value)
            let str2Unicode = Array(str2.unicodeScalars)[index]
            let char2 = Int(str2Unicode.value)
            asciiBucket[char1] += 1
            asciiBucket2[char2] += 1
            index += 1
        }  // O(S)
    
        if asciiBucket == asciiBucket2
        {
            return true;
        } // O(S)
    
    return false // Big-O: O(S + S) = O(S), Space Complexity: O(S + S) = O(S)
}
isPermutation("dogcat", str2: "catdsg")
*/


