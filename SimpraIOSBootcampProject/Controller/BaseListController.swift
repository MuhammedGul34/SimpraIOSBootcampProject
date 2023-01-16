//
//  BaseListController.swift
//  SimpraIOSBootcampProject
//
//  Created by Muhammed Gül on 16.01.2023.
//

import UIKit

class BaseListController: UICollectionViewController {
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
