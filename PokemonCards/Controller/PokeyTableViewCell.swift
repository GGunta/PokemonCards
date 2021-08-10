//
//  PokeyTableViewCell.swift
//  PokemonCards
//
//  Created by gunta.golde on 06/08/2021.
//

import UIKit

class PokeyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var pokeyImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var supertypeLabel: UILabel!
    @IBOutlet weak var hpLabel: UILabel!
    @IBOutlet weak var subtypeLabel: UILabel!
    
    
    func setupUI(withDataFrom: Pokemon) {
        nameLabel.text = "Name: " + withDataFrom.name
        hpLabel.text = "Card value: " + withDataFrom.number
        
        ImageController.getImage(for: withDataFrom.image) { image in
            self.pokeyImageView.image = image  
        }
        
        if let subtype = withDataFrom.subtype {
            subtypeLabel.text = "Card: " + subtype
        }
        
        if let supertype = withDataFrom.subtype {
            supertypeLabel.text = "Type: " + supertype
            
            if withDataFrom.supertype == "Trainer" {
                contentView.backgroundColor = .blue
            }else{
                contentView.backgroundColor = .systemYellow
            }
        }
    }
}

