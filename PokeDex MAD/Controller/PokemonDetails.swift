//
//  PokemonDetails.swift
//  PokeDex MAD
//
//  Created by Phan Đức on 14/05/2022.
//

import UIKit

class PokemonDetails: UIViewController {
    
    // Details outlet.
    @IBOutlet weak var viewBackground: UIView!
    @IBOutlet weak var pokemonArt: UIImageView!
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var pokemmonType: UILabel!
    @IBOutlet weak var pokemonHeight: UILabel!
    @IBOutlet weak var pokemonWeight: UILabel!
    @IBOutlet weak var pokemonNum: UILabel!
    
    // Stats Outlet.
    @IBOutlet weak var HPLabel: UILabel!
    @IBOutlet weak var AttackLabel: UILabel!
    @IBOutlet weak var DefenseLabel: UILabel!
    @IBOutlet weak var SpeedLabel: UILabel!
    
    // Variable to pass data from ViewController
    var pokeName: String!
    var pokeType: String!
    var pokeId: Int!
    var pokeColor: String!
    var pokeWeight: String!
    var pokeHeight: String!
    var pokeNum: String!
    let nameSyle: UIFont = UIFont.boldSystemFont(ofSize: 25.0)
    var statsHP: Int!
    var statsAttack: Int!
    var statsDefense: Int!
    var statsSpeed: Int!
    
    
    var statsManager = PokemonManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Stats
        HPLabel.text = String(statsHP)
        AttackLabel.text = String(statsAttack)
        DefenseLabel.text = String(statsDefense)
        SpeedLabel.text = String(statsSpeed)
        
        // Details
        pokemonName.text = pokeName
        pokemonName.font = UIFont.boldSystemFont(ofSize: 30.0)
        pokemmonType.text = pokeType
        pokemonHeight.text = pokeHeight
        pokemonWeight.text = pokeWeight
        pokemonNum.text = "#" + pokeNum
        pokemonWeight.font = nameSyle
        pokemonHeight.font = nameSyle
        pokemmonType.layer.masksToBounds = true
        pokemmonType.layer.backgroundColor = UIColor(hexString: pokeColor).cgColor
        pokemmonType.layer.cornerRadius = 15
        viewBackground.backgroundColor = UIColor(hexString: pokeColor)
        pokemonArt.image = UIImage(named: "pokeball")
        pokemonArt.loadFrom(URLAddress: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(pokeId!).png")
    }
}
