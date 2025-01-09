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
        bookCartVC.tabBarItem = UITabBarItem(
            title: "cart",
            image: UIImage(systemName: "cart"),
            selectedImage: UIImage(systemName: "cart.fill")
        )
        navigationController.setViewControllers([bookCartVC], animated: true)
    }
}
