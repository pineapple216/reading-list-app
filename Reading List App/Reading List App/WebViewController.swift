//
//  WebViewController.swift
//  Reading List App
//
//  Created by Andrew Solomon on 8/18/15.
//  Copyright © 2015 ios-developers.io. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    @IBOutlet private weak var webView: UIWebView!
    private var request: NSURLRequest?
    
    override func viewDidLoad() {
        if let request = request {
            webView.loadRequest(request)
        }
    }
    
    func loadRequest(request: NSURLRequest) {
        self.request = request
    }
}
