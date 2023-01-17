//
//  SearchResultCell.swift
//  SimpraIOSBootcampProject
//
//  Created by Muhammed Gül on 13.01.2023.
//

import UIKit


class SearchResultCell: UICollectionViewCell {
    
    var gameResults: Result! {
        didSet {
            nameLabel.text = gameResults.name
            releaseTimeLabel.text = "Released:\(gameResults.released)"
            ratingLabel.text = "Rating:\(String(gameResults.rating))"
            
            let url = URL(string: gameResults.backgroundImage)
            gameIconImageView.sd_setImage(with: url)
            
            screenshot1ImageView.sd_setImage(with: URL(string: gameResults.shortScreenshots[0].image))
            
            if gameResults.shortScreenshots.count > 1{
                screenshot2ImageView.sd_setImage(with: URL(string: gameResults.shortScreenshots[1].image))
            }
            if gameResults.shortScreenshots.count > 2{
                screenshot3ImageView.sd_setImage(with: URL(string: gameResults.shortScreenshots[2].image))
            }
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
//    TODO: Specialize from data to name
    let releaseTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "Kind of Game"
        return label
    }()
//    TODO: Specialize from data to name
    let ratingLabel: UILabel = {
        let label = UILabel()
        label.text = "1.25M"
        return label
    }()
    
    let getButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("GET", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.backgroundColor = UIColor(white: 0.95, alpha: 1)
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        button.layer.cornerRadius = 16
        return button
    }()
    
    lazy var screenshot1ImageView = createScreenShotImageView()
    lazy var screenshot2ImageView = createScreenShotImageView()
    lazy var screenshot3ImageView = createScreenShotImageView()
    
    func createScreenShotImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        imageView.contentMode = .scaleAspectFill
        return imageView
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let infoTopstackView = UIStackView(arrangedSubviews: [
        gameIconImageView,
        VerticalStackView(arrangedSubviews: [
            nameLabel, releaseTimeLabel, ratingLabel
        ]),
        getButton
        ])
        
        infoTopstackView.spacing = 12
        infoTopstackView.alignment = .center
        
        let screenShotsStackView = UIStackView(arrangedSubviews: [
            screenshot1ImageView, screenshot2ImageView, screenshot3ImageView
        ])
        
        screenShotsStackView.spacing = 12
        screenShotsStackView.distribution = .fillEqually
        
        let overallStackView = VerticalStackView(arrangedSubviews: [infoTopstackView, screenShotsStackView], spacing: 16)
       
        addSubview(overallStackView)
        overallStackView.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
