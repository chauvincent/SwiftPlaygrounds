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
function(true, "you are damm right!")


func adder(x: Int, y: Int) -> Int
{
    return x+y
}

let addFunction: (Int, Int) -> Int = adder

func printSum(addFunc: (Int, Int) -> Int, _ num1: Int, _ num2: Int)
{
    let sum = addFunc(num1, num2)
    print(sum)
}

printSum(addFunction, 500, 500)


/*                                                 Ranges                           */

let closedRange = 0...5   // include both 0 and 5
let halfOpen = 0..<5    // includes 0 but not 5

let personage = 24
var definition:String

switch(personage)
{
    case 0...200:
        print("still young")
    default:
        print("you are still young at heart")
}

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




