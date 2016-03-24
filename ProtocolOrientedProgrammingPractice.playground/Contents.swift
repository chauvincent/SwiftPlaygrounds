//: Playground - noun: a place where people can play

import UIKit




/*                                         Protocol-Conforming Types                               */

protocol MythicalCreature {
    var name: String { get }
    var canFly: Bool { get }
}

extension BooleanType where Self: MythicalCreature{
    var boolVal: Bool {
        return self.canFly
    }
}


protocol Flyable {
    var speed: Double { get }
}

struct Dragon: MythicalCreature, Flyable {
    let name: String
    let canFly: Bool
    let frequency: Double
    let amplitude: Double
    
    var speed: Double {
        return 100 * frequency * amplitude
    }
}

struct Unicorn: MythicalCreature {
    let name: String
    let canFly = false
}

extension MythicalCreature where Self: Flyable {
    var canFly: Bool { return true }
}

enum Phoenix: MythicalCreature, Flyable {
    case Western
    case Eastern
    case Universal
    
    var name: String {
        switch self{
        case .Western:
                return "Western Phoenix"
        case .Eastern:
                return "Eastern Phoenix"
        case .Universal:
                return "Universal Phoenix"
        }
    }
    var speed: Double {
        return 2000.0
    }
}

/*                                         Protocol-Extensions                                    */

// skip ever element in collection and array of unskipped
// Extend CollectionType protocol
extension CollectionType {
    func skip(skip: Int) -> [Generator.Element] {
        guard skip != 0 else { return [] }
        
        var index = self.startIndex
        var result: [Generator.Element] = []
        var i = 0
        repeat {
            if i % skip == 0 {
                result.append(self[index])
            }
            index = index.successor()
            i = i + 1
        }while (index != self.endIndex)
        return result
    }
}


// Map Reduce
let totalNumberOfLetters = ["Cats", "Dogs"].map { $0.length }.reduce(0) { $0 + $1 }
print(totalNumberOfLetters)


let dragonDen: [MythicalCreature] =
    [Phoenix.Western,
     Phoenix.Eastern,
     Phoenix.Universal,
     Dragon(name: "Dragon", canFly: true, frequency: 2000.0, amplitude: 2000.0)]

dragonDen.skip(2)


/*                                         Generics                                                 */

func topSpeed<T: CollectionType where T.Generator.Element == Flyable>(c: T) -> Double {
    return c.map{ $0.speed }.reduce(0) { max($0, $1) }
}

let cDragon = Dragon(name: "Dragon", canFly: true, frequency: 10000, amplitude: 2000)
let flyingMyth: [Flyable] = [Phoenix.Western, cDragon]

topSpeed(flyingMyth)

struct Cat{}
struct Dogs{}

struct AnimalKeeper<T>{}

var aCatKeeper = AnimalKeeper<Cat>()
var aDogKeeper = AnimalKeeper<Dogs>()

func trade<T, U>(x: T, y: U) -> (U,T){
    return (y,x)
}
trade("Traded", y: 3)



/*                                          Notes from 2015 WWDC Video                              */

//"Self Requirement"
// Stops being usable as a type, collections are homogenous
// Static polymorphism
// more optimizable
protocol Ordered {
    func precedes(other: Self) -> Bool // "Self Requirement" placeholder for type that conforms protocol
}

struct Number : Ordered {
    var value:Double = 0
    func precedes(other: Number) -> Bool {
        return self.value < other.value
    }
}

// Homogenous array of any single Ordered type T
func binarySearch<T : Ordered>(sorted: [T], forKey k: T) -> Int {
    var low = 0
    var high = sorted.count
    while high > low {
        let mid = low + (high - low) / 2
        sorted[mid].precedes(k) ? (low = mid + 1) : (high = mid)
    }
    return low
}

// Protocol Extensions

protocol Path{
    func start(p: CGPoint)
    func end(p: CGPoint)
    func circle(center: CGPoint, radius: CGFloat)
    func innerCircle(center: CGPoint, radius: CGFloat, startAngle: CGFloat, endAngle: CGFloat)
}

extension Path {
    func circle(center: CGPoint, radius: CGFloat){
        innerCircle(center, radius: radius, startAngle: 0, endAngle: (2 * 3.14))
    }
    func doubleCircle(center: CGPoint, radius: CGFloat){
        innerCircle(center, radius: radius, startAngle: 0, endAngle: (2 * 3.14))
        innerCircle(center, radius: radius / 2.0, startAngle: 0, endAngle: (2 * 3.14))
    }
}

// Option Set Type

struct Decisions : OptionSetType {
    let rawValue: Int
}
var choices = Decisions(rawValue: 2)
var choices2 = Decisions(rawValue: 3)
choices.isSubsetOf(choices2) // more options










