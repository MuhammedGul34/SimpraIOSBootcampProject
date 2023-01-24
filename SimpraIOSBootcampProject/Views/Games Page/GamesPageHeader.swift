//
//  GamesPageHeader.swift
//  SimpraIOSBootcampProject
//
//  Created by Muhammed Gül on 16.01.2023.
//

import UIKit

class GamesPageHeader: UICollectionReusableView {
    
    let gameHeaderHorizontalController = GamesHeaderHorizontalController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        addSubview(gameHeaderHorizontalController.view)
        gameHeaderHorizontalController.view.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

