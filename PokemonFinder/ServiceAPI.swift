//
//  TypesAPI.swift
//  PokemonFinder
//
//  Created by Max Mendes on 24/12/19.
//  Copyright © 2019 Max Mendes. All rights reserved.
//

import Foundation
import Alamofire


class ServiceAPI{
    
    
    class func loadTypes(onComplete: @escaping (Result?) -> Void){
        
        let url = "https://vortigo.blob.core.windows.net/files/pokemon/data/types.json"
        
        AF.request(url).responseJSON { (results) in
            
            guard let data = results.data , let typesList = try? JSONDecoder().decode(Result.self, from: data) else{
                onComplete(nil)
                return
            }
            
        onComplete(typesList)
            
        }
        
    }
    
    class func loadPokemons(onComplete: @escaping ([Abilitie]?) -> Void){
        
        let url = "https://vortigo.blob.core.windows.net/files/pokemon/data/pokemons.json"
        
        AF.request(url).responseJSON { (abilities) in
            guard let data = abilities.data, let abilitiesList = try? JSONDecoder().decode([Abilitie].self, from: data) else {
                onComplete(nil)
                return
            }
            
            onComplete(abilitiesList)
            
        }
    }
}
