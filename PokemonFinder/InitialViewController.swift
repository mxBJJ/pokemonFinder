//
//  ViewController.swift
//  PokemonFinder
//
//  Created by Max Mendes on 15/12/19.
//  Copyright © 2019 Max Mendes. All rights reserved.
//

import UIKit
import AVFoundation

class InitialViewController: UIViewController {

    @IBOutlet weak var btnStart: UIButton!
    var audioPlayer = AVAudioPlayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        do{
            
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "introSong", ofType: "mp3")!))
            audioPlayer.prepareToPlay()
            audioPlayer.play()
            
        }catch{
            print(error)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        btnStart.layer.cornerRadius = 10
        navigationController?.navigationBar.isHidden = true
    }
    
    
    @IBAction func unwindToInitialSegue(_ sender: UIStoryboardSegue){}

}

