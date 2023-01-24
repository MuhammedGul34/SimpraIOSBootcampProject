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
  
    override func viewDidAppear(_ animated: Bool) {super.viewDidAppear(true)
        retrieveFromCoreData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let _ = self.navigationController?.pushViewController(NotesViewController(), animated: true)
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
            } catch {
                print("Error while retrieving data from cache.")
            }
        }
    }

