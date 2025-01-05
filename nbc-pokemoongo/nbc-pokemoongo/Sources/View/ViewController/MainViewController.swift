//
//  ViewController.swift
//  nbc-pokemoongo
//
//  Created by MaxBook on 12/27/24.
//

import UIKit

class MainViewController: UIViewController {
    // MARK: - Properties
    let mainView: MainView
    
    
    // MARK: - Life Cycles
    
    init(mainView: MainView = MainView()) {
        self.mainView = mainView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = mainView
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

extension MainViewController {
    func setupSubViews() {
        
    }
    
    func setupUIProperties() {
        
    }
    
    func setupLayouts() {
        
    }
}


// MARK: - Preview

@available(iOS 17.0, *)
#Preview {
    MainViewController()
}
