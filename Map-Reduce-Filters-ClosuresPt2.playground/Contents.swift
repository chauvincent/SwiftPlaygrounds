import UIKit

/*                              More Closures                           */



// Calculate a^2 + b^2 = c^2 Pythagorean length of C
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


/*                                  Map                                 */





var reviewArr = ["So many features in Swift", "I LIKE IT"]
let lowerCaseItems = reviewArr.map { (element) -> String in
    return element.lowercaseString
}

let lotsOfNumbers = [29,345,234,25,436,32,46,26,326,34,6324,5324,534,55,2345,6,2]

let bigNumbers = lotsOfNumbers.map { (number) -> Int in
    return number.distanceTo(30)
}

let money = lotsOfNumbers.map({money in "$\(money)"})



/*                                 Reduce                               */
/*                                 Filter                               */
