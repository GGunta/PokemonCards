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
    
    
    func setupUI(with: Pokemon) {
        nameLabel.text = "Name: " + with.name
        hpLabel.text = "Card value: " + with.number
        
        ImageController.getImage(for: with.image) { image in
            self.pokeyImageView.image = image  
        }
        
        if let subtype = with.subtype {
            subtypeLabel.text = "Card: " + subtype
        }
        
        if let supertype = with.subtype {
            supertypeLabel.text = "Type: " + supertype
            
            if with.supertype == "Trainer" {
                contentView.backgroundColor = .blue
            }else{
                contentView.backgroundColor = .systemYellow
            }
            }
        }
    }

