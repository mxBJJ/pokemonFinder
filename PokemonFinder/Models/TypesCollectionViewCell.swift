//
//  TypesCollectionViewCell.swift
//  PokemonFinder
//
//  Created by Max Mendes on 24/12/19.
//  Copyright © 2019 Max Mendes. All rights reserved.
//

import UIKit

class TypesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgType: UIImageView!
    @IBOutlet weak var lblType: UILabel!
    
    func prepareCell(type: Type){
        
        imgType.kf.setImage(with: URL(string: type.thumbnailImage))
        lblType.text = type.name.capitalized
    }
    
        
}
