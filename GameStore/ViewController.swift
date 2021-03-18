//
//  ViewController.swift
//  Deneme
//
//  Created by Hamza IŞIKTAŞ on 16.03.2021.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var profileImageView: UIImageView = {
        let pp = UIImageView()
        pp.layer.borderWidth = 0.4
        pp.backgroundColor = .red
        pp.layer.borderColor = UIColor.black.cgColor
        pp.clipsToBounds = true
        pp.layer.masksToBounds = true
        pp.layer.cornerRadius = 16.0
        return pp
    }()
    
    lazy var gameView: GameView = {
        let view = GameView()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .red
        self.view.addSubview(gameView)
        _ = gameView.anchor(self.view.topAnchor, left: self.view.leftAnchor, bottom: self.view.bottomAnchor, right: self.view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 80, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        self.view.addSubview(profileImageView)
        
        _ = profileImageView.anchor(gameView.bottomAnchor, left: self.view.leftAnchor, bottom: self.view.bottomAnchor, right: self.view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
    }
    
    
}



