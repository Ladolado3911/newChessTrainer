//
//  HomeCoordinator.swift
//  LadoTsivtsivadze_51
//
//  Created by Ladolado3911 on 12.07.21.
//

import UIKit

final class StatsCoordinator: CoordinatorProtocol {
    
    var navigationController: UINavigationController?
    
    init(_ window: UIWindow? = nil, navigationController: UINavigationController? = UINavigationController()) {
        
        self.navigationController = navigationController
        self.navigationController?.isNavigationBarHidden = true
        
        let vc = StatsController.instantiateFromStoryboard()
        vc.coordinator = self
        vc.tabBarItem.image = UIImage(systemName: "2.circle")
        vc.title = "Page 2"
        
        self.navigationController?.viewControllers = [vc]
        
//        networkManger = NetworkManager()
//        homeServiceManager = HomeServicesManager(with: networkManger!)
//
        
    }
    
    func start() {
        
    }
}

