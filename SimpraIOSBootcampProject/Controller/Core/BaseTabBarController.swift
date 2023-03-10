//
//  BaseTabBarController.swift
//  SimpraIOSBootcampProject
//
//  Created by Muhammed Gül on 13.01.2023.
//

import UIKit

class BaseTabBarController: UITabBarController {
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [
            createNavController(viewController: GamesPageController(), title: "Games".localized(), imageName: "apps"),
            createNavController(viewController: GamesSearchController(), title: "Search".localized(), imageName: "search"),
            createNavController(viewController: FavouriteViewController(), title: "Favorite".localized(), imageName: "today_icon"),
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
