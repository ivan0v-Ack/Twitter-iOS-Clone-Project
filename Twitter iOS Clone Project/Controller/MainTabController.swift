//
//  MainTabController.swift
//  Twitter iOS Clone Project
//
//  Created by Ivan Ivanov on 6/12/21.
//

import UIKit

class MainTabController: UITabBarController {
    
    // MARK: - Propetries
    let actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.backgroundColor = .twitterBlue
        button.setImage(UIImage(named: "new_tweet"), for: .normal)
        button.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
        
        return button
    }()
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewControllers()
        configureUI()
    }
    // MARK: - Helpers
    
    func configureUI() {
        view.addSubview(actionButton)
      actionButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor, size: CGSize(width: 56, height: 56), padding: .init(top: 0, left: 0, bottom: 64, right: 16) )
        actionButton.layer.cornerRadius = 56 / 2
    }
    
    func configureViewControllers(){
        let feed =  templateNavigationConttroler(image: UIImage(named: "home_unselected"), rootViewController: FeedController())
       
        let explore = templateNavigationConttroler(image: UIImage(named: "search_unselected"), rootViewController: ExploreController())
        
        let notification = templateNavigationConttroler(image: UIImage(named: "like_unselected"), rootViewController: NotificationController())
        
        let conversation = templateNavigationConttroler(image: UIImage(named: "ic_mail_outline_white_2x-1"), rootViewController: ConversationController())
        
        viewControllers = [feed,explore,notification,conversation]
    }

    func templateNavigationConttroler(image: UIImage?, rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = image
        nav.navigationBar.barTintColor = .white
        return nav
    }
    
    // MARK: - Selectors
    
    @objc func actionButtonTapped() {
        print("DEBUG: 123..!")
    }
}
