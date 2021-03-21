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
        //myImageView.contentMode = .scaleAspectFill
        //myImageView.layer.masksToBounds = true
        myImageView.backgroundColor = .clear
        return myImageView
        
    }()
    
    lazy var gameTitleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont(name: "SFProDisplay-Bold", size: 20)
        
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.05

        label.attributedText = NSMutableAttributedString(string: "Grand Theft Auto V", attributes: [NSAttributedString.Key.kern: 0.38, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
        return label
    }()
    
    lazy var metacriticLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont(name: "SFProDisplay-Medium", size: 14)

        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.5

        label.attributedText = NSMutableAttributedString(string: "metacritic:", attributes: [NSAttributedString.Key.kern: 0.38, NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
        return label
    }()
    
    lazy var genreLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.textColor = UIColor(red: 0.541, green: 0.541, blue: 0.561, alpha: 1)
        label.font = UIFont(name: "SFProText-Regular", size: 13)

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
    
    public func configure(with url:String) {

        setImageWithAlamofireImage(imageView: gameImageView, urlString: url)

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
        _ = gameTitleLabel.anchor(self.topAnchor, left: gameImageView.rightAnchor, bottom: nil, right: self.rightAnchor, topConstant: 40, leftConstant: 20, bottomConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: 0)
    }
    
    private func setupGenreLabel() {
        contentView.addSubview(genreLabel)
        _ = genreLabel.anchor(nil, left: gameImageView.rightAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 20, bottomConstant: 20, rightConstant: 10, widthConstant: 0, heightConstant: 0)
    }
    
    private func setupMetacriticLabel() {
        contentView.addSubview(metacriticLabel)
        _ = metacriticLabel.anchor(nil, left: gameImageView.rightAnchor, bottom: genreLabel.topAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 20, bottomConstant: 10, rightConstant: 10, widthConstant: 0, heightConstant: 0)
    }
    
}
