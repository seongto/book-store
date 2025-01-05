//
//  PokemonViewController.swift
//  nbc-pokemoongo
//
//  Created by MaxBook on 12/27/24.
//

import UIKit

class PokemonViewController: UIViewController {
    let pokemonView: PokemonView
    
    
    // MARK: - Life Cycles
    
    init(pokemonView: PokemonView = PokemonView()) {
        self.pokemonView = pokemonView
        super.init(nibName: nil, bundle: nil)
        
        view = pokemonView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSubViews()
        setupUIProperties()
        setupLayouts()
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }

}


// MARK: - UI Layouts
extension PokemonViewController {
    func setupSubViews() {
        
    }
    
    func setupUIProperties() {
        
    }
    
    func setupLayouts() {
        
    }
}
