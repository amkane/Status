//
//  ViewController.swift
//  Status
//
//  Created by Alex Kane on 6/8/15.
//  Copyright (c) 2015 Alex Kane. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, NSURLConnectionDataDelegate {
    
    var updates: [Update]?
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        tableView.delegate = self
        
        
        
        // how to retrieve data from the interwebs, in this case a json file
        
        let urlString = "https://rawgit.com/jamescmartinez/Status/master/updates.json"
        let url = NSURL(string: urlString)
        let request = NSURLRequest(URL: url!)
        let connection = NSURLConnection(request: request, delegate: self, startImmediately: true)
        
        
        
        
        
        
        
        //        // TODO: remove this sample data
        //        updates = [Update]()
        //
        //        var user = User()
        //        user.userName = "Alex"
        //        user.name = "Alex Kane"
        //        user.bio = "Me"
        //        user.city = "San Francisco"
        //        user.link = "http://alexkanemusic.com"
        //
        //        for var i = 0; i < 100; i++ {
        //            var update = Update()
        //            update.date = NSDate()
        //            update.text = "Hello World \(i)"
        //            update.user = user
        //
        //            updates?.append(update)
        //        }
        
        
        
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
        
        var cell = NSBundle.mainBundle().loadNibNamed("UpdateTableViewCell", owner: self, options: nil).first as! UpdateTableViewCell
        
        //  var cell = UpdateTableViewCell()
        if let  updates = updates {
            var update = updates[indexPath.row]
            cell.updateTextLabel?.text = update.text
            
            var user = update.user
            if let user = update.user {
                cell.updateUsername.text = user.userName
                cell.updateUser.text = user.name
                cell.updateCity.text = user.city
            }
            
        }
        
        
        return cell
    }
    
    
    // MARK: - UITableViewDelegate
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100.00
    }
    
    
    // MARK: - NSURLConnectionDataDelegate
    func connection(connection: NSURLConnection, didReceiveData data: NSData){
        
        let jsonObject = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as! NSArray
        println(jsonObject)
    }
    
}

