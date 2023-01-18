//
//  GamesController.swift
//  SimpraIOSBootcampProject
//
//  Created by Muhammed Gül on 16.01.2023.
//

import UIKit

class GamesPageController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "id"
    let headerId = "headerId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(GamesGroupCell.self, forCellWithReuseIdentifier: cellId)
        
        collectionView.register(GamesPageHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        
        
        fetchData()
        
    }
    
    // TODO: Editors Choice Assigment
    var editorsChoiceGames: SearchResults?
    
    fileprivate func fetchData(){
        Service.shared.fetchGames { gameGroup, err in
            if let err = err {
                print("Failed to fetch games:", err)
            }
            self.editorsChoiceGames = gameGroup
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! GamesPageHeader
        header.gameHeaderHorizontalController
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! GamesGroupCell
        cell.titleLabel.text = editorsChoiceGames?.seoTitle
        cell.horizontalController.gameGroup = editorsChoiceGames
        cell.horizontalController.collectionView.reloadData()
        return cell
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 16, left: 0, bottom: 0, right: 0)
    }
}
