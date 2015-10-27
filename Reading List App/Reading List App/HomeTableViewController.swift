//
//  HomeTableViewController.swift
//  Reading List App
//
//  Created by Andrew Solomon on 7/29/15.
//  Copyright © 2015 ios-developers.io. All rights reserved.
//

import UIKit
import Parse

class HomeTableViewController: UITableViewController {
    
    private let articles = Article.allArticles()
    private let webSegue: String = "WebSegue"
    private let articleCell: String = "ArticleCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 58
        
        let testObject = PFObject(className: "TestObject")
        testObject["foo"] = "bar"
        testObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            print("Object has been saved.")
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        proposeToLogin()
    }
   
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(articleCell) as! ArticleTableViewCell
        return cell
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        guard let cell = cell as? ArticleTableViewCell else { return }
        
        let article = articles[indexPath.row]
        
        cell.title = article.title
        cell.url = article.url
        cell.date = article.date
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let article = articles[indexPath.row]
        performSegueWithIdentifier(webSegue, sender: article)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            switch identifier {
                case webSegue:
                    guard
                        let article = sender as? Article,
                        let vc = segue.destinationViewController as? WebViewController,
                        let url = NSURL(string: article.url)
                        else { return }
                    
                    let request = NSURLRequest(URL: url)
                    vc.loadRequest(request)
                default: break
            }
        }
    }
    
    @IBAction func logOutButtonPressed(sender: AnyObject) {
        PFUser.logOut()
        proposeToLogin()
    }
    
    func proposeToLogin() {
        if PFUser.currentUser() == nil {
            let stb = UIStoryboard(name: "Main", bundle: nil)
            let logInVC = stb.instantiateViewControllerWithIdentifier("logInVC") as! LoginViewController
            presentViewController(logInVC, animated: true, completion: nil)
        }
    }
    
}
