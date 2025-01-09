//
//  TabBarCoordinator.swift
//  nbc-pokemoongo
//
//  Created by MaxBook on 12/27/24.
//

import UIKit
import SnapKit

class TabBarCoordinator: Coordinator {
    var navigationController: UINavigationController
    var tabBarController: UITabBarController
    var childCoordinators: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.tabBarController = UITabBarController()
        
        setupProperties()
    }
    
    func start() {
        if #available(iOS 11.0, *) {
            tabBarController.tabBar.insetsLayoutMarginsFromSafeArea = true
        }
        
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
            pokemonTabCoordinator.navigationController,
            mainTabCoordinator.navigationController,
            bookCartTabCoordinator.navigationController
        ]
        
        tabBarController.selectedIndex = 1
        
        // 자식 코디네이터로 등록
        childCoordinators = [
            pokemonTabCoordinator,
            mainTabCoordinator,
            bookCartTabCoordinator
        ]
    }
    
    func setupProperties() {
        tabBarController.tabBar.backgroundColor = .backgroundLight
        
        if #available(iOS 13.0, *) {
            let appearance = UITabBarAppearance()
            
            appearance.stackedLayoutAppearance.normal.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 0)
            appearance.stackedLayoutAppearance.normal.badgePositionAdjustment = UIOffset(horizontal: 30, vertical: 30)
            
            tabBarController.tabBar.standardAppearance = appearance
            tabBarController.tabBar.scrollEdgeAppearance = appearance
        }
    }
    
    
}
