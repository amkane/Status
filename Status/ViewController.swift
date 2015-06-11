//
//  ViewController.swift
//  Status
//
//  Created by Alex Kane on 6/8/15.
//  Copyright (c) 2015 Alex Kane. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, NSURLConnectionDataDelegate {
    
    var updates = [Update]()
    
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
        
        
        
        
        
    }
    
    //MARK: - UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let updatesCount = updates.count
            return updatesCount
        
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // TODO: Make this cell reuseable
        
        var cell = NSBundle.mainBundle().loadNibNamed("UpdateTableViewCell", owner: self, options: nil).first as! UpdateTableViewCell
        
        //  var cell = UpdateTableViewCell()
        var update = updates[indexPath.row]
        cell.updateTextLabel?.text = update.text
        
        var user = update.user
        if let user = update.user {
            cell.updateUsername.text = user.userName
            cell.updateUser.text = user.name
            cell.updateCity.text = user.city
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
        
        
        
        for var i = 0; i < jsonObject.count; i++ {
            let updateJSON = jsonObject[i] as! [String: AnyObject]
            let text = updateJSON["text"] as! String
            let date = updateJSON["date"] as! Int
            let userJSON = updateJSON["user"] as! [String: AnyObject]
            let link = userJSON["link"] as! String
            let name = userJSON["name"] as! String
            let userName = userJSON["username"] as! String
            let city = userJSON["city"] as! String
            let bio = userJSON["bio"] as! String
            
            var update = Update()
            update.text = text
            // TODO: convert date interger to NSDate
            
            
            var user = User()
            user.name = name
            user.userName = userName
            user.city = city
            user.bio = bio
            user.link = link
            
            update.user = user
            
            updates.append(update)
        }
        tableView.reloadData()
    }
    
}

