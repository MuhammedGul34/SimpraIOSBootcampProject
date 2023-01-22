//
//  GameHeaderCell.swift
//  SimpraIOSBootcampProject
//
//  Created by Muhammed Gül on 16.01.2023.
//

import UIKit

class GameHeaderCell: UICollectionViewCell {
    
    
    let companyLabel = UILabel(text: "Grand Theft Auto IV", font: .boldSystemFont(ofSize: 12))
    
    let titleLabel = UILabel(text: "What does the American Dream mean today?", font: .systemFont(ofSize: 16))
    
    let imageView = UIImageView(cornerRadius: 8)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        companyLabel.textColor = .red
        titleLabel.numberOfLines = 2
        
        let stackView = VerticalStackView(arrangedSubviews: [ companyLabel, titleLabel, imageView
        ],spacing: 12)
        
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 16, left: 0, bottom: 0, right: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
