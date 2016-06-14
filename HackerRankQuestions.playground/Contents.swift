//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*                                                  Warm-up Convert time to military                        */

let s = "12:45:54PM"
let calander = NSCalendar.currentCalendar()
let components = NSDateComponents()
let timeArray = s.componentsSeparatedByString(":")

var hours = Int(timeArray[0])!
var minutes = timeArray[1]
var secondsArr = []
var militaryTime:String?

if (s.containsString("AM")){
    var newHours = ""
    
    if (hours == 12){
        newHours = "00"
    }else{
        newHours = "0" + String(hours)
    }
    let secondsArr = timeArray[2].componentsSeparatedByString("PM")
    let seconds = secondsArr[0].componentsSeparatedByString("AM")
    militaryTime = String(format: "%@:%@:%@", newHours, minutes, seconds[0])
    print(militaryTime)
    
}else if (s.containsString("PM") && Int(hours) >= 1){
    let secondsArr = timeArray[2].componentsSeparatedByString("PM")
    let seconds = secondsArr[0]
    let newHours = (hours == 12) ? 12 : (hours + 12) //hours += 12
    var militaryTime = String(format: "%d:%@:%@", newHours, minutes, seconds)
    print(militaryTime)
}

/*                                                      Angry Professor                                     */
/*  Input: First line is the amount of test cases
        each test case followed by two lines, first line separated by two spaced-separate integers

    N (students in the class) and K (The cancelation threshold)
    (a1,a2,a3,.....an) describing arrival time per student
    ai <= 0 student arrived early or on time
    ai > 0 student is late
    Output: If class is canceled if fewer than K students in class
*/

/*                                                     My Solution                                          */
/*
// Test Data:
var n = 1
var nK = [4,2]
var arrivalTimes = [0,-1,2,1]


var n = Int(readLine()!)!
func isClassCanceled(n: Int, nk: [Int], arrivalTimes: [Int]) -> Bool{
    let lateStudents = arrivalTimes.filter({$0 > 0})
    let onTimeStudents = nk[0] - lateStudents.count
    return (nk[1] <= onTimeStudents) ? false : true
}
var message = ""
for i in 1...n{
    let nK = readLine()!.componentsSeparatedByString(" ").map{Int(String($0))!}
    let arrivalTimes = readLine()!.componentsSeparatedByString(" ").map{Int(String($0))!}
    message = isClassCanceled(n, nk: nK, arrivalTimes: arrivalTimes) ? "YES" : "NO"
    print(message)
}
*/

/*                                                  Decent Number                                           */
/*
    A Decent Number is:
    1. Its digits can only be 3 or 5
    2. The number of 3's it contains is divisible by 5
    3. The number of 5's it contains is divisible by 3
    4. if there are more than one such number pick the largest
 
    Ex: 
    n = 1   ->   -1 (no decent number with 1 digit)
    n = 3   ->   555 since 5 appears 3 times in this number, count of 5's is evenly divisible by 3 (property 3)
    n = 5   ->   333333 since 3 appears 5 times in this number, count of 3's is even divisible by 5
    n = 11  ->   555555333333 and all the permutations of these are valid, but this is the largest
*/













