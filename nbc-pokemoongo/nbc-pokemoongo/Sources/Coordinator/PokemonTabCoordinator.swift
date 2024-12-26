//
//  PokemonTabCoordinator.swift
//  nbc-pokemoongo
//
//  Created by MaxBook on 12/27/24.
//

import UIKit

class PokemonTabCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init() {
        self.navigationController = UINavigationController()
    }
    
    func start() {
        let pokemonVC = PokemonViewController()
        pokemonVC.title = "Pokemon"
        navigationController.setViewControllers([pokemonVC], animated: false)
    }
}
