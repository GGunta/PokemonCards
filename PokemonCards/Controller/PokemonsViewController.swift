//
//  ViewController.swift
//  PokemonCards
//
//  Created by gunta.golde on 06/08/2021.
//

import UIKit

class PokemonsViewController: UIViewController {
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    var pokey: [Pokemon] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Pokemon List"
        getPokemonData()
    }
    
    func getPokemonData() {
        let url = URL(string: "https://api.pokemontcg.io/v1/cards")!
        NetworkController.performRequest(for: url, httpMethod: .get) { (data, err) in
            if let error = err {
                print("getting error from \(url.absoluteString), err: \(error.localizedDescription)")
            }
            
            if let data = data {
                do{
                    let jsonData = try JSONDecoder().decode(Card.self, from: data)
                    self.pokey = jsonData.cards
                    
                }catch{
                    print("failed to decode pokemon data \(error), data: \(String(describing: err))")
                }
                DispatchQueue.main.async {
                    self.tableViewOutlet.reloadData()
                }
                
            }else{
                print("data is nil")
            }
        }
    }
    
}


extension PokemonsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokey.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonCell", for: indexPath) as? PokeyTableViewCell else {
            return UITableViewCell()
        }
        
        let poke = pokey[indexPath.row]
        cell.setupUI(withDataFrom: poke)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 270
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailedPokeyCard" {
            if let detailVC = segue.destination as? DetailViewController, let row = tableViewOutlet.indexPathForSelectedRow?.row {
                detailVC.pokemon = pokey[row]
            }
        }
    }
    
}



