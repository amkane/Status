//
//  Update.swift
//  Status
//
//  Created by Alex Kane on 6/15/15.
//  Copyright (c) 2015 Alex Kane. All rights reserved.
//

import Foundation
import CoreData

class Update: NSManagedObject {

    @NSManaged var date: NSDate
    @NSManaged var text: String
    @NSManaged var user: User

}
