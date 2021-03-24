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


class DetailView: UIView {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    lazy var backButton: UIButton = {
        let myBackButton = UIButton()
        myBackButton.backgroundColor = .clear
        myBackButton.setImage(UIImage(named: "BackIcon"), for: .normal)
        return myBackButton
    }()
    
    lazy var backButtonText: UIButton = {
        let myBackButton = UIButton()
        myBackButton.backgroundColor = .clear
        myBackButton.setTitle("Games", for: .normal)
        return myBackButton
    }()
    
    lazy var favButton: UIButton = {
        let myFavButton = UIButton()
        myFavButton.backgroundColor = .clear
        myFavButton.setTitle("Favorite", for: .normal)
        return myFavButton
    }()
    
    lazy var gameImageView: UIImageView = {
        let myImageView = UIImageView()
        //myImageView.clipsToBounds = true
        //myImageView.contentMode = .scaleAspectFill
        //myImageView.layer.masksToBounds = true
        myImageView.backgroundColor = .clear
        return myImageView
    }()
    
    lazy var gameTitleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 20,weight: UIFont.Weight.bold)
        label.numberOfLines = 2
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.05

        label.attributedText = NSMutableAttributedString(string: "Grand Theft Auto V", attributes: [NSAttributedString.Key.kern: 0.38, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
        return label
    }()
    
    lazy var gameDescriptionLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 20,weight: UIFont.Weight.bold)
        label.numberOfLines = 2
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.05

        label.attributedText = NSMutableAttributedString(string: "Grand Theft Auto V", attributes: [NSAttributedString.Key.kern: 0.38, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
        return label
    }()
    
    lazy var visitReddit: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 20,weight: UIFont.Weight.bold)
        label.numberOfLines = 2
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.05

        label.attributedText = NSMutableAttributedString(string: "Grand Theft Auto V", attributes: [NSAttributedString.Key.kern: 0.38, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
        return label
    }()
    
    lazy var visitWebsite: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 20,weight: UIFont.Weight.bold)
        label.numberOfLines = 2
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.05

        label.attributedText = NSMutableAttributedString(string: "Grand Theft Auto V", attributes: [NSAttributedString.Key.kern: 0.38, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
        return label
    }()
    
    
    public init() {
        super.init(frame: .zero)
        setupUI()
        self.backgroundColor = .white
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
    

}

// MARK: Setup UI

extension DetailView {
    
    public func setupUI() {
        setupBackButtton()
        // setupTitleLable()
        setupBackButtonText()
        setupGameImage()
        setupFavButton()
        setupGameDescriptionLabel()
        setupVisitReddit()
        setupVisitWebsite()
    }
    
    private func setupBackButtton() {
        self.addSubview(backButton)
        _ = backButton.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 55.5, leftConstant: 8.5, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
    
//    private func setupTitleLable() {
//        self.addSubview(gameTitleLabel)
//        _ = gameTitleLabel.anchor(self.topAnchor, left: gameImageView.rightAnchor, bottom: nil, right: self.rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 0, rightConstant: 16, widthConstant: 0, heightConstant: 0)
//    }
    
    private func setupBackButtonText() {
        self.addSubview(backButtonText)
        _ = backButtonText.anchor(self.topAnchor, left: backButton.rightAnchor, bottom: nil, right: nil, topConstant: 55.5, leftConstant: 5.5, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
    
    private func setupFavButton() {
        self.addSubview(favButton)
        _ = favButton.anchor(self.topAnchor, left: nil, bottom: nil, right: self.rightAnchor, topConstant: 55.5, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
    
    private func setupGameImage() {
        self.addSubview(gameImageView)
        _ = gameDescriptionLabel.anchor(backButton.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: self.frame.height / 2.8)
    }
    
    private func setupGameDescriptionLabel() {
        self.addSubview(gameDescriptionLabel)
        _ = gameDescriptionLabel.anchor(gameImageView.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: self.frame.height / 5.7)
    }
    
    private func setupVisitReddit() {
        self.addSubview(visitReddit)
        _ = visitReddit.anchor(gameDescriptionLabel.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: self.frame.height / 15)
    }
    
    private func setupVisitWebsite() {
        self.addSubview(visitWebsite)
        _ = visitWebsite.anchor(visitReddit.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: self.frame.height / 15)
    }
    
}
