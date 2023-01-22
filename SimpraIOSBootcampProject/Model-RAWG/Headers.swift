//
//  Headers.swift
//  SimpraIOSBootcampProject
//
//  Created by Muhammed Gül on 18.01.2023.
//

import UIKit

struct Header {
    var name: String
    var description: String
    var imageName: String
}

let HeaderDescriptions = [
    Header(name: "Grand Theft Auto IV", description: "What does the American Dream mean today?".localized(), imageName: "grand"),
    Header(name: "Middle-earth: Shadow of Mordor", description: "Fight through Mordor and uncover the truth of the spirit that compels you".localized(), imageName: "middleearth"),
    Header(name: "Half-Life 2: Episode One", description: "it's a battle to escape the ruins of the gutted Citadel and the city itself.".localized(), imageName: "halflife")
]
