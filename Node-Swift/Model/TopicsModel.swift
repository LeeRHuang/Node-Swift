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
import SwiftyJSON

class TopicsModel: Mappable {
    
    var success: Bool?
    var data : [Topic]?
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        success <- map["success"]
        data <- map["data"]
    }
    
    class func loadTopicsData(done:@escaping (_ t : TopicsModel)->Void) {
        let URL = "https://cnodejs.org/api/v1/topics?tab=share&mdrender=false"
        /* 基础的请求 及JSON数据解析 */
        Alamofire.request(URL).responseObject { (response: DataResponse<TopicsModel>) in
            let topics = response.result.value
            done(topics!)
        }

    }
}
