//
//  BookCartTabCoordinator.swift
//  nbc-pokemoongo
//
//  Created by MaxBook on 12/27/24.
//

import UIKit

class BookCartTabCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init() {
        self.navigationController = UINavigationController()
    }
    
    func start() {
        let bookCartVC = BookCartViewController()
        bookCartVC.title = "Book Cart"
        navigationController.setViewControllers([bookCartVC], animated: false)
    }
}
