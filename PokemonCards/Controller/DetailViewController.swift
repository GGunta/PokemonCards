//
//  DetailViewController.swift
//  PokemonCards
//
//  Created by gunta.golde on 07/08/2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var pokeyImageView: UIImageView!
    @IBOutlet weak var pokeyNameLabel: UILabel!
    
    var pokemon: Pokemon!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let pokemon = pokemon {
            ImageController.getImage(for: pokemon.image) { (image) in
                self.pokeyImageView.image = image
            }
        }else{
            print("pokemon image is nil")
        }
        
        if pokemon != nil {
            pokeyNameLabel.text = "Name: " + pokemon.name + ", \nid: " + pokemon.id
        }
    }
}


