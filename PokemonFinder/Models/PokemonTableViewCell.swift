//
//  PokemonTableViewCell.swift
//  PokemonFinder
//
//  Created by Max Mendes on 24/12/19.
//  Copyright © 2019 Max Mendes. All rights reserved.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {

    
    @IBOutlet weak var imgPokemon: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func prepareCell(pokemon: Abilitie){
        
        lblName.text = pokemon.name
        imgPokemon.kf.setImage(with: URL(string: pokemon.thumbnailImage))
    }

}
