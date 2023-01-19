//
//  GameDetailController.swift
//  SimpraIOSBootcampProject
//
//  Created by Muhammed Gül on 18.01.2023.
//

import UIKit
import Alamofire

class GameDetailController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    var gameId: Int! {
        didSet {
            print("Here is ıd:", gameId)
            let request = AF.request("https://api.rawg.io/api/games/\(gameId ?? 3939)?key=e88f2727475f49fb903d6aaf20975174")
            request.responseDecodable(of: GamesDetailsResult.self) { (response) in
                guard let details = response.value else { return }
                print(details.released)
                    }
                }
            }
        
    let detailCellId = "detailCellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(GameDetailCell.self, forCellWithReuseIdentifier: detailCellId)
        navigationItem.largeTitleDisplayMode = .never
    
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: detailCellId, for: indexPath) as! GameDetailCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
}
