//
//  TabBarViewController.swift
//  GameStore
//
//  Created by Hamza IŞIKTAŞ on 21.03.2021.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = UIColor(red: 0.063, green: 0.392, blue: 0.737, alpha: 1)
        
        
        setupVCs()

        // Do any additional setup after loading the view.
    }
    func setupVCs() {
        viewControllers = [
            createNavController(for: GameViewController(), title: NSLocalizedString("Games", comment: ""), image: UIImage(named: "GameTab")!),
            createNavController(for: FavViewController(), title: NSLocalizedString("Favorites", comment: ""), image: UIImage(named: "FavTab")!),
        ]
    }
    
    fileprivate func createNavController(for rootViewController: UIViewController,
                                                      title: String,
                                                      image: UIImage) -> UIViewController {
            let navController = UINavigationController(rootViewController: rootViewController)
            navController.tabBarItem.title = title
            navController.tabBarItem.image = image
            navController.navigationBar.prefersLargeTitles = true
            rootViewController.navigationItem.title = title
            return navController
        }


}

