//
//  Cell.swift
//  SimpraIOSBootcampProject
//
//  Created by Muhammed Gül on 24.01.2023.
//

import UIKit
import CoreData

class FavouriteViewController: UITableViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var gameCore: [SearchEntity]?
    let cellId = "cellid"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        retrieveFromCoreData()
        tableView.reloadData()
        tableView.register(FavouriteTableViewCell.self, forCellReuseIdentifier: cellId)
       
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameCore?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! FavouriteTableViewCell
        cell.gameCore = gameCore?[indexPath.row]
     return cell
    }
    
    override func viewDidAppear(_ animated: Bool) {super.viewDidAppear(true)
        retrieveFromCoreData()}
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let _ = self.navigationController?.pushViewController(NotesViewController(), animated: true)
           }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
       return 120
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                
                let alert = UIAlertController(title: "", message: "Silmek istediğinize emin misiniz?", preferredStyle: UIAlertController.Style.alert)

            alert.addAction(UIAlertAction(title: "Sil", style: UIAlertAction.Style.default, handler: { _ in
                let context = self.appDelegate.persistentContainer.viewContext
                let commit = self.gameCore?[indexPath.row]
                context.delete(commit!)
                self.gameCore?.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)

                do {
                    try context.save()
                } catch {
                    print("could not delete")
                }
                print("deleting objescts")
                }))
            alert.addAction(UIAlertAction(title: "Vazgeç", style: UIAlertAction.Style.cancel, handler: {_ in
                DispatchQueue.main.async {
                            self.navigationController?.popViewController(animated: true)
                        }
                }))

                self.present(alert, animated: true, completion: nil)
            }
        }
    
    
    func retrieveFromCoreData() {
            let context = appDelegate.persistentContainer.viewContext
            let request = NSFetchRequest<SearchEntity>(entityName: "SearchEntity")

            do {
                let result = try context.fetch(request)
                self.gameCore = result
                self.tableView.reloadData()
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

