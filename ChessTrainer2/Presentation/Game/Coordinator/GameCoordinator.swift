//
//  HomeCoordinator.swift
//  LadoTsivtsivadze_51
//
//  Created by Ladolado3911 on 12.07.21.
//

import UIKit

final class GameCoordinator: GameCoordinatorProtocol {
    
    var navigationController: UINavigationController?
    
    init(_ window: UIWindow? = nil, navigationController: UINavigationController? = UINavigationController()) {
        
        self.navigationController = navigationController
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let vc = ChooseGameController.instantiateFromStoryboard()
        vc.coordinator = self
        vc.tabBarItem.image = UIImage(systemName: "gamecontroller.fill")
        vc.title = "Play"
        
        self.navigationController?.viewControllers = [vc]

        
//        networkManger = NetworkManager()
//        homeServiceManager = HomeServicesManager(with: networkManger!)
//
        
    }
    
    func start() {
        
    }
    
    func proceedToChooseMode() {
        let vc = ChooseModeController.instantiateFromStoryboard()
        vc.coordinator = self
        navigationController?.pushViewController(vc, animated: true)
    }
}

