//
//  GameDetailCell.swift
//  SimpraIOSBootcampProject
//
//  Created by Muhammed Gül on 19.01.2023.
//

import UIKit
import CoreData

class GameDetailCell: UICollectionViewCell {
    
    var game: GamesDetailsResult! {
        didSet {
            releasedLabel.text = "Released: \(game?.released ?? "2013-08-13".localized())"
            nameLabel.text = game?.name
            descriptionLabel.text = game?.descriptionRaw
            gameIconImageView.sd_setImage(with: URL(string: game?.backgroundImage ?? ""))
        }
    }
    
    let gameIconImageView = UIImageView(cornerRadius: 16)
    
    let nameLabel = UILabel(text: "Game Name", font: .boldSystemFont(ofSize: 24), numberOflines: 2 )
    
    let releasedLabel = UILabel(text: "Released", font: .boldSystemFont(ofSize: 16))
    
    let addFavoriteButton = UIButton(type: .custom)
    
    let descriptionLabel = UILabel(text: "Description", font: .systemFont(ofSize: 14), numberOflines: 0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        gameIconImageView.constrainWidth(constant: 140)
        gameIconImageView.constrainHeight(constant: 140)
        
        addFavoriteButton.backgroundColor = .white
        addFavoriteButton.constrainHeight(constant: 80)
        addFavoriteButton.layer.cornerRadius = 80 / 2
        addFavoriteButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        addFavoriteButton.setTitleColor(.white, for: .normal)
        addFavoriteButton.constrainWidth(constant: 80)
        addFavoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
        addFavoriteButton.tintColor = .red
        
        
        
        let stackView = VerticalStackView(arrangedSubviews: [
            UIStackView(arrangedSubviews: [
                gameIconImageView,
                VerticalStackView(arrangedSubviews: [
                    nameLabel,
                    UIStackView(arrangedSubviews: [addFavoriteButton, UIView()]),
                    UIView()
                    ], spacing: 12)
                ], customSpacing: 20),
            releasedLabel,
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
