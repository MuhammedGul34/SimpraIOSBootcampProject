//
//  FovouriteGamesViewController.swift
//  SimpraIOSBootcampProject
//
//  Created by Muhammed Gül on 21.01.2023.
//

import UIKit
import CoreData

class FovouriteGamesViewController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    var gameCore: [SearchEntity]?
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        
//        deleteAllRecords(entity : "SearchEntity")
        
        retrieveFromCoreData()
        
        collectionView.register(FavouriteCell.self, forCellWithReuseIdentifier: cellId)
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gameCore?.count ?? 0 
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! FavouriteCell
        cell.gameCore = gameCore?[indexPath.row]
        self.collectionView.reloadData()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 48 , height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 5, left: 0, bottom: 5, right: 0)
    }
    
    func retrieveFromCoreData() {

            let context = appDelegate.persistentContainer.viewContext
            let request = NSFetchRequest<SearchEntity>(entityName: "SearchEntity")

            do {
                let result = try context.fetch(request)
                self.gameCore = result
                print("Data Camed From CoreData\(result)")
            } catch {
                print("Error while retrieving data from cache.")
            }
        }
    
//    func deleteAllRecords(entity : String) {
//        let context = appDelegate.persistentContainer.viewContext
//            let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
//            let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
//
//            do {
//                try context.execute(deleteRequest)
//                try context.save()
//            } catch {
//                print ("There was an error")
//            }
//        }

    
}
