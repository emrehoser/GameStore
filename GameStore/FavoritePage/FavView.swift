//
//  GameView.swift
//  GameStore
//
//  Created by Hamza IŞIKTAŞ on 17.03.2021.
//

import Foundation
import UIKit
import ObjectMapper
import CoreData

class FavView: UIView {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    private var gamesCollectionView: UICollectionView!
    var gamesModel: GamesModel?{
        didSet {
            DispatchQueue.main.async {
                self.gamesCollectionView.reloadData()
            }
        }
    }
    
    private var items = [FavoriteItem]()
    
    public init() {
        super.init(frame: .zero)
        getFavorite()
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
        gamesCollectionView?.backgroundColor = .clear
        gamesCollectionView?.register(FavCell.self, forCellWithReuseIdentifier: FavCell.identifier)
        
        
        self.addSubview(gamesCollectionView)
        _ = gamesCollectionView.anchor(self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
    }
    
    func getFavorite(){
        do {
            items = try context.fetch(FavoriteItem.fetchRequest())
            DispatchQueue.main.async {
                self.gamesCollectionView.reloadData()
            }
        }
        catch {
            // error
        }
        
    }
    
}



extension FavView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavCell.identifier, for: indexPath) as! FavCell
        cell.configure(with: (items[indexPath.row]))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("did select")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width, height: self.frame.height/5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
   
}

extension FavView {
    
    func setupUI() {
        setupBottomMenu()
    }
    
    private func setupBottomMenu() {
//        self.view.addSubview(profileImageView)
//
//        _ = profileImageView.anchor(gameView.bottomAnchor, left: self.view.leftAnchor, bottom: self.view.bottomAnchor, right: self.view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
                        
    }
}
