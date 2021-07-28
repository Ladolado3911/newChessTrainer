//
//  AppCoordinator.swift
//  LadoTsivtsivadze_51
//
//  Created by Ladolado3911 on 12.07.21.
//

import UIKit

final class AppCoordinator: CoordinatorProtocol {
    
    // MARK: - Private properties
    
    private var window: UIWindow?
    private var navigationController: UINavigationController?
    
    init(_ window: UIWindow?, navigationController: UINavigationController?) {
        self.window = window
        self.navigationController = navigationController
    }
    
    func start() {
        
//        coordinator?.showLoadingScreen()
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) { [weak self] in
//            guard let self = self else { return }
//            self.coordinator?.dismissLoadingScreen()
//        }
        
        
        let vc = MainTabbarController.instantiateFromStoryboard()
        let vc2 = LoadingViewController.instantiateFromStoryboard()
        vc.coordinator = self
        navigationController?.setViewControllers([vc, vc2], animated: false)
        navigationController?.isNavigationBarHidden = true
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) { [weak self] in
            guard let self = self else { return }
            self.navigationController?.popViewController(animated: false)
        }
        
    }
}
