//
//  PokemonsViewController.swift
//  PokemonFinder
//
//  Created by Max Mendes on 24/12/19.
//  Copyright © 2019 Max Mendes. All rights reserved.
//

import UIKit
import Kingfisher

class PokemonsViewController: UIViewController {
        
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var viewLoader: UIView!
    @IBOutlet weak var tableViewPokemons: UITableView!
    @IBOutlet weak var btnOrder: UIButton!
    let searchController = UISearchController(searchResultsController: nil)
    var types: [Type] = []
    var pokemons: [Abilitie] = []
    var filteredType = ""
    var searching = false
    var contFiltered = 0
    var filtering = false
    var filteredArray: [Abilitie] = []
    var ordered = false
    var searchPokemon: [Abilitie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filteredType = ""

    }
    
    override func viewWillAppear(_ animated: Bool) {
    
        rotateArrowStart()
        callPokemons()
        ordered = false

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    
    func rotateArrowStart(){
        
        DispatchQueue.main.async {
                                
            UIView.animate(withDuration: 0.5) {
                self.btnOrder.transform = CGAffineTransform(rotationAngle: 0.00)
            }
                            
                self.tableViewPokemons.reloadData()
        }
    }
    
    
    
    func rotateArrowEnd(){
        
        DispatchQueue.main.async {
                                
                        UIView.animate(withDuration: 0.5) {
                            self.btnOrder.transform = CGAffineTransform(rotationAngle: .pi)
                        }
                            
                            self.tableViewPokemons.reloadData()
                    }
        
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.view.endEditing(true)
    }
    
    
    
    func callPokemons(){
        
        ServiceAPI.loadPokemons { (abilitiesList) in
            
            if let abilities = abilitiesList{
                
                self.pokemons = abilities

                DispatchQueue.main.async {
                    
                    self.tableViewPokemons.reloadData()
                    self.viewLoader.isHidden = true
                    
                }
            }
        }
        
    }
    
    
    func orderPokemons(){
             
                 if (!self.ordered){
                  searching = false
                  let abilitiesSorted = self.pokemons.sorted(by: {$0.name < $1.name})
                    searchBar.resignFirstResponder()
                    
                  pokemons = abilitiesSorted
                  ordered = true
                  rotateArrowStart()
            
        }else{
                let abilitiesSorted = self.pokemons.sorted(by: {$0.name > $1.name})
                searchBar.resignFirstResponder()
                searching = false
                pokemons = abilitiesSorted
                ordered = false
                rotateArrowEnd()
        }
    }
    
    
    
    
    @IBAction func btnOrderAction(_ sender: Any) {
            orderPokemons()
    }
    
}
extension PokemonsViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return types.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionTypes", for: indexPath) as! TypesCollectionViewCell
        
        let type = types[indexPath.row]
        cell.prepareCell(type: type )
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        var cont = 0
        contFiltered = 0
        let type = types[indexPath.row]
        filteredType = type.name
        filteredArray = []
        
        self.view.endEditing(true)

        print(filteredType)
        for item in pokemons{
                     
            if item.type.contains(filteredType){
                          
                cont = cont + 1
                filteredArray.append(item)

            }
                      
        }
        
        contFiltered = cont
        print(contFiltered)
        let vc = storyboard?.instantiateViewController(withIdentifier: "FilteredTypeViewController") as? FilteredTypeViewController
        vc?.navTitle = filteredType
        vc?.filteredTypes = filteredArray
        vc?.imgLink = type.thumbnailImage
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}

extension PokemonsViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if searching == true && searchPokemon.count != 0{
            return searchPokemon.count
        }else{
            return pokemons.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "pokemons", for: indexPath) as! PokemonTableViewCell
        cell.selectionStyle = .none
        
        if searching == true && searchPokemon.count != 0{
            
            let ability = searchPokemon[indexPath.row]
            cell.prepareCell(pokemon: ability)
            
        }else{

            let ability = pokemons[indexPath.row]
            cell.prepareCell(pokemon: ability)
            
        }
        
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.view.endEditing(true)
        print("OK")
        
        let detatilVc = storyboard?.instantiateViewController(withIdentifier: "DetailVc") as? DetailViewController
        
        if searching == true{
            
            let ability = searchPokemon[indexPath.row]
            detatilVc?.pokemon = ability
        }else{
            let ability = pokemons[indexPath.row]
            detatilVc?.pokemon = ability

        }
        
        self.navigationController?.pushViewController(detatilVc!, animated: true)
    

    }
    
}

extension PokemonsViewController: UISearchBarDelegate{
   
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        searchPokemon = pokemons.filter({$0.name.capitalized.prefix(searchText.count) == searchText.capitalized})
        searching = true
        filteredType = ""
        tableViewPokemons.reloadData()
        
    }
    
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searching = true
        searchBar.resignFirstResponder()
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
       
    }
    
}
