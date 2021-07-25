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
    
    func proceedToGame(arr: [Opening],
                       movesCountFilter moves: Int,
                       difficulty diff: Difficulty) {
        
        let vc2 = OpeningGameController.instantiateFromStoryboard()
        vc2.coordinator = self
        let data = getFilteredOpenings(movesCountFilter: moves,
                                       arr: arr,
                                       difficulty: diff)
        vc2.openingsData = data
        navigationController?.pushViewController(vc2, animated: true)
    }
    
    func popController() {
        navigationController?.popViewController(animated: true)
    }
    
    func getFilteredOpenings(movesCountFilter moves: Int,
                             arr openingsArr: [Opening],
                             difficulty diff: Difficulty) -> [Opening] {

        let simplifiedOpeningSequences = openingsArr.map { Array($0.moveSequence.prefix(moves)) }
        //print(simplifiedOpeningSequences)
        var openings: [Opening] = openingsArr
        for a in 0..<simplifiedOpeningSequences.count {
            openings[a].setMoveSequence(newSequence: simplifiedOpeningSequences[a])
        }
        //print(openings.map { $0.newMoveSequence })
        let unifiedSequences = Array(Set(simplifiedOpeningSequences))
        //print(unifiedSequences)
        var new: [Opening] = []
        var temp = unifiedSequences

        for a in 0..<openings.count {
            //print(temp.count)
            if temp.isEmpty {
                print("0!")
                break
            }
            for b in 0..<unifiedSequences.count {
                if b > temp.count - 1 {
                    break
                }
                if temp[b] == openings[a].newMoveSequence {
                    new.append(openings[a])
                    temp.remove(at: b)
                }
            }
        }
        
        switch diff {
        case .beginner(let scope):
            return returnResult(scope: scope, array: new)
            
        case .junior(let scope):
            return returnResult(scope: scope, array: new)

        case .experienced(let scope):
            return returnResult(scope: scope, array: new)
            
        case .master(let scope):
            return returnResult(scope: scope, array: new)
        }
    }
    
    func returnResult(scope sc: Scope, array arr: [Opening]) -> [Opening] {
        let arr2 = arr.filter { $0.newMovesCount <= sc.high && $0.newMovesCount > sc.low }
        return Array(arr2.prefix(5))
    }
}

