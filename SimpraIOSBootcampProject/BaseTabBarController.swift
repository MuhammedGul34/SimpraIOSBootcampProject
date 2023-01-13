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
        
        let redViewController = UIViewController()
        redViewController.view.backgroundColor = .white
        redViewController.navigationItem.title = "GAMES"
        
        let redNavController = UINavigationController(rootViewController: redViewController)
        redNavController.tabBarItem.title = "RED NAV"
        redNavController.tabBarItem.image = UIImage(named: "apps")
        redNavController.navigationBar.prefersLargeTitles = true
        
        let blueViewController = UIViewController()
        blueViewController.view.backgroundColor = .white
        blueViewController.navigationItem.title = "SEARCH"
        
        let blueNavController = UINavigationController(rootViewController: blueViewController)
        blueNavController.tabBarItem.title = "BLUE NAV"
        blueNavController.tabBarItem.image = UIImage(named: "search")
        blueNavController.navigationBar.prefersLargeTitles = true
        
        
        viewControllers = [
        redNavController,
        blueNavController
        ]
    }
}
