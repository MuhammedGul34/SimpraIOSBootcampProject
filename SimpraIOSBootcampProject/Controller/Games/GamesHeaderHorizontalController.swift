//
//  GamesHeaderHorizontalController.swift
//  SimpraIOSBootcampProject
//
//  Created by Muhammed Gül on 16.01.2023.
//

import UIKit

class GamesHeaderHorizontalController: HorizontalSnappingController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    
    var headerVariable = [Header]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(GameHeaderCell.self, forCellWithReuseIdentifier: cellId)
        
        collectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 48, height: view.frame.height)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
        // TODO: fetch special part and display them 
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! GameHeaderCell
        cell.companyLabel.text = "Grand Theft Auto IV"
        cell.titleLabel.text = "What does the American Dream mean today?"
        cell.imageView.image = UIImage(named: "grand")
        return cell
    }
}
