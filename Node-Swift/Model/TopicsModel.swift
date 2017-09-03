//
//  TopicsModel.swift
//  Node-Swift
//
//  Created by 李日煌 on 2017/9/3.
//  Copyright © 2017年 TF. All rights reserved.
//

import UIKit
import ObjectMapper
import Alamofire
import AlamofireObjectMapper

class TopicsModel: BaseMappable {
    
    var success: Bool?
    var data : [Topic]?
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        success <- map["success"]
        data <- map["data"]
    }
    
    class func loadTopicsData(done:@escaping (_ t : TopicsModel)->Void) {
        let URL = "https://cnodejs.org/api/v1/topics?tab=\(1)&page=\(1)"
        Alamofire.request(URL).responseObject { (response: DataResponse<TopicsModel>) in
            let topics = response.result.value
            done(topics!)
            print("topics is \(topics)")
        }
    }
}
