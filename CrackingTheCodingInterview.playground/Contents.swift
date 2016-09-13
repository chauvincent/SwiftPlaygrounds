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

// 1.3 URLify:  input: Mr John Smith -> Mr%20John%20Smith
/*
    func URLify(inputStr: String) -> String
    {
        let strArr = inputStr.componentsSeparatedByString(" ")
        let url = strArr.reduce("", combine: {$0 + "%20" + $1})
        return url
    }
    URLify("Mr John Smith")
*/

// 1.4 Palindrome permutation : Input: Tact Coa -> True, since permutations : taco cat, atco cta, etc..
/*
    Ans: same thing as 1.2 pretty much
*/

// 1.5 One Away:  Input : pale, pal -> True, pale, bale -> True, pale, bake -> False
/*
    Brain storming: 2 main cases
    1. same length and one || more off
    2. different length by one || more
*/

/*
func checkDifferentByOne(str1: String, str2: String) -> Bool
{
    var diffCount = 0
    var count = 0;
    let str2 = Array(str2.characters)
    for letter in str1.characters {
        if letter != str2[count] {
            diffCount += 1
            print("letter is \(letter)")
            print("str2 is \(str2[count])")
            if diffCount > 1 {
                return false;
            }
        }
        count += 1
    }
    return true;
}

func isOneAway(str1: String, str2: String) -> Bool
{
    let diff = Int(str1.characters.count - str2.characters.count)

    if (diff == 0)
    {
        return checkDifferentByOne(str1, str2: str2)
    }
    else if (diff == 1 || diff == -1)
    {
        let isFirstShorter = (str1.characters.count < str2.characters.count) ? true : false
        print(isFirstShorter)
        if (isFirstShorter)
        {
            let tempStr = str1 + "X"
            return checkDifferentByOne(tempStr, str2: str2)
        }
        else
        {
            let tempStr = str2 + "X"
            return checkDifferentByOne(str1, str2: tempStr)
        }
    }
    return false; // O(S)
}

isOneAway("abcd", str2: "dbcd")
*/

/* 
    1.6 String Compression, compress repeated characters: aabcccccaaa -> a2b1c5a3
*/
/*
 func compressStr(str: String) -> String?
 {
    var done = false
    var solution = ""
    var index1 = 0
    var index2 = 1
    let strArr = Array(str.characters)
    
    var count = 1;
    
    while (!done)
    {
        if index2 == strArr.count
        {
            done = true;
            break;
        }
        if strArr[index1] == strArr[index2]
        {
            if count == 1
            {
                solution += String(strArr[index1])
            }
            count += 1
            index1 += 1
            index2 += 1
        }
        else
        {
            solution += String(count)
            count = 1
            index1 += 1
            index2 += 1
        }
        
    }
    
    return solution
 }

compressStr("aaabbccde")
*/

/*
    1.7 Rotate Matrix: 90 degrees, given NxN matrix
*/
func rotateMatrix(arr: [[Int]]) -> [[Int]]
{
    

    return M
}

let M = [[Int]]()
rotateMatrix(M)


