//
//  Topic.swift
//  Node-Swift
//
//  Created by 李日煌 on 2017/9/3.
//  Copyright © 2017年 TF. All rights reserved.
//

import UIKit
import ObjectMapper

class Topic: Mappable {

    var id: String?
    var author_id : String?
    var tab : String?
    var content : String?
    var title : String?
    var last_reply_at : String?
    var good : String?
    var top : Bool?
    var reply_count : Int?
    var visit_count : Int?
    var create_at : String?
    var author : Author?
    required init?(map: Map){
        
    }
    func mapping(map: Map) {
        id <- map["id"]
        author_id <- map["author_id"]
        content <- map["content"]
        title <- map["title"]
        last_reply_at <- map["last_reply_at"]
        good <- map["good"]
        top <- map["top"]
        reply_count <- map["reply_count"]
        visit_count <- map["visit_count"]
        create_at <- map["create_at"]
        author <- map["author"]
        tab <- map["tab"]
    }
}
