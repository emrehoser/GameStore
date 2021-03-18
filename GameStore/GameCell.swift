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
        myImageView.clipsToBounds = true
        myImageView.contentMode = .scaleAspectFill
        myImageView.layer.masksToBounds = true
        myImageView.layer.cornerRadius = 150.0 / 2.0
        myImageView.backgroundColor = .blue
        myImageView.layer.borderWidth = 2
        myImageView.layer.borderColor = CGColor.init(red: 255, green: 0, blue: 0, alpha: 0.7)
        return myImageView
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .red
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    public func configure(with url:String) {
//
//        setImageWithAlamofireImage(imageView: gameImageView, urlString: url)
//
//    }


//    func setImageWithAlamofireImage(imageView: UIImageView, urlString: String){
//        if let imageUrl = URL(string: urlString) {
//            imageView.af.setImage(withURL: imageUrl)
//        }
//    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        gameImageView.image = nil
    }
    
    
    
}

extension GameCell {
    
    public func setupUI() {
        setupGameImage()
    }
    
    private func setupGameImage() {
        contentView.addSubview(gameImageView)
        _ = gameImageView.anchor(contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: nil, topConstant: 10, leftConstant: 10, bottomConstant: 10, rightConstant: 10, widthConstant: 0, heightConstant: contentView.frame.width)
    }
}
