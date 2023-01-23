//
//  Service.swift
//  SimpraIOSBootcampProject
//
//  Created by Muhammed Gül on 15.01.2023.
//

import Foundation

class Service {
    static let shared = Service() // using singleton
    
    func fetchGames(searchTerm: String, completion: @escaping (SearchResults?, Error?) -> ()) {
        let urlString =
        "https://api.rawg.io/api/games?key=e88f2727475f49fb903d6aaf20975174&search=\(searchTerm)&page=1"
        
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
   
    
    func fetchTopRatedGames(completion: @escaping (TopRatedGamesOf2022?, Error?) -> ()){
        let urlString =
        "https://api.rawg.io/api/games?dates=2022-01-01,2022-12-31&ordering=-rating&key=e88f2727475f49fb903d6aaf20975174"
       
       fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func GamesBest(completion: @escaping (TopRatedGamesOf2022?, Error?) -> Void){
        let urlString = "https://api.rawg.io/api/games?key=e88f2727475f49fb903d6aaf20975174&dates=2019-09-01,2019-09-30&platforms=18,1,7"
       fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func Games2001(completion: @escaping (TopRatedGamesOf2022?, Error?) -> Void){
        let urlString = "https://api.rawg.io/api/games?dates=2001-01-01,2001-12-31&ordering=-rating&key=e88f2727475f49fb903d6aaf20975174"
       fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchGenericJSONData<T: Decodable>(urlString: String, completion: @escaping (T?, Error?) -> ()){
        guard let url = URL(string: urlString) else { return }
        
        // fetch data from internet
        URLSession.shared.dataTask(with: url) { data, resp, err in
            if let err = err {
                completion(nil, err)
                return
            }
            guard let data = data else {return}
            
            do {
                
                let objects = try JSONDecoder().decode(T.self, from: data)
               
                    completion(objects, nil)
                
                
            } catch let jsonErr {
                completion(nil, jsonErr)
                print("Failed to decode json:", jsonErr)
            }
        }.resume()
    }
}


