//
//  PokemonViewController.swift
//  nbc-pokemoongo
//
//  Created by MaxBook on 12/27/24.
//

import UIKit

class PokemonViewController: UIViewController {
    // MARK: - Properties
    
    
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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