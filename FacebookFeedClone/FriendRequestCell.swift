//
//  FriendRequestCell.swift
//  FacebookFeedClone
//
//  Created by Joseph Kim on 3/23/17.
//  Copyright © 2017 Joseph Kim. All rights reserved.
//

import UIKit

class FriendRequestCell: UITableViewCell {
    
    private let contentOffset: CGFloat = 8
    private let requestImageLength: CGFloat = 52
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Sample Name"
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()
    
    let requestImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .blue
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let confirmButton: UIButton = {
        let button = UIButton()
        button.setTitle("Confirm", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.rgb(r: 87, g: 143, b: 255)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
        button.layer.cornerRadius = 2
        return button
    }()
    
    let deleteButton: UIButton = {
        let button = UIButton()
        button.setTitle("Delete", for: UIControlState())
        button.setTitleColor(UIColor(white: 0.3, alpha: 1), for: UIControlState())
        button.layer.cornerRadius = 2
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(white: 0.7, alpha: 1).cgColor
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
        return button
    }()
    
    func setupViews() {
        addSubview(requestImageView)
        addSubview(nameLabel)
        addSubview(confirmButton)
        addSubview(deleteButton)
        
        requestImageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: contentOffset / 2, leftConstant: contentOffset * 2, bottomConstant: 0, rightConstant: 0, widthConstant: requestImageLength, heightConstant: requestImageLength)
        nameLabel.anchor(top: topAnchor, left: requestImageView.rightAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: contentOffset, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        confirmButton.anchor(top: nameLabel.bottomAnchor, left: nameLabel.leftAnchor, bottom: bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: contentOffset, rightConstant: 0, widthConstant: 80, heightConstant: 24)
        deleteButton.anchor(top: confirmButton.topAnchor, left: confirmButton.rightAnchor, bottom: confirmButton.bottomAnchor, right: nil, topConstant: 0, leftConstant:  contentOffset, bottomConstant: 0, rightConstant: 0, widthConstant: 80, heightConstant: 24)
        
    }
    
}
