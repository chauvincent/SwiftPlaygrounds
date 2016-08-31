//: Playground - noun: a place where people can play

import UIKit

func addOneMixedRadix(a: [Int], b: [Int], size: Int) -> ([Int], [Int]){
    var temp: [Int] = []
    var done = false
    var i = 0, j = 0

    while(!done){
        let carryFlag = (a[i] + 1 >= b[j]) ? true : false

        if carryFlag {
            temp.append(0)
            j += 1
            i += 1
        } else {
            temp.append(a[i] + 1)
            for itr in i+1...size-1{
                temp.append(a[itr])
            }
            done = true
            return (temp, b)
        }
    }
}
let arr1 = [1,1,0,1]
let arr2 = [2,2,2,2]

addOneMixedRadix(arr1, b: arr2, size: arr1.count)



