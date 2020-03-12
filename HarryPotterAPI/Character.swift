//
//  House.swift
//  HarryPotterAPI
//
//  Created by Hin Wong on 3/11/20.
//  Copyright © 2020 Hin Wong. All rights reserved.
//

import Foundation

struct Character: Codable {
    let name: String
    let role: String?
    let school: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case role = "role"
        case school = "school"
    }
}
