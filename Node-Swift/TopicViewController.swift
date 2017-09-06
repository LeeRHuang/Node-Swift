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
    fileprivate var dataArray : [Topic] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureData()
        configureUI()
        // Do any additional setup after loading the view.
    }
    
    func configureUI() {
        self.navigationItem.title = "NodeJs"
        tableView.register(TopicTableViewCell.self, forCellReuseIdentifier: CellIdentifier)
    }
    
    func configureData() {
        TopicsModel.loadTopicsData {TopicsModel in
//            guard !(((TopicsModel.data?.count) != nil)) else {
//                return
//            }
            for item in TopicsModel.data! {
                self.dataArray.append(item)
            }
            self.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count 
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> TopicTableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: CellIdentifier, for: indexPath as IndexPath) as UITableViewCell as! TopicTableViewCell
        let topic: Topic = dataArray[indexPath.row]
        let title = topic.title
        cell.textLabel?.text = title
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


extension TopicViewController {
    

    
}
