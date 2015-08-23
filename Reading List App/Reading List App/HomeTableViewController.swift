//
//  HomeTableViewController.swift
//  Reading List App
//
//  Created by Andrew Solomon on 7/29/15.
//  Copyright © 2015 ios-developers.io. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {
    
    private let articles = Article.allArticles()
    private let webSegue: String = "WebSegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
    }
   
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ArticleCell") as! ArticleTableViewCell
        return cell
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if let cell = cell as? ArticleTableViewCell {
            let article = articles[indexPath.row]
            cell.title = article.title
            cell.url = article.url
            cell.date = article.date
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let article = articles[indexPath.row]
        performSegueWithIdentifier(webSegue, sender: article)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            switch identifier {
                case webSegue:
                    if let article = sender as? Article,
                        let vc = segue.destinationViewController as? WebViewController,
                            let url = NSURL(string: article.url) {
                            let request = NSURLRequest(URL: url)
                            vc.loadRequest(request)
                    }
                default: break
            }
        }
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 58
    }
}
