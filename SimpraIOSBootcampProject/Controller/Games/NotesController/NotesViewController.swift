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
    var gameNote: [NoteEntity]?
    
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
    
    override func viewDidAppear(_ animated: Bool) {super.viewDidAppear(true)
        getData()
    }
    
    func getData(){
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NoteEntity>(entityName: "NoteEntity")
        do {
            let result = try context.fetch(request)
            if result.count > 0 {
                self.gameNote = result
                self.tableView.reloadData()
            }
        } catch {
            print("Error while retrieving data from cache.")
            }
        }
    }

