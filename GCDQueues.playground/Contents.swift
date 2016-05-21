//: Playground - noun: a place where people can play

import UIKit

var welcomeMsg = "Welcome to Vincent's Playground"
print("GCD REFERSHER IN SWIFT")

func expensiveCall() -> String{
    print("doing expensive operations")
    return "Done"
}

let defaultPriority = DISPATCH_QUEUE_PRIORITY_DEFAULT
let backgroundQ = dispatch_get_global_queue(defaultPriority, 0)

dispatch_async(backgroundQ, {
    let result = expensiveCall()
    dispatch_async(dispatch_get_main_queue(), {
        print(result)
    })
})

// Recall:
// dispatch_async returns before the block is executed
// dipatch_sync waits until block is finished before returning.
// if using sync in inner thread, it doesnt matter when it returns
// but outer must be async or else main thread will be blocked
let taskQueue = dispatch_queue_create("TaskQueue", DISPATCH_QUEUE_SERIAL)

dispatch_async(taskQueue, {
    let results = expensiveCall()
    dispatch_async(dispatch_get_main_queue(), { 
        print(results)
    })
})