//                                              Lecture Notes:
//
import UIKit

//                                             Basic Conversions
let age = "24"
var myAge = Int(age)

/*                                                 Tuples                           */

//  Unnamed-Tuples
let unamedTup = ("Power Level", 9000)
unamedTup.0
unamedTup.1

let (powerLvl, amount) = unamedTup
powerLvl
amount


// Named-Tuples
let tuple: (description: String, code: Int) = ("Power Level", 9000)
tuple.description


// Returning Tuples
let maxScore = 100.0

func calculateAmountOfPts(myScore: Double) -> (percentGrade: Double, rawScore: Double)
{
    let grade = myScore / maxScore
    let percent = grade * 100
    
    return (grade, percent)
}

let score = calculateAmountOfPts(90)



