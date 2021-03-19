//
//  GameView.swift
//  GameStore
//
//  Created by Hamza IŞIKTAŞ on 17.03.2021.
//

import Foundation
import UIKit
import ObjectMapper

class GameView: UIView {
    private var gamesCollectionView: UICollectionView!
    var gamesModel: GamesModel?{
        didSet {
            DispatchQueue.main.async {
                self.gamesCollectionView.reloadData()
            }
        }
    }

    
    public init() {
        super.init(frame: .zero)
        getGames()
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
    
    func getGames() {
        
        let url = URL(string: "https://api.rawg.io/api/games?page_size=10&page=1")!

        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            self.gamesModel = Mapper<GamesModel>().map(JSONString: String(data: data, encoding: .utf8)!)
            print("ert")
            //print(String(data: data, encoding: .utf8)!)
        }

        task.resume()
            
    }
    
}


extension GameView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("bura girdim")
        if gamesModel == nil {
           // Do something using `xyz`.
            return 0
        }
        
        return (gamesModel?.games.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameCell.identifier, for: indexPath) as! GameCell
        cell.configure(with: (gamesModel?.games[indexPath.row].backgroundImage)!)
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
