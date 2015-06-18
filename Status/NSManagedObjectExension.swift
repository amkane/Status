//
//  NSManagedObjectExension.swift
//  Status
//
//  Created by Alex Kane on 6/17/15.
//  Copyright (c) 2015 Alex Kane. All rights reserved.
//

import Foundation
import CoreData

extension NSManagedObject {
    
    class func newObjectInContext(context: NSManagedObjectContext) -> NSManagedObject {
        
        let entityName = NSStringFromClass(self).componentsSeparatedByString(".").last!
        
        let object = NSEntityDescription.insertNewObjectForEntityForName(entityName, inManagedObjectContext: context) as! NSManagedObject
        
        return object
        
    }
}