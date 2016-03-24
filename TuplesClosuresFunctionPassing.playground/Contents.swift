import UIKit

/*                                                 Random Refresher                             */

let age = "24"
var myAge = Int(age)
var name = "Vincent"

name += " Chau"

struct Person{
    
    var firstName:String
    var lastName:String
    var yearOfBirth:Int = 0
}

struct PersonBuilder {
    var first: String?
    var last: String?
    var year: Int?
    
    enum InputError: ErrorType {
        case InputMissing
        case YearIncorrect
    }
    
    func createPerson() throws -> Person{
        guard let first = first, let last = last
            where first.characters.count > 0 || last.characters.count > 0 else{
                throw InputError.InputMissing
        }
        guard let year = year else{
                throw InputError.YearIncorrect
        }
        return Person(firstName: first, lastName: last, yearOfBirth: year)
    }
}

let builder = PersonBuilder(first: "Vincent", last: "Chau", year: 1991)

do {
    let person = try builder.createPerson()
} catch PersonBuilder.InputError.InputMissing{
    print("missing input yo!")
}

/*                                           Functions as Variables                             */

func swiftIsCool(truth: Bool, message: String?) -> String{
    return(truth ? "you know whatssup" : "you dont know what you missing")
}

var function: (Bool, String) -> String = swiftIsCool
function(true, "you are damm right!")


// add function passing
func adder(x: Int, y: Int) -> Int{
    return x+y
}

let addFunction: (Int, Int) -> Int = adder

func printSum(addFunc: (Int, Int) -> Int, _ num1: Int, _ num2: Int){
    let sum = addFunc(num1, num2)
    print(sum)
}

printSum(addFunction, 500, 500) // passing in a function!! reminds me of haskell!!



/*                                                 Ranges                                       */

let closedRange = 0...5   // include both 0 and 5
let halfOpen = 0..<5    // includes 0 but not 5

let personAge = 24
var definition:String

switch(personAge){
    case 0...200:
        print("still young")
    default:
        print("you are still young at heart")
}

/*                                              Repeat-While                                    */

var count = 0
repeat{
    print("at count = \(count++)")
} while (count < 10)


/*                                                 Tuples                                       */

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

func calculateAmountOfPts(myScore: Double) -> (percentGrade: Double, rawScore: Double){
    let grade = myScore / maxScore
    let percent = grade * 100
    
    return (grade, percent)
}

let score = calculateAmountOfPts(90)
score.percentGrade
score.rawScore

/*                                                 Closures                                     */

var add: (Int, Int) -> Int

add = {
    (a,b) -> Int in
    return a + b
}
add(1,2)


/*                                     Now for some more fun                                    */


func checkString(str: String) -> Int{
    let number: Int = Int(str) ?? -1
    return number
}

func stringForTup(code: Int, msg: String) -> String{
    if let a:Int = checkString(msg){
        return String(a)
    }else{
        return "message cannot be an int"
    }
}
let codeMsg = (30, "20")
stringForTup(codeMsg.0, msg: codeMsg.1)


func strlen(str: String) -> String{
    let count = str.characters.count
    return "Length is \(count)"
}

func myReverse(str: String) -> [Character]{
    var rev = [Character]()
    var counter = 0
    for c in str.characters{
        print(c)
        rev.insert(c, atIndex: 0)
        counter++
    }
    return rev
}
myReverse("I guess direct index access is the trade-off...")


func greetings(name: String) -> String{
    return ("Hello, \(name)")
}

let varGreetings: (String) -> String = greetings

varGreetings("World")


/*                                              More Fun with Closures                  */

let starcraftNames = ["Zerg", "Protoss", "Terran"]
starcraftNames.sort { (race1: String, race2: String) -> Bool in
    return (race1 < race2 ? true : false)
}

typealias mathProb = (Int, Int) -> Int

func calc( mathClosure:mathProb){
    print("\(mathClosure(1,3))")
}

calc{ (int1, int2) -> Int in
    return int1 - int2
}

calc{ (int1, int2) -> Int in
    return 30
}


