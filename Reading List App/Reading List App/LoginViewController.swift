//
//  LogInViewController.swift
//  Reading List App
//
//  Created by Alexander Batalov on 10/8/15.
//  Copyright © 2015 ios-developers.io. All rights reserved.
//

import UIKit
import Parse
import ParseTwitterUtils

class LoginViewController: UIViewController {
 
    @IBAction func loginButtonPressed() {
        PFTwitterUtils.logInWithBlock {
            (user: PFUser?, error: NSError?) -> Void in
            if let _ = user {
                self.dismissViewControllerAnimated(true, completion: nil)
            } else {
                print("Uh oh. The user cancelled the Twitter login.")
            }
        }
    }
}