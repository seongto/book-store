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
        navigationController.setViewControllers([mainVC], animated: false)
    }
    
    func navigateToDetail(with selectedBook: Book) {
        let detailVC = BookDetailViewController(selectedBook: selectedBook)
        detailVC.title = "책 상세보기"
        navigationController.pushViewController(detailVC, animated: true)
    }
}
