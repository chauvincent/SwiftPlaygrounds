//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/* Convert time to military */

let s = "07:05:45PM"

let calander = NSCalendar.currentCalendar()
let components = NSDateComponents()
let timeArray = s.componentsSeparatedByString(":")

var hours = Int(timeArray[0])!
var minutes = timeArray[1]

if (s.containsString("AM")){
    let secondsArr = timeArray[2].componentsSeparatedByString("PM")
    let seconds = secondsArr[0]
    var militaryTime = String(format: "%d:%@:%@", hours, minutes, seconds)
    print(militaryTime)
}else if (s.containsString("PM") && hours >= 1){
    let secondsArr = timeArray[2].componentsSeparatedByString("PM")
    let seconds = secondsArr[0]
    hours += 12
    var militaryTime = String(format: "%d:%@:%@", hours, minutes, seconds)
    print(militaryTime)
}
