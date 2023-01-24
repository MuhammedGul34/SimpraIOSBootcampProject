//
//  NoteTableViewCell.swift
//  SimpraIOSBootcampProject
//
//  Created by Muhammed Gül on 24.01.2023.
//

import UIKit

class NoteTableViewCell: UITableViewCell {

    var gamenametextField : UITextField = {
        let txtGameName = UITextField()
        txtGameName.placeholder = "Please enter the game to note".localized()
        return txtGameName
    }()
    var gameNoteTextField : UITextField = {
        let txtNote = UITextField()
        txtNote.placeholder = "Please enter the note the game".localized()
        return txtNote
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
       
        let stackView = VerticalStackView(arrangedSubviews: [gamenametextField, gameNoteTextField], spacing: 20)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
