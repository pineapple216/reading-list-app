//
//  ArticleTableViewCell.swift
//  Reading List App
//
//  Created by Andrew Solomon on 8/18/15.
//  Copyright © 2015 ios-developers.io. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {

    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var urlLabel: UILabel!
    @IBOutlet weak private var dateLabel: UILabel!
    
    var title: String {
        get { return titleLabel.text ?? "" }
        set { titleLabel.text = newValue }
    }
    
    var url: String {
        get { return urlLabel.text ?? "" }
        set { urlLabel.text = newValue }
    }
    
    var date: String {
        get { return dateLabel.text ?? "" }
        set { dateLabel.text = newValue }
    }
}
