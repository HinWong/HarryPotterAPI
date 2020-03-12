//
//  CharacterError.swift
//  HarryPotterAPI
//
//  Created by Hin Wong on 3/11/20.
//  Copyright © 2020 Hin Wong. All rights reserved.
//

import Foundation

enum CharacterError: LocalizedError {
    
    case invalidURL
    case thrown(Error)
    case noData
    case unableToDecode
    
    var errorDescription: String? {
        switch self {
            
        case .invalidURL:
            return "Unable to reach server"
        case .thrown(let error):
            return error.localizedDescription
        case .noData:
            return "Server responded with no data"
        case .unableToDecode:
            return "Server responded with bad data"
        }
    }
}
