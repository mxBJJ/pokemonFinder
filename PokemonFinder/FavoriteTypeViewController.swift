//
//  FavoriteTypeViewController.swift
//  PokemonFinder
//
//  Created by Max Mendes on 16/12/19.
//  Copyright © 2019 Max Mendes. All rights reserved.
//

import UIKit

class FavoriteTypeViewController: UIViewController {

    @IBOutlet weak var lblDev: UILabel!
    @IBOutlet weak var viewLoader: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableViewTypes: UITableView!
    
    var username: String = ""
    var typesList: [Type] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func unwindToFavoriteSegue(_sender: UIStoryboardSegue){}
    
    
    func callTypes() {
        
        ServiceAPI.loadTypes { (result) in
            if let result = result {
                self.typesList = result.results
            }
            
            DispatchQueue.main.async {
                self.viewLoader.isHidden = true
                self.activityIndicator.isHidden = true
                self.tableViewTypes.reloadData()
                print("Request ok")
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        
        callTypes()
        if username != ""{
            lblDev.text = ("Hello, trainer \(username)!")
            UserDefaults.standard.set(username, forKey: "user")

        }else{
            
            let user = UserDefaults.standard.string(forKey: "user")
            
            if let user = user {
                if user.trimmingCharacters(in: .whitespaces) != ""{
                lblDev.text = "Hello, trainer \(user)!"
                }
            }
          
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! PokemonsViewController
        vc.types = self.typesList
    }
}

extension FavoriteTypeViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return typesList.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "types", for: indexPath) as! TypeTableViewCell

        cell.selectionStyle = .none
        
        let type = typesList[indexPath.row]
        cell.prepareCell(type: type)
        
        return cell
    }
    
}

