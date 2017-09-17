//
//  TopicTableViewCell.swift
//  Node-Swift
//
//  Created by 李日煌 on 2017/9/3.
//  Copyright © 2017年 TF. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

class TopicTableViewCell: UITableViewCell {
    
    lazy var iconImageView: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    lazy var dateLabe: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    fileprivate func configureUI() {
        self.contentView.addSubview(iconImageView)
        self.contentView.addSubview(descriptionLabel)
        self.contentView.addSubview(dateLabe)
        
        iconImageView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(14)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(30)
        }
        descriptionLabel.snp.makeConstraints { (make) in
            make.left.equalTo(iconImageView.snp.right).offset(14)
            make.right.lessThanOrEqualToSuperview().offset(-14)
            make.top.equalToSuperview().offset(10)
        }
        dateLabe.snp.makeConstraints { (make) in
            make.left.equalTo(descriptionLabel.snp.left)
            make.bottom.equalToSuperview().offset(-8)
        }
    }
    
    var topic: Topic! {
        didSet {
            let icon: String = (topic.author?.avatar_url)!
            let text: String = (topic?.title)!
            let author: String = (topic.author?.loginname)!
            let date: String = topic.create_at!
            iconImageView.kf.setImage(with: URL(string:icon),
                                  placeholder: nil,
                                  options: [.transition(.fade(1))],
                                  progressBlock: nil,
                                  completionHandler: nil)
            descriptionLabel.text = text
            dateLabe.text = date
        }
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
