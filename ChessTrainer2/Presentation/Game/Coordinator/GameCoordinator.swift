//
//  HomeCoordinator.swift
//  LadoTsivtsivadze_51
//
//  Created by Ladolado3911 on 12.07.21.
//

import UIKit

enum PresentationStyle {
    case modal
    case push
}

final class GameCoordinator: GameCoordinatorProtocol {
    
    var navigationController: UINavigationController?
    
    init(_ window: UIWindow? = nil, navigationController: UINavigationController? = UINavigationController()) {
        
        self.navigationController = navigationController
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let vc = ChooseGameController.instantiateFromStoryboard()
        vc.coordinator = self
        vc.tabBarItem.image = UIImage(systemName: "gamecontroller")
        vc.title = "Play"
        
        self.navigationController?.viewControllers = [vc]

        
//        networkManger = NetworkManager()
//        homeServiceManager = HomeServicesManager(with: networkManger!)
//
        
    }
    
    func start() {
        
    }
    
    func proceedToController<T: GameViewController>(controller vc: T.Type,
                                                    present style: PresentationStyle = .push,
                                                    completion: @escaping () -> Void) {
        let vc2 = T.instantiateFromStoryboard()
        vc2.coordinator = self

        switch style {
        case .push:
            navigationController?.pushViewController(vc2, animated: true)
        case .modal:
            navigationController?.present(vc2, animated: true, completion: completion)
        }
    }
    
    func proceedToOpeningPicker(rootController controller: StartController,
                                completion: @escaping () -> Void) {
        let vc2 = OpeningFilterController.instantiateFromStoryboard()
        vc2.coordinator = self
        //vc2.rootController = controller
        navigationController?.present(vc2, animated: true, completion: completion)
    }
    
    func proceedToDifficultyPicker(rootController controller: OpeningFilterController) {
        let vc2 = DiffiucultyPickerController.instantiateFromStoryboard()
        vc2.coordinator = self
        vc2.previousController = controller
        navigationController?.pushViewController(vc2, animated: true)
    }
    
    func proceedToGame(openingsData data: [Opening]) {
        let vc2 = OpeningGameController.instantiateFromStoryboard()
        vc2.coordinator = self
        vc2.openingsData = data
        navigationController?.pushViewController(vc2, animated: true)
    }
    
    func popController() {
        navigationController?.popViewController(animated: true)
    }
}

