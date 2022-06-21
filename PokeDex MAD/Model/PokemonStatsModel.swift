//
//  PokemonStatsModel.swift
//  PokeDex MAD
//
//  Created by Phan Đức on 15/06/2022.
//

import Foundation

class PokemonStatsModel {
    var HP: Int
    var Attack: Int
    var Defense: Int
    var Speed: Int
    
    init(HP: Int, Attack: Int, Defense: Int, Speed: Int) {
        self.HP = HP
        self.Attack = Attack
        self.Defense = Defense
        self.Speed = Speed
    }
}
