//
//  TopicViewController.swift
//  Node-Swift
//
//  Created by 李日煌 on 2017/9/1.
//  Copyright © 2017年 TF. All rights reserved.
//

import UIKit

class TopicViewController: UITableViewController {

    fileprivate let CellIdentifier = "CellIdentifier"
    fileprivate var dataArray : TopicsModel?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func configureUI() {
        self.navigationItem.title = "NodeJs"
        tableView.register(TopicTableViewCell.self, forCellReuseIdentifier: CellIdentifier)
    }
    
    func configureData() {
        TopicsModel.loadTopicsData {
            self.dataArray = $0
            self.tableView.reloadData()
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


extension TopicViewController {
    
    
}
