//
//  Service.swift
//  SimpraIOSBootcampProject
//
//  Created by Muhammed Gül on 15.01.2023.
//

import Foundation

class Service {
    static let shared = Service() // using singleton
    
    func fetchGames(searchTerm: String, completion: @escaping ([Result], Error?) -> ()) {
        let urlString =
    "https://api.rawg.io/api/games?key=e88f2727475f49fb903d6aaf20975174&page=2&search="
// TODO: Search Term adding
        guard let url = URL(string: urlString) else { return }

        // fetch data from internet
        URLSession.shared.dataTask(with: url) { data, resp, err in
            if let err = err {
                print("Failed to fetch apps:", err)
                completion([], nil)
                return
            }
            guard let data = data else {return}

            do {

                let searchResult = try JSONDecoder().decode(SearchResults.self, from: data)
                searchResult.results.forEach { print($0.name)
                }
                
                completion(searchResult.results, nil)
                
                
            } catch let jsonErr {
                print("Failed to decode json:", jsonErr)
                completion([], jsonErr)
            }
        }.resume()
    }
    
}
