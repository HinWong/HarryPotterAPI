//
//  CharacterController.swift
//  HarryPotterAPI
//
//  Created by Hin Wong on 3/11/20.
//  Copyright © 2020 Hin Wong. All rights reserved.
//

import Foundation


//key: $2a$10$DmTT4MR6v/YsVtyzOf.9T.ZT/MlSIbA2YN8OOoFwL0YX88yXMPgey

class CharacterController {
    
    static let shared = CharacterController()
    var characters:[Character] = []
    
    //URL Constants
    static let baseURL = URL(string: "https://www.potterapi.com/v1/")
    static let characterEndpoint = "characters/"
    static let apiKeyQueryItem = "key"
    
    //Fetch request
    func fetchCharacters(completion: @escaping (Result<[Character], CharacterError>) -> Void) {
        
        // 1. URL
        guard let baseURL = CharacterController.baseURL else { return completion(.failure(.invalidURL)) }
        let characterURL = baseURL.appendingPathComponent(CharacterController.characterEndpoint)
        
        var urlComponents = URLComponents(url: characterURL, resolvingAgainstBaseURL: true)
        
        urlComponents?.queryItems = [URLQueryItem(name: CharacterController.apiKeyQueryItem, value: "$2a$10$DmTT4MR6v/YsVtyzOf.9T.ZT/MlSIbA2YN8OOoFwL0YX88yXMPgey")]
        
        guard let finalURL = urlComponents?.url else {return completion(.failure(.invalidURL))}
        print(finalURL
        )
        
        var request = URLRequest(url: finalURL)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // 2. Data task
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            
            // 3. Error handling
            if let error = error {
                print(error, error.localizedDescription)
                return completion(.failure(.thrown(error)))
            }
            
            // 4. Check for data
            guard let data = data else {return completion(.failure(.noData))}
            
            // 5. Decode data
            do {
                let decoder = JSONDecoder()
                let arrayCharacter = try decoder.decode([Character].self, from: data)
                self.characters = arrayCharacter
                return completion(.success(arrayCharacter))
            } catch {
                print(error, error.localizedDescription)
                return completion(.failure(.thrown(error)))
            }
        }.resume()
    }
}
