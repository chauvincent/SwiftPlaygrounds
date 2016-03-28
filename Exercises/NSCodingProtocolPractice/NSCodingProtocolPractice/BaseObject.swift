//
//  BaseObject.swift
//  NSCodingProtocolPractice
//
//  Created by Vincent Chau on 3/27/16.
//  Copyright © 2016 Vincent Chau. All rights reserved.
//

import UIKit

class BaseObject: NSObject {
    let id: String
    
    override init(){
        self.id = NSUUID().UUIDString
        super.init()
    }
}
