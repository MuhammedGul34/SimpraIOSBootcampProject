//
//  BaseTabBarController.swift
//  SimpraIOSBootcampProject
//
//  Created by Muhammed Gül on 13.01.2023.
//

import UIKit


class BaseTabBarController: UITabBarController {
    
    // We will create another controller
    // refactor our repeated logic inside of viewdidload
    // We are going to introduce search controller
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [
        createNavController(viewController: GamesSearchController(), title: "Search", imageName: "search"),
        createNavController(viewController: UIViewController(), title: "Today", imageName: "today_icon"),
        createNavController(viewController: UIViewController(), title: "Games", imageName: "apps"),
        ]
    }
    fileprivate func createNavController(viewController: UIViewController, title: String, imageName: String) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.prefersLargeTitles = true
        viewController.navigationItem.title = title
        viewController.view.backgroundColor = .white
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: imageName)
        
        return navController
    }
    
}
