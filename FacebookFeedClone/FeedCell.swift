//
//  FeedCell.swift
//  FacebookFeedClone
//
//  Created by Joseph Kim on 3/23/17.
//  Copyright © 2017 Joseph Kim. All rights reserved.
//

import UIKit

class FeedCell: BaseCell {
    
    private let profileImageLength: CGFloat = 44
    private let contentOffset: CGFloat = 8
    private let statusImageViewHeight: CGFloat = 200
    private let likesCommentHeight: CGFloat = 24
    private let dividerHeight: CGFloat = 0.5
    private let likeButtonHeight: CGFloat = 44
    
    var post: Post? {
        didSet {
            
            if let name = post?.name {
                let attributedText = NSMutableAttributedString(string: name, attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14)])
                
                attributedText.append(NSAttributedString(string: "\nDecember 18  •  San Francisco  •  ", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 12), NSForegroundColorAttributeName:
                    UIColor.rgb(r: 155, g: 161, b: 171)]))
                
                let paragraphStyle = NSMutableParagraphStyle()
                let range = NSMakeRange(0, attributedText.string.characters.count)
                paragraphStyle.lineSpacing = 4
                
                attributedText.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: range)
                
                let attachment = NSTextAttachment()
                attachment.image = UIImage(named: "globe_small")
                attachment.bounds = CGRect(x: 0, y: -2, width: 12, height: 12)
                attributedText.append(NSAttributedString(attachment: attachment))
                
                nameLabel.attributedText = attributedText
            }
            
            if let statusText = post?.statusText {
                statusTextView.text = statusText
            }
            
            if let profileImageName = post?.profileImageName {
                profileImageView.image = UIImage(named: profileImageName)
            }
            
            if let statusImageName = post?.statusImageName {
                statusImageView.image = UIImage(named: statusImageName)
            }
            
            if let numLikes = post?.numLikes, let numComments = post?.numComments {
                likesCommentsLabel.text = "\(numLikes) Likes  \(numComments) Comments"
            }
        }
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        
        return label
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "zuckprofile")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let statusTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Some random text for the textView"
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    let statusImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "zuckdog")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let likesCommentsLabel: UILabel = {
        let label = UILabel()
        label.text = "99.9Y Likes    21.4T Comments"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.rgb(r: 155, g: 161, b: 171)
        return label
    }()
    
    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgb(r: 226, g: 228, b: 232)
        return view
    }()
    
    let likeButton = FeedCell.button(title: "Like", imageName: "like")
    let commentButton = FeedCell.button(title: "Comment", imageName: "comment")
    let shareButton = FeedCell.button(title: "Share", imageName: "share")
    
    static func button(title: String, imageName: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor.rgb(r: 142, g: 150, b: 163), for: .normal)
        button.setImage(UIImage(named: imageName), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 8, 0, 0)
        return button
    }
    
    override func setupViews() {
        backgroundColor = .white
        
        addSubview(nameLabel)
        addSubview(profileImageView)
        addSubview(statusTextView)
        addSubview(statusImageView)
        addSubview(likesCommentsLabel)
        addSubview(dividerLineView)
        addSubview(likeButton)
        addSubview(commentButton)
        addSubview(shareButton)
        
        nameLabel.anchor(top: topAnchor, left: profileImageView.rightAnchor, bottom: nil, right: nil, topConstant: contentOffset * 1.5, leftConstant: contentOffset, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        profileImageView.anchor(top: nameLabel.topAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: contentOffset, bottomConstant: 0, rightConstant: 0, widthConstant: profileImageLength, heightConstant: profileImageLength)
        statusTextView.anchor(top: profileImageView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: contentOffset, leftConstant: contentOffset / 2, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        statusImageView.anchor(top: statusTextView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: contentOffset, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: statusImageViewHeight)
        likesCommentsLabel.anchor(top: statusImageView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: contentOffset, leftConstant: contentOffset * 1.5, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: likesCommentHeight)
        dividerLineView.anchor(top: likesCommentsLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: contentOffset, leftConstant: contentOffset * 1.5, bottomConstant: 0, rightConstant: contentOffset * 1.5, widthConstant: 0, heightConstant: dividerHeight)
        likeButton.anchor(top: dividerLineView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: contentOffset * 1.5, widthConstant: 0, heightConstant: likeButtonHeight)
        commentButton.anchor(top: likeButton.topAnchor, left: likeButton.rightAnchor, bottom: likeButton.bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: likeButtonHeight)
        shareButton.anchor(top: likeButton.topAnchor, left: commentButton.rightAnchor, bottom: likeButton.bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: likeButtonHeight)
        likeButton.widthAnchor.constraint(equalTo: commentButton.widthAnchor).isActive = true
        commentButton.widthAnchor.constraint(equalTo: shareButton.widthAnchor).isActive = true
    }
}
