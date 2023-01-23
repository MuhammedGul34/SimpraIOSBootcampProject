//
//  GameDetailController.swift
//  SimpraIOSBootcampProject
//
//  Created by Muhammed Gül on 18.01.2023.
//

import UIKit
import Alamofire
import SDWebImage

class GameDetailController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    var gameId: Int?
    var game: GamesDetailsResult?
        
    let detailCellId = "detailCellId"
    let previewCellId = "previewCellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchDetail()
        
        collectionView.register(GameDetailCell.self, forCellWithReuseIdentifier: detailCellId)
        navigationItem.largeTitleDisplayMode = .never
        
        collectionView.register(PreviewCell.self, forCellWithReuseIdentifier: previewCellId)
    
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: detailCellId, for: indexPath) as! GameDetailCell
            cell.game = game
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: previewCellId, for: indexPath) as! PreviewCell
            cell.horizontalController.game = self.game
            return cell
        }
        
      
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let dummyCell = GameDetailCell(frame: .init(x: 0, y: 0, width: view.frame.width, height: 1000))
        
        if indexPath.item == 0 {
            dummyCell.game = game
            dummyCell.layoutIfNeeded()
            
            let estimatedSize = dummyCell.systemLayoutSizeFitting(.init(width: view.frame.width, height: 1000))

            return .init(width: view.frame.width, height: estimatedSize.height)
        } else {
            return .init(width: view.frame.width, height: 500)
        }
    }
    
    func fetchDetail(){
        let request = AF.request("https://api.rawg.io/api/games/\(gameId ?? 3939)?key=e88f2727475f49fb903d6aaf20975174")
        request.responseDecodable(of: GamesDetailsResult.self) { (response) in
            guard let game = response.value else { return }
            self.game = game
            DispatchQueue.main.async{
                self.collectionView.reloadData()
            }
        }
    }
}
