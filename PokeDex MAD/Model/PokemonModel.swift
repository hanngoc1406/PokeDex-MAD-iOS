//
//  PokemonModel.swift
//  PokeDex MAD
//
//  Created by Phan Đức on 16/05/2022.
//

import Foundation

class PokemonModel {
    var id: Int
    var name: String
    var type: String
    var height: String
    var weight: String
    var num: String
    var color: String  {
        get {
            switch(type) {
            case "Grass":
                return "#74CB48"
            case "Water":
                return "#6493EB"
            case "Psychic":
                return "#FB5584"
            case "Ice":
                return "#9AD6DF"
            case "Dark":
                return "#75574C"
            case "Fairy":
                return "#E69EAC"
            case "Flying":
                return "#A891EC"
            case "Poison":
                return "#A43E9E"
            case "Ground":
                return "#DEC16B"
            case "Bug":
                return "#A7B723"
            case "Fire":
                return "#F57D31"
            case "Electric":
                return "#F9CF30"
            case "Dragon":
                return "#7037FF"
            case "Steel":
                return "#B7B9D0"
            case "Fighting":
                return "#C12239"
            case "Normal":
                return "#AAA67F"
            case "Rock":
                return "#B69E31"
            case "Ghost":
                return "#70559B"
            default:
                return "#ffffff"
        } }
        set {}
    }
    
    init(name: String, type: String, id: Int, color: String, height: String, weight: String, num: String) {
        self.name = name
        self.type = type
        self.id = id
        self.height = height
        self.weight = weight
        self.num = num
        self.color = color

    }
}
