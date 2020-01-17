//
//  FilteredTypeViewController.swift
//  PokemonFinder
//
//  Created by Max Mendes on 25/12/19.
//  Copyright © 2019 Max Mendes. All rights reserved.
//

import UIKit
import Kingfisher

class FilteredTypeViewController: UIViewController {

    @IBOutlet weak var imgType: UIImageView!
    var filteredTypes: [Abilitie] = []
    var navTitle: String = ""
    var imgLink: String = ""
    @IBOutlet weak var tableViewFiltered: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(filteredTypes.count)
        print(navTitle)
        self.title = navTitle.capitalized
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
    
        imgType.kf.setImage(with: URL(string: imgLink))

    }
}


extension FilteredTypeViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "filtered", for: indexPath) as! FilteredTypeTableViewCell
        
        cell.selectionStyle = .none
        
        let filteredType = filteredTypes[indexPath.row]
        
        cell.prepareCell(pokemon: filteredType)
        
        return cell
        
    }
    
    
}
