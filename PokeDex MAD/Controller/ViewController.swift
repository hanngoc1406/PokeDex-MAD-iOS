//
//  ViewController.swift
//  PokeDex MAD
//
//  Created by Phan Đức on 14/05/2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, PokemonManagerDelegate {
    
    @IBOutlet weak var PokemonTable: UITableView!
    let nameSyle: UIFont = UIFont.boldSystemFont(ofSize: 30.0)
    
    
    var pokemonsManager = PokemonManager()
    var pokemonArray: [PokemonModel] = []
    var pokemonStatsArray: [PokemonStatsModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        PokemonTable.dataSource = self
        PokemonTable.delegate = self
        pokemonsManager.delegate = self
        self.title = "Pokédex"
        pokemonsManager.getPokemonRequest()
        pokemonsManager.getPokemonStats()
    }
    
    // Return the number of rows in a given section of a table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Tra ve so phan tu trong mang
        return pokemonArray.count
        
    }
    
    // Show data in cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonCellView") as! PokemonCell
        cell.PokemonName.font = nameSyle
        cell.PokemonType.layer.masksToBounds = true
        cell.PokemonType.layer.cornerRadius = 15
        cell.PokemonBorder.layer.borderWidth = 3
        cell.PokemonBorder.layer.cornerRadius = 15
        cell.PokemonName.text = self.pokemonArray[indexPath.row].name
        cell.PokemonType.text = self.pokemonArray[indexPath.row].type
        cell.PokemonBorder.layer.borderColor = UIColor(hexString: self.pokemonArray[indexPath.row].color).cgColor
        cell.PokemonType.backgroundColor = UIColor(hexString: self.pokemonArray[indexPath.row].color)
        cell.PokemonImage.image = UIImage(named: "pokeball")
        cell.PokemonImage.loadFrom(URLAddress: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(self.pokemonArray[indexPath.row].id).png")
        return cell
    }
    
    // Tells the delegate a row is selected.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Create a UIStroyboard with with identify = Details
        let detailsView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Details") as! PokemonDetails
        detailsView.pokeName = pokemonArray[indexPath.row].name
        detailsView.pokeType = pokemonArray[indexPath.row].type
        detailsView.pokeId = pokemonArray[indexPath.row].id
        detailsView.pokeColor = pokemonArray[indexPath.row].color
        detailsView.pokeHeight = pokemonArray[indexPath.row].height
        detailsView.pokeWeight = pokemonArray[indexPath.row].weight
        detailsView.pokeNum = pokemonArray[indexPath.row].num
        
        // Data for Pokemon Stats
        detailsView.statsHP = pokemonStatsArray[indexPath.row].HP
        detailsView.statsAttack = pokemonStatsArray[indexPath.row].Attack
        detailsView.statsDefense = pokemonStatsArray[indexPath.row].Defense
        detailsView.statsSpeed = pokemonStatsArray[indexPath.row].Speed
        self.navigationController?.pushViewController(detailsView, animated: true)
    }
    
    func didUpdatePokemon(pokemons: [PokemonData]) {
        
        for pokemon in pokemons {
            self.pokemonArray.append(PokemonModel(name: pokemon.name, type: pokemon.type[0], id: pokemon.id, color: pokemon.type[0], height: pokemon.height, weight: pokemon.weight, num: pokemon.num))
        }
            
        DispatchQueue.main.async {
            self.PokemonTable.reloadData()
        }
    }
    
    func didUpdateStats(stats: [BaseStats]) {
        for stat in stats {
            self.pokemonStatsArray.append(PokemonStatsModel(HP: stat.base.HP, Attack: stat.base.Attack, Defense: stat.base.Defense, Speed: stat.base.Speed))
        }
        
        DispatchQueue.main.async {
            self.PokemonTable.reloadData()
        }
    }
}
