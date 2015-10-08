//
//  LogInViewController.swift
//  Reading List App
//
//  Created by Alexander Batalov on 10/8/15.
//  Copyright © 2015 ios-developers.io. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func logInButtonPressed() {
        PFTwitterUtils.logInWithBlock {
            (user: PFUser?, error: NSError?) -> Void in
            if let user = user {
                if user.isNew {
                    print("User signed up and logged in with Twitter!")
                    self.dismissViewControllerAnimated(true, completion: nil)
                } else {
                    print("User logged in with Twitter!")
                    self.dismissViewControllerAnimated(true, completion: nil)
                }
            } else {
                print("Uh oh. The user cancelled the Twitter login.")
            }
        }
    }

}
