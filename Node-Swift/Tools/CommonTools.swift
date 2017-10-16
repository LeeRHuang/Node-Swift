//
//  CommonTools.swift
//  Node-Swift
//
//  Created by 李日煌 on 2017/9/17.
//  Copyright © 2017年 TF. All rights reserved.
//

import UIKit

class CommonTools: NSObject {
    
    
}

extension NSDate {
    class func convert(dateString: String) {
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        dateFormatter.timeZone = NSTimeZone.local
        // convert string into date
        let dateValue = dateFormatter.date(from: dateString) as NSDate!
    }
}
