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
        "https://api.rawg.io/api/games?key=e88f2727475f49fb903d6aaf20975174&page=2&search="
        
        fetchGenericJSONData(urlString: urlString, completion: completion)
        // TODO: Search Term adding

    }
    
    func fetchGames(completion: @escaping (SearchResults?, Error?) -> ()){
        let urlString =
        "https://api.rawg.io/api/games?key=e88f2727475f49fb903d6aaf20975174&page=2&search="
        // TODO: Change the api
       fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchSocialApps(completion: @escaping ([SocialApp]?, Error?) -> Void){
        let urlString = "https://api.letsbuildthatapp.com/appstore/social"
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


