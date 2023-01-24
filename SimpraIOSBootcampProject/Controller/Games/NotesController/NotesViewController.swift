//
//  NotesViewController.swift
//  SimpraIOSBootcampProject
//
//  Created by Muhammed Gül on 24.01.2023.
//

import UIKit

class NotesViewController: UITableViewController {

    let cellId = "NotesCell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.register(NoteTableViewCell.self, forCellReuseIdentifier: cellId)
        
    }
   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
     return cell
    }
    
}
