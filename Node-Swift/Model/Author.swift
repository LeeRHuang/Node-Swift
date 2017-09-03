//
//  Author.swift
//  Node-Swift
//
//  Created by 李日煌 on 2017/9/3.
//  Copyright © 2017年 TF. All rights reserved.
//

import UIKit
import ObjectMapper

class Author: BaseMappable {

    var loginname: String?
    var avatar_url: String?
    required init?(map: Map){
        
    }
    func mapping(map: Map) {
        loginname <- map["loginname"]
        avatar_url <- map["avatar_url"]
    }
}
