//
//  TabBarCoordinator.swift
//  nbc-pokemoongo
//
//  Created by MaxBook on 12/27/24.
//

import UIKit

class TabBarCoordinator: Coordinator {
    var navigationController: UINavigationController
    var tabBarController: UITabBarController
    var childCoordinators: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.tabBarController = UITabBarController()
    }
    
    func start() {
        // 각 탭의 코디네이터 생성
        let mainTabCoordinator = MainTabCoordinator()
        let pokemonTabCoordinator = PokemonTabCoordinator()
        let bookCartTabCoordinator = BookCartTabCoordinator()
        
        // 코디네이터 시작
        mainTabCoordinator.start()
        pokemonTabCoordinator.start()
        bookCartTabCoordinator.start()
        
        // 탭바에 코디네이터의 뷰컨트롤러 추가
        tabBarController.viewControllers = [
            mainTabCoordinator.navigationController,
            pokemonTabCoordinator.navigationController,
            bookCartTabCoordinator.navigationController
        ]
        
        // 자식 코디네이터로 등록
        childCoordinators = [
            mainTabCoordinator,
            pokemonTabCoordinator,
            bookCartTabCoordinator
        ]
    }
}
