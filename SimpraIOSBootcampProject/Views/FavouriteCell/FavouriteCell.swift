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
    
            nameLabel.text = gameCore.map{$0.name ?? "Game "}
            releaseTimeLabel.text = gameCore.map{$0.released ?? "Game "}
            ratingLabel.text = "3.4"
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
    let TextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .init(white: 0.98, alpha: 1)
        textView.constrainWidth(constant: 160)
        textView.constrainHeight(constant: 200)
        textView.layer.cornerRadius = 16
        textView.isScrollEnabled = false
        return textView
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
        
        let overallStackView = VerticalStackView(arrangedSubviews: [infoTopstackView
//                                                                    , TextView
                                                                   ])
        
        addSubview(overallStackView)
        overallStackView.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16))
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
//
//extension FovouriteGamesViewController: UITextViewDelegate{
//    func textViewDidChange(_ textView: UITextView) {
//        print(textView.text)
//    }
//}
