//
//  GameViewController.swift
//  GameStore
//
//  Created by Hamza IŞIKTAŞ on 20.03.2021.
//

import Foundation
import UIKit


class DetailViewController: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    lazy var detaiView: DetailView = {
        let view = DetailView()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .clear
        self.view.addSubview(detaiView)
        _ = detaiView.anchor(self.view.topAnchor, left: self.view.leftAnchor, bottom: self.view.bottomAnchor, right: self.view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        
    }
    
    func  createFavorite(game: Game){
        let newItem = FavoriteItem(context: context)
        
        newItem.genres = game.genres
        newItem.id = String(game.gameId!)
        newItem.metacritic = String(game.metacritic!)
        newItem.name = game.gameName
        newItem.imageurl = game.backgroundImage
        
        
        do {
            try context.save()
        } catch {
                
        }
    }
    
    func deleteFavorite(item: FavoriteItem){
        context.delete(item)
        
        do {
            try context.save()
        } catch  {
            
        }
    }
    
}
