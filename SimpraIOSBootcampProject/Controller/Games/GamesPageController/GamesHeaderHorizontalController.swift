//
//  GamesHeaderHorizontalController.swift
//  SimpraIOSBootcampProject
//
//  Created by Muhammed Gül on 16.01.2023.
//

import UIKit

class GamesHeaderHorizontalController: HorizontalSnappingController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    let header = [Header]()
    var socialApps = [SocialApp]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(GameHeaderCell.self, forCellWithReuseIdentifier: cellId)
        
        collectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 48, height: view.frame.height)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
        // TODO: fetch special part and display them 
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! GameHeaderCell
        
        let header = HeaderDescriptions[indexPath.item]
                cell.companyLabel.text = header.name
                cell.titleLabel.text = header.description
                cell.imageView.image = UIImage(named: header.imageName)
        return cell
    }
}
