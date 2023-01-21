//
//  Model.swift
//  SimpraIOSBootcampProject
//
//  Created by Muhammed Gül on 15.01.2023.
//

import Foundation

// MARK: - SearchResults
struct SearchResults: Codable {
    let count: Int
    let next, previous: String
    let results: [Result]
    
    enum CodingKeys: String, CodingKey {
        case count, next, previous, results
    }
}

// MARK: - Result
struct Result: Codable {
    let id: Int
    let slug, name, released: String
    let backgroundImage: String
    let rating: Double
    let ratingTop: Int
    let metacritic: Int?
    let shortScreenshots: [ShortScreenshot]

    enum CodingKeys: String, CodingKey {
        case id, slug, name, released
        case backgroundImage = "background_image"
        case rating
        case ratingTop = "rating_top"
        case metacritic
        case shortScreenshots = "short_screenshots"
    }
}

struct ShortScreenshot: Codable {
    let id: Int
    let image: String
}

