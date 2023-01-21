//
//  topRated2022Games.swift
//  SimpraIOSBootcampProject
//
//  Created by Muhammed Gül on 21.01.2023.
//

import Foundation

// MARK: - TopRatedGamesOf2022
struct TopRatedGamesOf2022: Codable {
    let next: String
    let results: [Game]

    enum CodingKeys: String, CodingKey {
        case next, results
    }
}

// MARK: - Result
struct Game: Codable {
    let slug, name: String
    let released: String
    let backgroundImage: String
    let rating: Double
    let ratingTop: Int
    let id: Int
   
   
    enum CodingKeys: String, CodingKey {
        case slug, name, released
        case backgroundImage = "background_image"
        case rating
        case ratingTop = "rating_top"
        case id
    }
}

