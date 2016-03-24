//: Playground - noun: a place where people can play

import UIKit

class ToDo: NSObject, NSCoding {
    var title: String
    var descript: String
    
    init(title: String, description: String) {
        self.title = title
        self.descript = description
    }
    // MARK: NSCodingProtocols
    required convenience init?(coder aDecoder: NSCoder){
        guard let title = aDecoder.decodeObjectForKey("title") as? String,
            let descript = aDecoder.decodeObjectForKey("descript") as? String
            else { return nil }
        
        self.init(title: title, description:  descript)
    }
    func encodeWithCoder(aCoder: NSCoder){
        aCoder.encodeObject(self.title, forKey: "title")
        aCoder.encodeObject(self.descript, forKey: "descript")
    }
}


//NSKeyedArchiver.archiveRootObject(todoObject, toFile: "/path/to/archive")
//guard let object = NSKeyedUnarchiver.unarchiveObjectWithFile("/path/to/archive") as? [ToDo] else { return nil }