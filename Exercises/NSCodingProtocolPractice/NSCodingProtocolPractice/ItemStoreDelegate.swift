//
//  ItemStoreDelegate.swift
//  NSCodingProtocolPractice
//
//  Created by Vincent Chau on 3/27/16.
//  Copyright © 2016 Vincent Chau. All rights reserved.
//

import UIKit

protocol ItemStoreDelegate: class {
    
    associatedtype Object: BaseObject, NSCoding
    var allTasks: [Object] { set get }
    func add(item: Object)
    func remove(item: Object)
    func removeAllObjects()
    func objectForRowAtIndexPath(indexPath: NSIndexPath) -> Object
    func count() -> Int
    func save(file: String)
    
}

extension ItemStoreDelegate {

    func add(item: Object){
        self.allTasks.append(item)
    }
    func remove(item: Object){
        self.allTasks = self.allTasks.filter { (allTasks) -> Bool in
            return item.id != allTasks.id
        }
    }
    func removeAllObjects(){
        self.allTasks.removeAll()
    }
    func objectForRowAtIndexPath(indexPath: NSIndexPath) -> Object{
        return self.allTasks[indexPath.row]
    }
    func count() -> Int{
        return self.allTasks.count
    }
    func save(file: String){
        NSKeyedArchiver.archiveRootObject(self.allTasks, toFile: file)
    }
}
