//
//  PokemonAPI.swift
//  PokemonFinder
//
//  Created by Max Mendes on 24/12/19.
//  Copyright © 2019 Max Mendes. All rights reserved.
//

import Foundation

struct Abilitie: Codable{
    
    var abilities: [String]
    var weight: Double
    var weakness: [String]
    var height: Double
    var name: String
    var type: [String]
    var thumbnailImage: String
    
}
