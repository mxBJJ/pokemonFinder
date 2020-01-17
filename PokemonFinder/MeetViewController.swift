//
//  MeetViewController.swift
//  PokemonFinder
//
//  Created by Max Mendes on 16/12/19.
//  Copyright © 2019 Max Mendes. All rights reserved.
//

import UIKit

class MeetViewController: UIViewController {

    @IBOutlet weak var textFieldName: UITextField!
      
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as? FavoriteTypeViewController
       
        vc?.username = textFieldName.text ?? "Dev"
        
    }
    
    @IBAction func unwindToMeetSegue(_ sender: UIStoryboardSegue){}
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        view.endEditing(false)
    }
   

}
