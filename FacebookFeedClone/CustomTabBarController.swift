//
//  CustomTabBarController.swift
//  FacebookFeedClone
//
//  Created by Joseph Kim on 3/23/17.
//  Copyright © 2017 Joseph Kim. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        let feedVC = FeedController(collectionViewLayout: layout)
        let feedController = UINavigationController(rootViewController: feedVC)
        feedController.title = "News Feed"
        feedController.tabBarItem.image = #imageLiteral(resourceName: "news_feed_icon")
        
        let friendRequestVC = FriendRequestsController()
        let friendRequestController = UINavigationController(rootViewController: friendRequestVC)
        friendRequestController.title = "Requests"
        friendRequestController.tabBarItem.image = #imageLiteral(resourceName: "requests_icon")
        
        // Implement later
        let messengerVC = UIViewController()
        messengerVC.navigationItem.title = "Messenger"
        messengerVC.view.backgroundColor = .white
        let messengerNavigationController = UINavigationController(rootViewController: messengerVC)
        messengerNavigationController.title = "Messenger"
        messengerNavigationController.tabBarItem.image = #imageLiteral(resourceName: "messenger_icon")
        
        // Implement later
        let notificationVC = UIViewController()
        notificationVC.navigationItem.title = "Notifications"
        notificationVC.view.backgroundColor = .white
        let notificationNavigationController = UINavigationController(rootViewController: notificationVC)
        notificationNavigationController.title = "Notification"
        notificationNavigationController.tabBarItem.image = #imageLiteral(resourceName: "globe_icon")
        
        // Implement later
        let moreVC = UIViewController()
        moreVC.navigationItem.title = "More"
        moreVC.view.backgroundColor = .white
        let moreNavigationController = UINavigationController(rootViewController: moreVC)
        moreNavigationController.title = "More"
        moreNavigationController.tabBarItem.image = #imageLiteral(resourceName: "more_icon")
        
        viewControllers = [feedController, friendRequestController, messengerNavigationController, notificationNavigationController, moreNavigationController]
        
        tabBar.isTranslucent = false
        
        let topBorder = CALayer()
        topBorder.frame = CGRect(x: 0, y:0, width: 1000, height: 0.5)
        topBorder.backgroundColor = UIColor.rgb(r: 229, g: 231, b: 235).cgColor
        
        tabBar.layer.addSublayer(topBorder)
        tabBar.clipsToBounds = true
    }
}
