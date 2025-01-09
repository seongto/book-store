//
//  MainTabCoordinator.swift
//  nbc-pokemoongo
//
//  Created by MaxBook on 12/27/24.
//

import UIKit


class MainTabCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init() {
        self.navigationController = UINavigationController()
    }
    
    func start() {
        let mainVC = MainViewController()
        mainVC.title = "Main"
        mainVC.coordinator = self
        mainVC.tabBarItem = UITabBarItem(
            title: "main",
            image: UIImage(systemName: "house"),
            selectedImage: UIImage(systemName: "house.fill")
        )
        navigationController.setViewControllers([mainVC], animated: true)
    }
}
