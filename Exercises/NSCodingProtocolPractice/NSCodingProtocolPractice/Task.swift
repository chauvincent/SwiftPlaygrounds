//
//  Task.swift
//  NSCodingProtocolPractice
//
//  Created by Vincent Chau on 3/26/16.
//  Copyright © 2016 Vincent Chau. All rights reserved.
//

import Foundation

class Task : BaseObject, NSCoding{
    var descript: String
    init(descript: String){
        self.descript = descript
    }
    
    // MARK: NSCoding
    func encodeWithCoder(aCoder: NSCoder){
        aCoder.encodeObject(self.descript, forKey:  "itemDescript")
    }
    required convenience init?(coder aDecoder: NSCoder){
        guard let itemDescript = aDecoder.decodeObjectForKey("itemDescript") as? String else {
            fatalError("Error in \(#function)")
        }
        self.init(descript: itemDescript)
    }
}
