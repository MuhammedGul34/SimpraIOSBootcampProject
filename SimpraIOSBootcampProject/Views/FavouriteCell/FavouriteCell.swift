//
//  FavouriteCell.swift
//  SimpraIOSBootcampProject
//
//  Created by Muhammed Gül on 21.01.2023.
//

import UIKit
import CoreData

class FavouriteCell: UICollectionViewCell {
    
    var gameCore: SearchEntity! {
        didSet {
    
            nameLabel.text = gameCore.map{$0.name ?? "Game"}
            releaseTimeLabel.text = gameCore.map{$0.released ?? "Game"}
            ratingLabel.text = gameCore.map{"ID: \($0.id)"}
            let url = URL(string: gameCore.map{$0.image ?? "Game"}!)
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
    var UnaddFavoriteButton = UIButton()

//    {
//        didSet
//        {
//            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(subscribe))
//            UnaddFavoriteButton.addGestureRecognizer(tapGestureRecognizer)
//        }
//    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 16
        backgroundColor = .systemGray6
    
        gameIconImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(subscribe)))
        gameIconImageView.isUserInteractionEnabled = true

 
        UnaddFavoriteButton.backgroundColor = .white
        UnaddFavoriteButton.constrainHeight(constant: 80)
        UnaddFavoriteButton.layer.cornerRadius = 80 / 2
        UnaddFavoriteButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        UnaddFavoriteButton.setTitleColor(.white, for: .normal)
        UnaddFavoriteButton.constrainWidth(constant: 150)
        UnaddFavoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
        UnaddFavoriteButton.addTarget(self, action: #selector(subscribe), for: .touchUpInside)

        
//        let infoTopstackView = UIStackView(arrangedSubviews: [
//        gameIconImageView,
//        VerticalStackView(arrangedSubviews: [nameLabel, releaseTimeLabel, ratingLabel])])
//
//        infoTopstackView.spacing = 12
//        infoTopstackView.alignment = .center
//
//
//        let overallStackView = VerticalStackView(arrangedSubviews: [infoTopstackView, UnaddFavoriteButton])
//        overallStackView.distribution = .fillEqually
//        addSubview(overallStackView)
//        overallStackView.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16))
//
//
        
        addSubview(UnaddFavoriteButton)
        UnaddFavoriteButton.fillSuperview(padding: .init(top: 30, left: 30, bottom: 30, right: 30))
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func subscribe() {
        print("Deleting row")
    }
    
}

