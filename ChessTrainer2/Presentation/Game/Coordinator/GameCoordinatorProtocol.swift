//
//  GameCoordinatorProtocol.swift
//  ChessTrainer2
//
//  Created by lado tsivtsivadze on 7/17/21.
//

import UIKit

protocol GameCoordinatorProtocol: CoordinatorProtocol {
    func proceedToController<T: GameViewController>(controller vc: T.Type,
                                                    present style: PresentationStyle,
                                                    completion: @escaping () -> Void)
    
    func proceedToOpeningPicker(rootController controller: StartController,
                                completion: @escaping () -> Void)
    
    func proceedToDifficultyPicker(rootController controller: StartController,
                                   completion: @escaping () -> Void)
    
    func proceedToGame(filters data: Filter)
}
