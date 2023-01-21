//
//  FavouriteCell.swift
//  SimpraIOSBootcampProject
//
//  Created by Muhammed Gül on 21.01.2023.
//

import UIKit

class FavouriteCell: UICollectionViewCell {
    
    var gameResults: Result! {
        didSet {
            nameLabel.text = gameResults.name
            if let release = gameResults.released {
                releaseTimeLabel.text = "Released:\(release)"
            }
            ratingLabel.text = "Rating:\(String(gameResults.rating))"
            
            let url = URL(string: gameResults.background_image ?? "")
            gameIconImageView.sd_setImage(with: url)
            
        }
    }

    let gameIconImageView : UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = UIColor(white: 0.95, alpha: 1)
        iv.widthAnchor.constraint(equalToConstant: 64).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 64).isActive = true
        iv.layer.cornerRadius = 12
        iv.clipsToBounds = true
        return iv
    }()
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Game Name"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    let releaseTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "Kind of Game"
        return label
    }()
    let ratingLabel: UILabel = {
        let label = UILabel()
        label.text = "1.25M"
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 16
        backgroundColor = .systemGray6
        
        let infoTopstackView = UIStackView(arrangedSubviews: [
        gameIconImageView,
        VerticalStackView(arrangedSubviews: [nameLabel, releaseTimeLabel, ratingLabel])])
        
        infoTopstackView.spacing = 12
        infoTopstackView.alignment = .center
        
        addSubview(infoTopstackView)
        infoTopstackView.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16))
        
        gameIconImageView.backgroundColor = .red
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

