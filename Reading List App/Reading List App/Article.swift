//
//  Article.swift
//  Reading List App
//
//  Created by Andrew Solomon on 8/18/15.
//  Copyright © 2015 ios-developers.io. All rights reserved.
//

import Foundation

class Article {
    
    let title: String
    let url: String
    let date: String
    
    class func allArticles() -> [Article] {
        let articles = [
            Article(title: "Starter's Guide to iOS Design", url: "http://taybenlor.com/2013/05/21/designing-for-ios.html", date: "08/07/15"),
            Article(title: "G is for Google", url: "http://abc.xyz", date: "04/11/15"),
            Article(title: "Noon Pacific | Weekly Handpicked Music Mixtape", url: "http://noonpacific.com/#/", date: "08/21/15"),
            Article(title: "Building TableViews in Swift & iOS8", url: "https://realm.io/news/building-tableviews-swift-ios8/", date: "08/17/15"),
            Article(title: "THE DESIGN SPRINT", url: "http://www.gv.com/sprint/", date: "07/27/15"),
            Article(title: "The Product Design Sprint", url: "https://robots.thoughtbot.com/the-product-design-sprint", date: "07/07/15"),
            Article(title: "Pixar’s 22 rules of storytelling adapted for UX — because both are about creating great experiences.", url: "https://medium.com/featured-insights/the-22-rules-of-ux-722af575915d", date: "01/17/15"),
            Article(title: "CALayer Tutorial: Getting Started", url: "http://www.raywenderlich.com/90488/calayer-in-ios-with-swift-10-examples", date: "07/27/15"),
            Article(title: "Power Up Your Animations!", url: "https://realm.io/news/altconf-marin-todorov-animations/", date: "07/27/15"),
        ]
        return articles
    }
    
    init(title: String, url: String, date: String) {
        self.title = title
        self.url = url
        self.date = date
    }
    
}