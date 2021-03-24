//
//  GameViewController.swift
//  GameStore
//
//  Created by Hamza IŞIKTAŞ on 20.03.2021.
//

import Foundation
import UIKit

class FavViewController: UIViewController, UITabBarControllerDelegate {
    
    
    
    lazy var favView: FavView = {
        let view = FavView()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .clear
        self.view.addSubview(favView)
        _ = favView.anchor(self.view.topAnchor, left: self.view.leftAnchor, bottom: self.view.bottomAnchor, right: self.view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 80, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        favView.getFavorite()
        self.tabBarController?.delegate = self
    }
    
}
