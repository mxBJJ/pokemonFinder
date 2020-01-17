//
//  TypesAPI.swift
//  PokemonFinder
//
//  Created by Max Mendes on 24/12/19.
//  Copyright © 2019 Max Mendes. All rights reserved.
//

import Foundation

struct Result:Codable {
    
    var results: [Type]
}

struct Type: Codable {
    var thumbnailImage : String
    var name: String
}
