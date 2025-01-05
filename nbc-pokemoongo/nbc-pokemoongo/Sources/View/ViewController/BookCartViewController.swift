//
//  BookCartViewController.swift
//  nbc-pokemoongo
//
//  Created by MaxBook on 12/27/24.
//

import UIKit

class BookCartViewController: UIViewController {
    // MARK: - Properties
    let bookCartView: BookCartView
    
    
    // MARK: - Life Cycles
    
    init(bookCartView: BookCartView = BookCartView()) {
        self.bookCartView = bookCartView
        super.init(nibName: nil, bundle: nil)
        
        view = bookCartView
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
extension BookCartViewController {
    func setupSubViews() {
        
    }
    
    func setupUIProperties() {
        
    }
    
    func setupLayouts() {
        
    }
}
