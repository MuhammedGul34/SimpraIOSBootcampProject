//
//  GameHorizontalController.swift
//  SimpraIOSBootcampProject
//
//  Created by Muhammed Gül on 16.01.2023.
//

import UIKit

class GameHorizontalController: HorizontalSnappingController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    
    var gameGroup: SearchResults?
    
    var socialApps = [SocialApp]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(GameRowCell.self, forCellWithReuseIdentifier: cellId)
        
        collectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
       
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gameGroup?.results.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! GameRowCell
        let game = gameGroup?.results[indexPath.item]
        cell.nameLabel.text = game?.name
        cell.released.text = game?.released
        cell.imageView.sd_setImage(with: URL(string: game?.backgroundImage ?? ""))
        return cell
    }
    
    let topBottomPadding: CGFloat = 12
    let lineSpacing: CGFloat = 10
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.height - 2 * topBottomPadding - 2 * lineSpacing) / 3
        return .init(width: view.frame.width - 48, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 12, left: 0, bottom: 12, right: 0)
    }
}
