//
//  Additions.swift
//  NSCodingProtocolPractice
//
//  Created by Vincent Chau on 3/27/16.
//  Copyright © 2016 Vincent Chau. All rights reserved.
//

import Foundation

extension NSURL {
    class func documentDirectory() -> NSURL {
        guard let documentDirectory = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first else {
            fatalError("Error in \(#function)")
        }
        return documentDirectory
    }
    class func archiveURL(itemID: String = "archive") -> NSURL {
        return self.documentDirectory().URLByAppendingPathComponent(itemID)
    }
}

extension String {
    static func archivePath() -> String {
        guard let archivePath = NSURL.archiveURL().path else {
            fatalError("Error in \(#function)")
        }
        return archivePath
    }
}
