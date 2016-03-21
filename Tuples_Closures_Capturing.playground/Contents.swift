import UIKit

/*                                                 Random Refresher                  */

let age = "24"
var myAge = Int(age)
var name = "Vincent"

name += " Chau"

class Person
{
    var firstName:String
    var lastName:String
    var yearOfBirth:Int = 0
    var gitHub: String?
    
    init(fromName first: String, andLast last: String, withDOB year: Int, gitHubID gitID: String?)
    {
        self.firstName = first
        self.lastName = last
        self.yearOfBirth = year
    }
}
let person1 = Person(fromName: "Vincent", andLast: "Chau", withDOB: 1991, gitHubID: "chauvincent")

/*                                           Functions as Variables                 */

func swiftIsCool(truth: Bool, message: String?) -> String
{
    return(truth ? "you know whatssup" : "you dont know what you missing")
}

var function: (Bool, String) -> String = swiftIsCool
function(true, "damm right!")


/*                                                 Tuples                           */

//  Unnamed-Tuples
let unamedTup = ("Power Level Over", 9000)
unamedTup.0
unamedTup.1

let (powerLvl, amount) = unamedTup
powerLvl
amount


// Named-Tuples
let tuple: (description: String, code: Int) = ("Power Level Over", 9000)
tuple.description


// Returning Tuples in functions
let maxScore = 100.0

func calculateAmountOfPts(myScore: Double) -> (percentGrade: Double, rawScore: Double)
{
    let grade = myScore / maxScore
    let percent = grade * 100
    
    return (grade, percent)
}

let score = calculateAmountOfPts(90)
score.percentGrade
score.rawScore




