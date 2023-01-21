//
//  Model.swift
//  SimpraIOSBootcampProject
//
//  Created by Muhammed Gül on 15.01.2023.
//

import Foundation

// MARK: - SearchResults
struct SearchResults: Codable {
    let count: Int?
    let results: [Result]?
    
    enum CodingKeys: String, CodingKey {
        case count, results
    }
}

// MARK: - Result
struct Result: Codable {
    let id: Int
    let slug, name, released: String?
    let background_image: String?
    let rating: Double
    let metacritic: Int?
    let shortScreenshots: [ShortScreenshot]

    enum CodingKeys: String, CodingKey {
        case id, slug, name, released
        case background_image = "background_image"
        case rating
        case metacritic
        case shortScreenshots = "short_screenshots"
    }
}

struct ShortScreenshot: Codable {
    let id: Int?
    let image: String
}

