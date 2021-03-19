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
    
    lazy var gameImageView: UIImageView = {
        let myImageView = UIImageView()
        //myImageView.clipsToBounds = true
        //myImageView.contentMode = .scaleAspectFit
        //myImageView.layer.masksToBounds = true
        myImageView.backgroundColor = .clear
        return myImageView
        
    }()
    
    lazy var gameTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "ert"
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont(name: "HelveticaNeue-UltraLight", size: 30)
        return label
    }()
    
    lazy var metacriticLabel: UILabel = {
        let label = UILabel()
        label.text = "ert"
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont(name: "HelveticaNeue-UltraLight", size: 30)
        return label
    }()
    
    lazy var genreLabel: UILabel = {
        let label = UILabel()
        label.text = "ert"
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont(name: "HelveticaNeue-UltraLight", size: 30)
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
    
    public func configure(with url:String) {

        setImageWithAlamofireImage(imageView: gameImageView, urlString: url)

    }


    func setImageWithAlamofireImage(imageView: UIImageView, urlString: String){
        if let imageUrl = URL(string: urlString) {
            setupUI()
            imageView.downloaded(from: imageUrl)
        }
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        gameImageView.image = nil
    }
    
    
    
}

extension GameCell {
    
    public func setupUI() {
        setupGameImage()
        setupTitleLable()
        setupGenreLabel()
        setupMetacriticLabel()
    }
    
    private func setupGameImage() {
        contentView.addSubview(gameImageView)
        _ = gameImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: nil, topConstant: 10, leftConstant: 10, bottomConstant: 10, rightConstant: 10, widthConstant: self.frame.height, heightConstant: 0)
    }
    
    private func setupTitleLable() {
        contentView.addSubview(gameTitleLabel)
        _ = gameTitleLabel.anchor(self.topAnchor, left: gameImageView.rightAnchor, bottom: nil, right: self.rightAnchor, topConstant: 20, leftConstant: 20, bottomConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: 10)
    }
    
    private func setupGenreLabel() {
        contentView.addSubview(gameTitleLabel)
        _ = gameTitleLabel.anchor(nil, left: gameImageView.rightAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 20, bottomConstant: 20, rightConstant: 10, widthConstant: 0, heightConstant: 20)
    }
    
    private func setupMetacriticLabel() {
        contentView.addSubview(gameTitleLabel)
        _ = gameTitleLabel.anchor(nil, left: gameImageView.rightAnchor, bottom: gameTitleLabel.topAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 20, bottomConstant: 10, rightConstant: 10, widthConstant: 0, heightConstant: 20)
    }
    
}
