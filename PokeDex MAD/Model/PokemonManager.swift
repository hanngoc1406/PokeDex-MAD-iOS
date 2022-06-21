//
//  Pokemon.swift
//  PokeDex MAD
//
//  Created by Phan Đức on 14/05/2022.
//

import Foundation

struct PokemonData: Decodable {
    var id: Int
    var name: String
    var type: [String]
    var height: String
    var weight: String
    var num: String
}

struct BaseStats: Decodable {
    var base: base
}

struct base: Decodable {
    var HP: Int
    var Attack: Int
    var Defense: Int
    var Speed: Int
}

protocol PokemonManagerDelegate {
    func didUpdatePokemon(pokemons: [PokemonData])
    func didUpdateStats(stats: [BaseStats])
}

class PokemonManager {
    
    var delegate: PokemonManagerDelegate?
    
    func getPokemonRequest() {
        var pokemonDataRequest = URLRequest(url: URL(string: "https://raw.githubusercontent.com/hanngoc1406/pokedex-json-file/main/pokedex.json")!,timeoutInterval: Double.infinity)
        pokemonDataRequest.httpMethod = "GET"
        
        

        let task = URLSession.shared.dataTask(with: pokemonDataRequest) { (data, response, error) in
            
            if let safeData = data {
                do {
                    let getPokemons = try JSONDecoder().decode([PokemonData].self, from: safeData)
                    
                    DispatchQueue.main.async {
                        self.delegate?.didUpdatePokemon(pokemons: getPokemons)
                    }
                } catch {
                    print(error)
                }
            }
        }
        task.resume()
        

    }
    
    func getPokemonStats() {
        var baseStatsRequest = URLRequest(url: URL(string: "https://raw.githubusercontent.com/hanngoc1406/pokedex-json-file/main/stats.json")!,timeoutInterval: Double.infinity)
        baseStatsRequest.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: baseStatsRequest) { (data, response, error) in
            
            if let safeData = data {
                do {
                    let getBaseStats = try JSONDecoder().decode([BaseStats].self, from: safeData)
                    
                    DispatchQueue.main.async {
                        self.delegate?.didUpdateStats(stats: getBaseStats)
                    }
                } catch {
                    print(error)
                }
            }
        }
        task.resume()
    }
}
