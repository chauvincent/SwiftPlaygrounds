//
//  Store.swift
//  NSCodingProtocolPractice
//
//  Created by Vincent Chau on 3/27/16.
//  Copyright © 2016 Vincent Chau. All rights reserved.
//

import Foundation

class Store: ItemStoreDelegate {
    static let sharedInstance = Store()
    
    typealias Object = Task
    var allTask = [Object]()
    
    private init(){
        if let dataObjects = NSData(contentsOfURL: NSURL.archiveURL()),
            storedObjects = NSKeyedUnarchiver.unarchiveObjectWithData(dataObjects) as? [Task] {
            self.allTask = storedObjects
        }
    }
}