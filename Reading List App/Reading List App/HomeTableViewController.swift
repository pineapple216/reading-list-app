//
//  HomeTableViewController.swift
//  Reading List App
//
//  Created by Andrew Solomon on 7/29/15.
//  Copyright © 2015 ios-developers.io. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 58
//        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ArticleCell") as UITableViewCell!
        
        return cell
    }
}
