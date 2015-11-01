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
        
        // Save the article to Parse
        // Check if the user already saved the article to Parse
        let articleQuery = PFQuery(className: "Article")
        articleQuery.whereKey("title", equalTo: article.title)
        articleQuery.includeKey("viewers")
        articleQuery.getFirstObjectInBackgroundWithBlock { (object: PFObject?, error: NSError?) -> Void in
            //print(object)
            
            // The object hasn't been saved before for any user, create it and save it
            if object == nil {
                var parseArticle = PFObject(className: "Article")
                parseArticle["title"] = article.title
                parseArticle["url"] = article.url
                
                let dateFormatter = NSDateFormatter()
                dateFormatter.dateFormat = "MM/dd/yy"
                var articleDate = dateFormatter.dateFromString(article.date)
                
                parseArticle["date"] = articleDate
                
                parseArticle.addObject(PFUser.currentUser()!.objectId!, forKey: "viewers")
                
                // MARK: - TODO: Decide wether to use array's or Parse Relations
                //let relation = parseArticle.relationForKey("viewedBy")
                //relation.addObject(PFUser.currentUser()!)
                
                parseArticle.saveInBackgroundWithBlock({ (succes: Bool, error: NSError?) -> Void in
                    if succes {
                        // Add the Parse article to the articles array for the user that has viewed the article
                        let user = PFUser.currentUser()
                        user?.addUniqueObject(parseArticle.objectId!, forKey: "articles")
                        user?.saveInBackground()
                        print("Article added to articles array")
                    }
                    else if (error != nil) {
                        print("Error occured saving the article: %@", error?.localizedDescription)
                    }
                })
                print("Article saved for the first time")
            }
            // The article has already been saved before, by this user or another user.
            else if object != nil {
                print("The article has already been saved before, by another user, adding this user if it's not already in the viewers array")
                object?.addUniqueObject((PFUser.currentUser()?.objectId)!, forKey: "viewers")
                
                // MARK: - TODO: Decide wether to use array's or Parse Relations
                //let relation = object!.relationForKey("viewedBy")
                //relation.addObject(PFUser.currentUser()!)
                let user = PFUser.currentUser()
                user?.addUniqueObject((object?.objectId)!, forKey: "articles")
                user?.saveInBackground()
                
                object?.saveInBackgroundWithBlock(nil)
            }
        }
        
        // Segue to the webVC
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
