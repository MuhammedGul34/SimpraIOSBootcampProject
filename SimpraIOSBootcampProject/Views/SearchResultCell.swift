//
//  SearchResultCell.swift
//  SimpraIOSBootcampProject
//
//  Created by Muhammed Gül on 13.01.2023.
//

import UIKit

class SearchResultCell: UICollectionViewCell {
    
    let gameIconImageView : UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .red
        iv.widthAnchor.constraint(equalToConstant: 64).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 64).isActive = true
        iv.layer.cornerRadius = 12
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
        imageView.backgroundColor = .blue
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
