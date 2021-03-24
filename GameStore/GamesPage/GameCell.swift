//
//  GameCell.swift
//  Deneme
//
//  Created by Hamza IŞIKTAŞ on 17.03.2021.
//

import Foundation
import UIKit

class GameCell: UICollectionViewCell {
    
    static let identifier = "cell"
    
    public var didSelect = false
    
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
    
    lazy var metacriticLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium)

        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.5

        label.attributedText = NSMutableAttributedString(string: "metacritic:", attributes: [NSAttributedString.Key.kern: 0.38, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
        return label
    }()
    
    lazy var metacriticNumLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.textColor = UIColor(red: 0.846, green: 0, blue: 0, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.bold)

        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.16

        label.textAlignment = .right
        label.attributedText = NSMutableAttributedString(string: "96", attributes: [NSAttributedString.Key.kern: 0.38, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
        return label
    }()
    
    lazy var genreLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.textColor = UIColor(red: 0.541, green: 0.541, blue: 0.561, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.regular)

        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.16

        label.attributedText = NSMutableAttributedString(string: "Action, shooter", attributes: [NSAttributedString.Key.kern: -0.08, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        self.backgroundColor = .white
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with game: Game) {

        setImageWithAlamofireImage(imageView: gameImageView, urlString: game.backgroundImage!)
        setTitle(title: game.gameName!)
        setMetacritic(critic: game.metacritic!)
        setGenres(genres: game.genres!)
        
    }
    
    func setTitle(title: String) {
        gameTitleLabel.text = title
    }
    
    func setMetacritic(critic: Int) {
        metacriticNumLabel.text = "\(critic)"
    }
    
    func setGenres(genres: [Genre]) {
        var text: String = ""
        
        if genres.count >= 2 {
            text = genres[0].name! + ", " + genres[1].name!
        }
        else{
            text = genres[0].name!
        }
        
        
        genreLabel.text = text
    }


    func setImageWithAlamofireImage(imageView: UIImageView, urlString: String){
        if let imageUrl = URL(string: urlString) {
            imageView.downloaded(from: imageUrl)
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
        }
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        gameImageView.image = nil
    }
    
    
    
}

// MARK: Setup UI

extension GameCell {
    
    public func setupUI() {
        setupGameImage()
        setupTitleLable()
        setupGenreLabel()
        setupMetacriticLabel()
        setupMetacriticNumLabel()
    }
    
    private func setupGameImage() {
        contentView.addSubview(gameImageView)
        _ = gameImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: nil, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16, widthConstant: self.frame.height, heightConstant: 0)
    }
    
    private func setupTitleLable() {
        contentView.addSubview(gameTitleLabel)
        _ = gameTitleLabel.anchor(self.topAnchor, left: gameImageView.rightAnchor, bottom: nil, right: self.rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 0, rightConstant: 16, widthConstant: 0, heightConstant: 0)
    }
    
    private func setupMetacriticLabel() {
        contentView.addSubview(metacriticLabel)
        _ = metacriticLabel.anchor(nil, left: gameImageView.rightAnchor, bottom: genreLabel.topAnchor, right: nil, topConstant: 0, leftConstant: 16, bottomConstant: 8, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
    
    private func setupMetacriticNumLabel() {
        contentView.addSubview(metacriticNumLabel)
        _ = metacriticNumLabel.anchor(nil, left: metacriticLabel.rightAnchor, bottom: genreLabel.topAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 2, bottomConstant: 8, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
    
    private func setupGenreLabel() {
        contentView.addSubview(genreLabel)
        _ = genreLabel.anchor(nil, left: gameImageView.rightAnchor, bottom: self.bottomAnchor, right: nil, topConstant: 0, leftConstant: 16, bottomConstant: 12, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
    
    
    
}
