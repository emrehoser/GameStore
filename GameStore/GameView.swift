//
//  GameView.swift
//  GameStore
//
//  Created by Hamza IŞIKTAŞ on 17.03.2021.
//

import Foundation
import UIKit

class GameView: UIView {
    private var gamesCollectionView: UICollectionView!
    public var games = ["mortal kombat", "fifa", "nba2k"]
    
    public init() {
        super.init(frame: .zero)
        print("ert")
        setupCollectionView()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 300, height: 200)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        gamesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        gamesCollectionView?.showsHorizontalScrollIndicator = false
        gamesCollectionView?.delegate = self
        gamesCollectionView.dataSource = self
        gamesCollectionView?.backgroundColor = .brown
        gamesCollectionView?.register(GameCell.self, forCellWithReuseIdentifier: GameCell.identifier)
        
        
        self.addSubview(gamesCollectionView)
        _ = gamesCollectionView.anchor(self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}


extension GameView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("bura girdim")
        return games.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameCell.identifier, for: indexPath) as! GameCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("did select")
    }
    
   
}
