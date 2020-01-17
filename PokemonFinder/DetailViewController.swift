//
//  DetailViewController.swift
//  PokemonFinder
//
//  Created by Max Mendes on 14/01/20.
//  Copyright © 2020 Max Mendes. All rights reserved.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {

    @IBOutlet weak var imgPokemon: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var cardViewStats: UIView!
    @IBOutlet weak var cardStats: UIView!
    @IBOutlet weak var lblAbilitites: UILabel!
    @IBOutlet weak var lblType: UILabel!
    @IBOutlet weak var lblHeight: UILabel!
    @IBOutlet weak var lblWeight: UILabel!
    @IBOutlet weak var lblWeakness: UILabel!
    
    var pokemon: Abilitie!
    var abilities: String = ""
    var weakness: String = ""
    var name: String = ""
    var types: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for a in pokemon.abilities{
            abilities += "\(a) ,"
        }
        
        for w in pokemon.weakness{
            weakness += "\(w) ,"
        }
        
        
        for t in pokemon.type{
            types += "\(t),"
        }
        
    
        abilities.removeLast()
        weakness.removeLast()
        types.removeLast()
        
        imgPokemon.kf.setImage(with: URL(string: pokemon.thumbnailImage))
        lblHeight.text = "\(pokemon.height) ft"
        lblWeight.text = "\(pokemon.weight) lbs"
        lblAbilitites.text = "\(abilities)"
        lblName.text = "\(pokemon.name)"
        lblWeakness.text = "\(weakness)"
        lblType.text = "\(types)"
        self.title = "Detail"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        cardViewStats.layer.cornerRadius = 4
    }

}
