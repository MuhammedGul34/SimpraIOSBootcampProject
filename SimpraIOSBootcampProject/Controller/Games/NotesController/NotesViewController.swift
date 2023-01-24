//
//  NotesViewController.swift
//  SimpraIOSBootcampProject
//
//  Created by Muhammed Gül on 24.01.2023.
//

import UIKit
import CoreData

class NotesViewController: UIViewController {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var gameNote: [SearchEntity]?
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(NoteTableViewCell.self, forCellReuseIdentifier: NoteTableViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        view.addSubview(tableView)
        tableView.separatorStyle = .none
        getData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
      }
    }

 
extension NotesViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    override func viewDidAppear(_ animated: Bool) {super.viewDidAppear(true)
        getData()
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
         let cell = tableView.dequeueReusableCell(withIdentifier: NoteTableViewCell.identifier, for: indexPath) as! NoteTableViewCell
         cell.viewController = self
         cell.selectionStyle = .none
         cell.gameNote = gameNote?[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300 
    }
    
    private func getData(){
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<SearchEntity>(entityName: "SearchEntity")

        do {
            let result = try context.fetch(request)
            self.gameNote = result
            self.tableView.reloadData()
            print("Data Camed From CoreData\(result)")
        } catch {
            print("Error while retrieving data from cache.")
        }
    }
    
}
