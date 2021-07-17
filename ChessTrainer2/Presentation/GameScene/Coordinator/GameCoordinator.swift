//
//  HomeCoordinator.swift
//  LadoTsivtsivadze_51
//
//  Created by Ladolado3911 on 12.07.21.
//

import UIKit

final class GameCoordinator: CoordinatorProtocol {
    
    var navigationController: UINavigationController?
    
    init(_ window: UIWindow? = nil, navigationController: UINavigationController? = UINavigationController()) {
        
        self.navigationController = navigationController
        self.navigationController?.isNavigationBarHidden = true
        
        let vc = ChooseGameController.instantiateFromStoryboard()
        vc.coordinator = self
        vc.tabBarItem.image = UIImage(systemName: "1.circle")
        vc.title = "Page 1"
        
        self.navigationController?.viewControllers = [vc]
        
//        networkManger = NetworkManager()
//        homeServiceManager = HomeServicesManager(with: networkManger!)
//
        
    }
    
    func start() {
        
    }
}

