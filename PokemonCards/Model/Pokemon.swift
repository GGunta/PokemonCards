//
//  Pokemon.swift
//  PokemonCards
//
//  Created by gunta.golde on 07/08/2021.
//

import Foundation

struct Pokemon: Decodable {
    let id: String
    let name: String
    let image: String
    let number: String
    let supertype: String?
    let subtype: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case image = "imageUrl"
        case number, supertype, subtype
    }
}

struct Card: Decodable {
    let cards: [Pokemon]
}
