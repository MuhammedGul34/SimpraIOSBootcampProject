//
//  GameDetailModel.swift
//  SimpraIOSBootcampProject
//
//  Created by Muhammed Gül on 19.01.2023.
//

import Foundation

// MARK: - GamesDetailsResult
struct GamesDetailsResult: Codable {
    let id: Int
    let slug, name, description: String
    let metacritic: Int
    let released: String
    let backgroundImage, backgroundImageAdditional: String
    let rating: Double
    let descriptionRaw: String

    enum CodingKeys: String, CodingKey {
        case id, slug, name
        case description, metacritic
        case released
        case backgroundImage = "background_image"
        case backgroundImageAdditional = "background_image_additional"
        case rating
        case descriptionRaw = "description_raw"
    }
}


// MARK: - Developer
struct Developer: Codable {
    let id: Int
    let name, slug: String
    let gamesCount: Int
    let imageBackground: String
    let domain: String?
  

    enum CodingKeys: String, CodingKey {
        case id, name, slug
        case gamesCount = "games_count"
        case imageBackground = "image_background"
        case domain
    }
}



