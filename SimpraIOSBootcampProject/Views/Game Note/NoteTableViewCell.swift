//
//  NoteTableViewCell.swift
//  SimpraIOSBootcampProject
//
//  Created by Muhammed Gül on 24.01.2023.
//

import UIKit
import CoreData

class NoteTableViewCell: UITableViewCell {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    var gameNote: NoteEntity! {
        didSet {
            if let name = gameNote.map({$0.gameNameLabel}) {
                gamenametextField.text = name
            }
            if let note = gameNote.map({$0.gameCommentLabel}){
                gameNoteTextField.text = note
            }
        }
    }
    
    weak var viewController : NotesViewController? = nil
    static let identifier = "NoteTableViewCell"
  
    var gamenametextField : UITextField = {
        let txtGameName = UITextField()
        txtGameName.placeholder = "Please enter the game to note".localized()
        txtGameName.backgroundColor = .white
        txtGameName.layer.cornerRadius = 5
        return txtGameName
    }()
    var gameNoteTextField : UITextField = {
        let TextField = UITextField()
        TextField.backgroundColor = .white
        TextField.placeholder = "Please enter the note the game".localized()
        TextField.layer.cornerRadius = 5
        return TextField
    }()
    
    lazy var saveButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Save", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.backgroundColor = UIColor(ciColor: .black)
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        button.layer.cornerRadius = 16
        button.addTarget(self, action: #selector(handleSaveText), for: .touchUpInside)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.layer.cornerRadius = 30
        contentView.backgroundColor = .systemGray6
        contentView.addSubview(gamenametextField)
        contentView.addSubview(gameNoteTextField)
        contentView.addSubview(saveButton)
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        gamenametextField.frame = CGRect(x: 10, y: 40, width: contentView.frame.size.width - 20 , height: 30)
        gameNoteTextField.frame = CGRect(x: 10, y:60+gamenametextField.frame.size.height,
                                         width: contentView.frame.size.width - 20, height: 150)
        saveButton.frame = CGRect(x:contentView.frame.size.width / 2 - 40, y: 100+gameNoteTextField.frame.size.height, width: 80, height: 32)
    }
    
    @objc func handleSaveText(){
        if  gamenametextField.text?.count ?? 0 > 0 && gameNoteTextField.text?.count ?? 0 > 0 {
            let context = appDelegate.persistentContainer.viewContext
            if let entity = NSEntityDescription.entity(forEntityName: "NoteEntity", in: context){
                let object = NSManagedObject(entity: entity, insertInto: context)
                object.setValue(gamenametextField.text, forKey: "gameNameLabel")
                object.setValue(gameNoteTextField.text, forKey: "gameCommentLabel")
            }
                do {
                    try context.save()
                } catch {
                    print("Error to save coredata",error)
                }
            } else {
                let alert = UIAlertController(title: "Textfields cannot be nil!".localized(), message: "Please enter your comment before saving.".localized(), preferredStyle: UIAlertController.Style.alert)
                
                alert.addAction(UIAlertAction(title: "Oops!".localized(), style: .cancel))
                viewController?.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    
    

