//
//  AppCoordinator.swift
//  nbc-pokemoongo
//
//  Created by MaxBook on 12/27/24.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func start()
}

class AppCoordinator: Coordinator {
    var window: UIWindow
    var navigationController: UINavigationController
    var tabBarCoordinator: TabBarCoordinator
    
    init(window: UIWindow) {
        self.window = window
        self.navigationController = UINavigationController()
        self.tabBarCoordinator = TabBarCoordinator(navigationController: navigationController)
    }
    
    func start() {
        navigationController.setNavigationBarHidden(true, animated: false)
        tabBarCoordinator.start()
        
        window.rootViewController = tabBarCoordinator.tabBarController
        window.makeKeyAndVisible()
    }
}
