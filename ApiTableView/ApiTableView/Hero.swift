//
//  Hero.swift
//  ApiTableView
//
//  Created by Yeldan_Mac on 10/10/19.
//  Copyright © 2019 Yeldan_Mac. All rights reserved.
//

class Hero {
    
    var name: String?
    var imageUrl: String?
    var realName: String?
    
    init(name: String?, imageUrl: String?, realName: String?) {
        self.name = name
        self.imageUrl = imageUrl
        self.realName = realName
    }
}
