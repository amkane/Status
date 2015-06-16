//
//  User.swift
//  Status
//
//  Created by Alex Kane on 6/15/15.
//  Copyright (c) 2015 Alex Kane. All rights reserved.
//

import Foundation
import CoreData

class User: NSManagedObject {

    @NSManaged var bio: String
    @NSManaged var link: String
    @NSManaged var name: String
    @NSManaged var city: String
    @NSManaged var userName: String
    @NSManaged var updates: NSSet

}
