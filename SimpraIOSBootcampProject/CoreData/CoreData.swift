//
//  CoreData.swift
//  SimpraIOSBootcampProject
//
//  Created by Muhammed Gül on 19.01.2023.
//

import UIKit
import CoreData

class CoreData {
    
    static let sharedInstance = CoreData()
    private init(){}
    
    private let container: NSPersistentContainer? = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
    
    private let fetchRequest = NSFetchRequest<SearchEntity>(entityName: "SearchEntity")
    
    func saveDataof(games: [Result]) {
        self.container?.performBackgroundTask{ [weak self] (context) in
            self?.deleteObjectsFromCoreData(context: context)
            self?.saveDataToCoreData(games: games, context: context)
        }
    }
    
    //MARK: Delete Core Data objects before saving new data
    
    private func deleteObjectsFromCoreData(context: NSManagedObjectContext) {
        do {
            let objects = try context.fetch(fetchRequest)
            
            _ = objects.map({ context.delete($0)})
            
            try context.save()
        } catch {
            print("Deleting Error:\(error)")
        }
        
    }
        
        private func saveDataToCoreData(games: [Result], context: NSManagedObjectContext) {
            context.perform {
                for game in games {
                    let searchEntity = SearchEntity(context: context)
                    searchEntity.name = game.name
                    searchEntity.rating = game.rating
                    searchEntity.released = game.released
//                    TODO: Fix This
//                    searchEntity.shortScreenshots = game.shortScreenshots
                    let shortScreenshots = game.shortScreenshots
                    searchEntity.shortScreenshots1 = shortScreenshots[0].image
                    searchEntity.shortScreenshots2 = shortScreenshots[1].image
                    searchEntity.shortScreenshots2 = shortScreenshots[2].image
                }
                
                do {
                    try context.save()
                } catch {
                    fatalError("Failure to save context:\(error)")
                }
                
            }
        }
        
    }

