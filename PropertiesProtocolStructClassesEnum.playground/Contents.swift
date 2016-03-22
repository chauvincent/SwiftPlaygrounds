import UIKit
/*                                Structs Refresher                                   */

struct WaterBottles {
    var amount: Int
    var amountOfBoxes: Int?
    init(fromAmount totalBottles: Int){
        amount = totalBottles
    }
    func printAmount(){
        print(amount)
    }
}

/*                                Classes Refresher                                   */
class Felines {
    var hasFur:Bool
    var hasATail:Bool
    var nickname:String
    init(hasFur: Bool, hasATail: Bool,  nickname: String){
        self.hasFur = hasFur
        self.hasATail = hasATail
        self.nickname = nickname
    }
}

var tiger = Felines(hasFur: true, hasATail: true, nickname: "Tony")
var tigerPtr = tiger
var newTiger = Felines(hasFur: true, hasATail: true, nickname: "Tony")
tiger === tigerPtr
tiger === newTiger  // === see if point to same object


// Convenience Init
class ScoreBoard{
    var player1:String
    var player2:String
    var scoreDictionary = [String:Int]()
    var finishedGame:Bool
    required init(pid1: String, pid2: String, finished: Bool, scores: [String:Int]){
        self.player1 = pid1
        self.player2 = pid2
        self.finishedGame = finished
        self.scoreDictionary = scores
    }
    convenience init(){
        self.init(pid1: "None", pid2: "None", finished: false, scores:["None":0])
    }
}
class SubScoreBoard: ScoreBoard {
    init(){
        super.init(pid1: "Username123", pid2: "Username344", finished: true, scores: ["fsdaf":1])
    }

    required init(pid1: String, pid2: String, finished: Bool, scores: [String : Int]) {
        fatalError("init(pid1:pid2:finished:scores:) has not been implemented")
    }
}


// Internal Classes
internal class InternalFelines {
    var isExinct:Bool
    var hasFangs:Bool
    internal var coolNickname:String?
    init(){
        self.isExinct = true
        self.hasFangs = true
    }
    private func changeNickname(newName: String){
        self.coolNickname = newName
    }
}

// Inheritance refresher
class Robot{
    var hp:Int
    var damage:Double
    var evilLaugh:String
    init(health: Int, damage: Double, evilLaugh: String){
        self.hp = health
        self.damage = damage
        self.evilLaugh = evilLaugh
    }
    func attack(weapon: String){
        print( "You have been attacked with \(weapon) !! -\(self.damage), \(evilLaugh) ")
    }
}

class DraculaRobot: Robot {
    var weapon: String
    init(){
        self.weapon = "Teeth"
        super.init(health: 100, damage: 50, evilLaugh: "MUHAHAHAHAHA")
    }
    func attack(){
        super.attack(self.weapon)
    }
}
var theCount = DraculaRobot()
theCount.attack()


/*                                ARC IN SWIFT                                   */

class TestingARC{
    let name: String
    init(name: String){
        self.name = name
        print(" \(self.name) being initiliazed")
    }
    deinit{
        print("\(self.name) is being deinialized")
    }
}

var ref1: TestingARC?
var ref2: TestingARC?
var ref3: TestingARC?

ref1 = TestingARC(name: "REFERENCE 1")
ref2 = TestingARC(name: "REFERENCE 2")
ref3 = TestingARC(name: "REFERENCE 3")

ref2 = ref1
ref3 = ref1

ref1 = nil
ref2 = nil
ref3 = nil // Deallocates after all strong ref is gone


/*                                ENUM IN SWIFT                                   */

enum Month:Int{
    case January
    case February
}
var thisMonth = Month(rawValue: 0)
thisMonth = .February


enum HTTP{
    case GET
    case POST(String)
}
HTTP.POST("Hello")

/*                               Singletons in Swift                             */

class DataManager{
    static let shared = DataManager()
    var dataBaseRef:String
    private init(){
        self.dataBaseRef = "asdfsdaf"
    }
}

/*                               Property Observers and Lazy Var                 */
class Post {
    var postID:String{
        didSet{
            print("finished setting")
        }
        willSet{
            print("about to set")
        }
    }
    // [unowned self] to avoid strong ref cycle, without it the closure owns self -> mem leak
    lazy var message: String = {
        [unowned self] in
        return "Lazy message for \(self.message)"
    }()
    
    lazy var title = Post.initTitle()
    
    init(){
        self.postID = "New Post"
    }
    class func initTitle() -> String{
        return "Default Title"
    }
    
    private func updatePostID(postID: String){
        self.postID = postID
    }
}

let post1 = Post()
post1.updatePostID("324234423f")
post1.updatePostID("333333")




