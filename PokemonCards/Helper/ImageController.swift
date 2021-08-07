//
//  imageController.swift
//  PokemonCards
//
//  Created by gunta.golde on 06/08/2021.
//

import UIKit

class ImageController {
    static func getImage(for url: String, completion: @escaping(UIImage?) -> Void) {
        
        guard let imageUrl = URL(string: url) else {
            fatalError("Could not create url from this string \(url)")
        }
        
        NetworkController.performRequest(for: imageUrl, httpMethod: .get) { (data, error) in
            guard let data = data, let image = UIImage(data: data) else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            DispatchQueue.main.async {
                completion(image)
            }
        }
        
    }
}
