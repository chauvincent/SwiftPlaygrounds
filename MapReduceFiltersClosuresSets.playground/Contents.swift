import UIKit

/*                              More Closures                                   */

// Calculate a^2 + b^2 = c^2 Pythagorean Theorem for length of C
func pytagorean(a: Float, b: Float, fn:(Float->Float)) -> Float{
    return (fn(a) + fn(b))
}

let cSquared = pytagorean(2.5, b: 3.0, fn: {$0 * $0})
print(cSquared)


// Calculate a^2 + b^2  / 2.0
func avg(a: Float, b: Float, fn:(Float->Float)) -> Float{
    return ((fn(a) + fn(b)) / 2.0)
}

avg(1.0, b: 1.0, fn: { (c: Float) -> Float in return (c * c) })
let avgAndSquare = avg(2.0, b: 1.0, fn: {c in c * c})
print(avgAndSquare)


/*                                  Map                                         */

let lotsOfNumbers = [29,345,234,25,436,32,46,26,326,34,6324,5324,534,55,2345,6,2]

// Add $'s
let lotsOfMoney = lotsOfNumbers.map({money in "$\(money)"})

let moreMoney = lotsOfNumbers.map({"$\($0 * 2)"})

// [Int] -> [String]
let lotsOfStrings = lotsOfNumbers.map{ (element) -> String in
    return String(element)
}

var msgArr = ["So many features in Swift", "I LIKE IT"]
let lowerCaseItems = msgArr.map { (element) -> String in
    return element.lowercaseString
}

let distanceFrom = lotsOfNumbers.map { (number) -> Int in
    return number.distanceTo(30)
}


/*                                 Reduce                                       */

let someAlphabet = ["A","B","C","D","E","F","G","H","I","J","K","L"]

// "strcat" the whole array to one string
let alphaString = someAlphabet.reduce("") { (string, result) -> String in
    return "\(string) \(result)"
}

// reduce a dictionary of scores to a sum of scores
let scoreDictionary = [ "A" : 4, "B" : 5, "C" : 6,  "D" : 8,  "F" :9   ]
let scores = scoreDictionary.reduce(0) { (score, combine: (questionLetter: String, amountScored: Int)) -> Int in
    return score + combine.amountScored
}
print(scores)

// Cost of a good dinner
let totalPurchases = ["Alaskan Crab" : 15.00,
                      "Fresh Shrimp" : 9.99,
                          "Red Wine" : 30.00,
                           "Lobster" : 50.00,
                    "Garlic Noodles" : 10.00,
                             "Prawns": 15.00,
                      "Aligator Soup": 99.00]

let dinnerTotal = totalPurchases.reduce(0) { (cost, combine: (foodItem: String, costPerItem: Double)) -> Double in
    return cost + combine.costPerItem
}
print("Dinner Total is: \(dinnerTotal)")

// Quick way to sum an array
let randomNums = [1,2,34,5,12,3,3]
let simpleSum = randomNums.reduce(0, combine: {$0 + $1})
print(simpleSum)


/*                                          Filter                               */

// Filter less expensive items from dinner
let lessExpensiveItems = totalPurchases.filter({$1 < 20.00})
print(lessExpensiveItems)

// Get values greater than a threshold
let finalExamGrades = [60,40,30,70,50,76,80,90,99,20,10,0,0,35,67,75]
let passingScores = finalExamGrades.filter({$0 > 50})
print(passingScores)

/*                              Playing With Sets                               */

let friendlyAnimals:Set = ["Dogs", "Cats", "Rabbits", "Sheeps","Frogs"]
let notFriendlyAnimals:Set = ["Tigers","Leopards","Wolves","Dinosaurs"]
let felines:Set = ["Cats","Tigers","Leaopards"]

// hmm... this reminds me of prolog...
let allAnimals = friendlyAnimals.union(notFriendlyAnimals).union(felines)
let animalsToAvoid = allAnimals.subtract(friendlyAnimals).subtract(felines)

let friendlyAndFeline = friendlyAnimals.intersect(felines)


/*                                 Random Fun                                   */






