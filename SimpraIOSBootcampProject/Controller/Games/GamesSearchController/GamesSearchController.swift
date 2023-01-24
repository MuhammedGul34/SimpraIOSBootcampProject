//
//  GamesSearchController.swift
//  SimpraIOSBootcampProject
//
//  Created by Muhammed Gül on 13.01.2023.
//

import UIKit
import SDWebImage

class GamesSearchController: BaseListController, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    fileprivate let cellId = "gameSearchCellId"
    
    fileprivate let searchController = UISearchController(searchResultsController: nil)
    
    fileprivate let enterSearchTermLabel: UILabel = {
        let label = UILabel()
        label.text = "Please enter search term above...".localized()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: cellId)
        
        collectionView.addSubview(enterSearchTermLabel)
        enterSearchTermLabel.fillSuperview(padding: .init(top: 100, left: 50, bottom: 0, right: 50))
        
        setupSearchBar()
    }
    
    fileprivate func setupSearchBar(){
        definesPresentationContext = true
        navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
    }
    
    var timer: Timer?
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
      
        // adding delay while performing delay
        // throttling search
        timer?.invalidate()
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { _ in
            // fire my search
            Service.shared.fetchGames(searchTerm: searchText) { res, err in
                self.gameResults = res?.results ?? []
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        })
    }
    
    fileprivate var gameResults = [Result]()
    fileprivate func fetchGames(){
    
        Service.shared.fetchGames(searchTerm: "Dota 2") { res, error in
            
            if let error = error {
                print("Failed to fetch apps:", error)
                return
            }
            
            self.gameResults = res?.results ?? []
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
}


extension GamesSearchController {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 350)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        enterSearchTermLabel.isHidden = gameResults.count != 0
        return gameResults.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchResultCell
        
        cell.gameResults = gameResults[indexPath.item]
        return cell
    }
}
