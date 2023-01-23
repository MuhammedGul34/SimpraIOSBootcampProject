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
    var socialApps = [SocialApp]()
    let activityIndicatorView: UIActivityIndicatorView = {
        let aiv = UIActivityIndicatorView(style: .large )
        aiv.color = .black
        aiv.startAnimating()
        aiv.hidesWhenStopped = true
        return aiv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(GamesGroupCell.self, forCellWithReuseIdentifier: cellId)
        
        collectionView.register(GamesPageHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        
        
        fetchData()
        
        view.addSubview(activityIndicatorView)
        activityIndicatorView.fillSuperview()
    
    }
    
    var groups = [TopRatedGamesOf2022]()
    
    fileprivate func fetchData() {
        
        var group1: TopRatedGamesOf2022?
        var group2: TopRatedGamesOf2022?
        var group3: TopRatedGamesOf2022?
        
        // help you sync your data fetches together
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        Service.shared.fetchTopRatedGames { (TopRatedGamesOf2022, err) in
            print("Done with top grossing")
            dispatchGroup.leave()
            group1 = TopRatedGamesOf2022
        }
        
        dispatchGroup.enter()
        Service.shared.GamesBest{ (TopRatedGamesOf2022, err) in
            print("Done with top grossing")
            dispatchGroup.leave()
            group2 = TopRatedGamesOf2022
        }
        
        dispatchGroup.enter()
        Service.shared.Games2001{ (TopRatedGamesOf2022, err) in
            print("Done with top grossing")
            dispatchGroup.leave()
            group3 = TopRatedGamesOf2022
        }
        
        
        
        
        // completion
        dispatchGroup.notify(queue: .main) {
            print("completed your dispatch group tasks...")
            
            self.activityIndicatorView.stopAnimating()
            
            if let group = group1 {
                self.groups.append(group)
            }
            if let group = group2 {
                self.groups.append(group)
            }
            if let group = group3 {
                self.groups.append(group)
            }
            self.collectionView.reloadData()
        }
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! GamesPageHeader
        header.gameHeaderHorizontalController.socialApps = self.socialApps
        header.gameHeaderHorizontalController.collectionView.reloadData()
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 230)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groups.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! GamesGroupCell
        
        let appGroup = groups[indexPath.item]
        
        if indexPath.item == 0 {
            cell.titleLabel.text = "Most Choosen Games from 2001".localized()
        } else if indexPath.item == 1 {
            cell.titleLabel.text = "Top Rated games".localized()
        } else {
            cell.titleLabel.text = "Best Games".localized()
        }
         
        cell.horizontalController.gameGroup = appGroup
        cell.horizontalController.collectionView.reloadData()
        cell.horizontalController.didSelectHandler = { [weak self] Result in
            
            let controller = GameDetailController()
            controller.gameId = Result.id
            controller.navigationItem.title = Result.name
            self?.navigationController?.pushViewController(controller, animated: true)
            
        }
        return cell
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 16, left: 0, bottom: 0, right: 0)
    }
}
