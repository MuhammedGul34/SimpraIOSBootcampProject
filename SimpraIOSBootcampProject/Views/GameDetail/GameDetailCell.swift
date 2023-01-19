//
//  GameDetailCell.swift
//  SimpraIOSBootcampProject
//
//  Created by Muhammed Gül on 19.01.2023.
//

import UIKit

class GameDetailCell: UICollectionViewCell {
    
    let gameIconImageView = UIImageView(cornerRadius: 16)
    
    let nameLabel = UILabel(text: "Game Name", font: .boldSystemFont(ofSize: 24), numberOflines: 2 )
    
    let whatisNewLabel = UILabel(text: "What's New", font: .systemFont(ofSize: 16))
    
    let addFavoriteButton = UIButton(title: "Favorite")
    
    let descriptionLabel = UILabel(text: "Description", font: .boldSystemFont(ofSize: 20))
    
    let releaseNoteLabel = UILabel(text: "Release Notes", font: .systemFont(ofSize: 16), numberOflines: 0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        gameIconImageView.backgroundColor = .red
        gameIconImageView.constrainWidth(constant: 140)
        gameIconImageView.constrainHeight(constant: 140)
        
        addFavoriteButton.backgroundColor = .systemBlue
        addFavoriteButton.constrainHeight(constant: 32)
        addFavoriteButton.layer.cornerRadius = 32 / 2
        addFavoriteButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        addFavoriteButton.setTitleColor(.white, for: .normal)
        addFavoriteButton.constrainWidth(constant: 80)
        
        
        let stackView = VerticalStackView(arrangedSubviews: [
            UIStackView(arrangedSubviews: [
                gameIconImageView,
                VerticalStackView(arrangedSubviews: [
                    nameLabel,
                    UIStackView(arrangedSubviews: [addFavoriteButton, UIView()]),
                    UIView()
                    ], spacing: 12)
                ], customSpacing: 20),
            whatisNewLabel,
            descriptionLabel
            ], spacing: 16)
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 20, left: 20, bottom: 20, right: 20))
  
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension UIStackView {
    convenience init(arrangedSubviews: [UIView], customSpacing: CGFloat = 0) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.spacing = customSpacing
    }
}
