//
//  TopicViewController.swift
//  Node-Swift
//
//  Created by 李日煌 on 2017/9/1.
//  Copyright © 2017年 TF. All rights reserved.
//

import UIKit
import ESPullToRefresh

class TopicViewController: UITableViewController {

    fileprivate let CellIdentifier = "CellIdentifier"
    fileprivate var dataArray : [Topic] = []
    fileprivate var page: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureRefreshUI()
        loadData()
        // Do any additional setup after loading the view.
    }
    
    private func configureUI() {
        self.navigationItem.title = "NodeJs"
        tableView.register(TopicTableViewCell.self, forCellReuseIdentifier: CellIdentifier)
    }
    
    private func configureRefreshUI() {
        self.tableView.es_addPullToRefresh {
            [unowned self] in
            
            self.refreshData()
            self.tableView.es_stopPullToRefresh(ignoreDate: true)
            /// Set ignore footer or not
            self.tableView.es_stopPullToRefresh(ignoreDate: true, ignoreFooter: false)
        }
        
        self.tableView.es_addInfiniteScrolling {
            [unowned self] in
            
            self.loadMoreData()
            self.tableView.es_stopLoadingMore()
            /// If no more data
//            self.tableView.es_noticeNoMoreData()
        }
    }
    
    private func loadData() {
        TopicsModel.loadTopicsData(page: "\(page)", done: { TopicsModel in

            guard (TopicsModel.data?.count)! > 0 else {
                return
            }
            for item in TopicsModel.data! {
                self.dataArray.append(item)
            }
            self.tableView.reloadData()
        })
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count 
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> TopicTableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: CellIdentifier, for: indexPath as IndexPath) as UITableViewCell as! TopicTableViewCell
        let topic: Topic = dataArray[indexPath.row]
        cell.topic = topic
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    private func refreshData() {
        dataArray.removeAll()
        loadData()
    }
    
    private func loadMoreData() {
        page += 1
        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


extension TopicViewController {
    

    
}
