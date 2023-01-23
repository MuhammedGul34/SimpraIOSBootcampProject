//
//  PreviewScreenShotsController.swift
//  SimpraIOSBootcampProject
//
//  Created by Muhammed Gül on 19.01.2023.
//

import UIKit
import SDWebImage

class PreviewScreenShotsController: HorizontalSnappingController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    
    var game: GamesDetailsResult? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    class ScreenShotCell: UICollectionViewCell{
        let imageView = UIImageView(cornerRadius: 12)
        
        override init(frame: CGRect){
            super.init(frame: frame)
            addSubview(imageView)
            imageView.fillSuperview()

        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        collectionView.register(ScreenShotCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ScreenShotCell
        let screenShotUrl = self.game?.backgroundImageAdditional
        cell.imageView.sd_setImage(with: URL(string: screenShotUrl ?? "ad"))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 350, height: view.frame.height)
    }
}
