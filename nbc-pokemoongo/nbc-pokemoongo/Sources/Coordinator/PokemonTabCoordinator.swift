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
        pokemonVC.tabBarItem = UITabBarItem(
            title: "pokemon",
            image: UIImage(systemName: "circle.circle"),
            selectedImage: UIImage(systemName: "circle.circle.fill")
        )
        navigationController.setViewControllers([pokemonVC], animated: true)
    }
}
