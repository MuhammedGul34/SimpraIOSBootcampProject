//
//  NoteTableViewCell.swift
//  SimpraIOSBootcampProject
//
//  Created by Muhammed Gül on 24.01.2023.
//

import UIKit

class NoteTableViewCell: UITableViewCell {
    
    static let identifier = "NoteTableViewCell"

    var gamenametextField : UITextField = {
        let txtGameName = UITextField()
        txtGameName.placeholder = "Please enter the game to note".localized()
        txtGameName.backgroundColor = .white
        return txtGameName
    }()
    var gameNoteTextField : UITextField = {
        let TextField = UITextField()
        TextField.backgroundColor = .white
        TextField.placeholder = "Please enter the note the game".localized()
        return TextField
    }()
    
    let saveButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Save", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.backgroundColor = UIColor(ciColor: .black)
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        button.layer.cornerRadius = 16
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
     
        contentView.layer.cornerRadius = 16
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
        gamenametextField.frame = CGRect(x: 5, y: 10, width: contentView.frame.size.width - 16 , height: 30)
        
        gameNoteTextField.frame = CGRect(x: 5, y:30+gamenametextField.frame.size.height,
                                         width: contentView.frame.size.width - 16, height: 150)
        
        saveButton.frame = CGRect(x:contentView.frame.size.width / 2 - 40, y: 70+gameNoteTextField.frame.size.height, width: 80, height: 32)
    }
    
        
}
