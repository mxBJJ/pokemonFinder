//
//  FilteredTypeTableViewCell.swift
//  PokemonFinder
//
//  Created by Max Mendes on 25/12/19.
//  Copyright © 2019 Max Mendes. All rights reserved.
//

import UIKit
import Kingfisher

class FilteredTypeTableViewCell: UITableViewCell {

    @IBOutlet weak var imgPokemon: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    
    
    func prepareCell(pokemon: Abilitie){
        imgPokemon.kf.setImage(with: URL(string: pokemon.thumbnailImage))
        lblName.text = pokemon.name
    }

}
