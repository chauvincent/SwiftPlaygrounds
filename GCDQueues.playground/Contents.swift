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
let taskQueue = dispatch_queue_create("com.chau.serial.queue", DISPATCH_QUEUE_SERIAL)

dispatch_async(taskQueue, {
    let results = expensiveCall()
    dispatch_async(dispatch_get_main_queue(), { 
        print(results)
    })
})

/*                                      Semaphores/Threads, Flatten completion Blocks
 
    Blocking a thread for an amount of time until a signal from another thread is sent with semaphores
    Use semaphores when there is an asyc api and need to make synchronous calls, so need to block the aynchronous thread
*/
/*
dispatch_semaphore_t semaphore = dispatch_semaphore_create(0)
expensiveAsynchronousWork(completionBlock: {
    dispatch_semaphore_signal(semaphore)
})

 // Block thread until dispatch_semaphore_signal is called from a different thread(from background)
 // Never timeout with DISPATCH_TIME_FOREVER
dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER)

*/

typealias DoneBlock = () -> ()
typealias JobBlock = (DoneBlock) -> ()

// Create serial queue, enqueue jobs onto the block.
// JobBlock gives DoneBlock to call when the job is done, which will signal the semaphore and allow the serial queue to continue
class AsyncSerial {
    private let serialQ = dispatch_queue_create("com.chau.serial.queue2", DISPATCH_QUEUE_SERIAL)
    
    func enqueue(job: JobBlock) {
        dispatch_async(serialQ, {
          let semaphore = dispatch_semaphore_create(0)
            job({
                dispatch_semaphore_signal(semaphore)
            })
            dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER)
        })
    }
}

/*                                              Limit Concurrenct Blocks                                        */

// Similar to maxConcurrentOperationCount on NSOperationQueue
func processJobs() {
    print("working")
}
class LimitedProcess {
    private let concurrentQ = dispatch_queue_create("com.chau.concurrent.queue", DISPATCH_QUEUE_CONCURRENT)
    private let semaphore: dispatch_semaphore_t
    
    init(limit: Int){
        semaphore = dispatch_semaphore_create(limit) // limit is number of resource avaliable
    }
    // if hit semaphore limit, will use a new thread
    func enequeueJob(job: () -> ()){
        dispatch_async(concurrentQ) {
            dispatch_semaphore_wait(self.semaphore, DISPATCH_TIME_FOREVER) // decrements count by 1 every time you wait
            processJobs()
            dispatch_semaphore_signal(self.semaphore) // increments count variable by 1 (resource has been freed)
        }
    }
    
}


/*                                              Groups                                                          */

// If many blocks of work to execute, want to know when its all complete

/*
 
dispatch_group_t group = dispatch_group_create()
for item in taskArray {
    dispatch_group_async(group, backgroundQ, {
        expensiveCall()
    })
}
dispatch_group_notify(group, dispatch_get_main_queue(), {
    // everything in task array is done, now do something with it
}
*/



