//
//  TypeTableViewCell.swift
//  PokemonFinder
//
//  Created by Max Mendes on 24/12/19.
//  Copyright © 2019 Max Mendes. All rights reserved.
//

import UIKit
import Kingfisher

class TypeTableViewCell: UITableViewCell {

    
    @IBOutlet weak var imgType: UIImageView!
    @IBOutlet weak var type: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func prepareCell(type: Type){
        
        self.type.text = type.name
        self.imgType.kf.setImage(with: URL(string: type.thumbnailImage))
    }

}
