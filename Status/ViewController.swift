//
//  ViewController.swift
//  Status
//
//  Created by Alex Kane on 6/8/15.
//  Copyright (c) 2015 Alex Kane. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    var updates: [Update]?
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        
        
        // TODO: remove this sample data
        updates = [Update]()
        
        var user = User()
        user.userName = "Alex"
        user.name = "Alex Kane"
        user.bio = "Me"
        user.city = "San Francisco"
        user.link = "http://alexkanemusic.com"
        
        var update = Update()
        update.date = NSDate()
        update.text = "Hello World"
        update.user = user
        
        updates?.append(update)
    }
    
    //MARK: - UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let updatesCount = updates?.count {
            return updatesCount
        }
        return 0
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // TODO: Make this cell reuseable
        var cell = UITableViewCell()
        if let  updates = updates {
            var update = updates[indexPath.row]
            cell.textLabel?.text = update.text
        }
        
        
        return cell
    }
    
    
    
    
}

