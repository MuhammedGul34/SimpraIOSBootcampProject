//
//  topRated2022Games.swift
//  SimpraIOSBootcampProject
//
//  Created by Muhammed Gül on 21.01.2023.
//

import Foundation

// MARK: - TopRatedGamesOf2022
struct TopRatedGamesOf2022: Codable {
    let count: Int
    let next: String
    let previous: JSONNull?
    let results: [Game]
    let userPlatforms: Bool

    enum CodingKeys: String, CodingKey {
        case count, next, previous, results
        case userPlatforms = "user_platforms"
    }
}

// MARK: - Result
struct Game: Codable {
    let slug, name: String
    let playtime: Int
    let released: String
    let tba: Bool
    let backgroundImage: String
    let rating: Double
    let ratingTop: Int
    let ratingsCount, reviewsTextCount, added: Int
    let metacritic: Int?
    let suggestionsCount: Int
    let updated: String
    let id: Int
    let reviewsCount: Int
   
    enum CodingKeys: String, CodingKey {
        case slug, name, playtime, released, tba
        case backgroundImage = "background_image"
        case rating
        case ratingTop = "rating_top"
        case ratingsCount = "ratings_count"
        case reviewsTextCount = "reviews_text_count"
        case added
        case metacritic
        case suggestionsCount = "suggestions_count"
        case updated, id
        case reviewsCount = "reviews_count"
       
       
    }
}

