//
//  GameCoordinatorProtocol.swift
//  ChessTrainer2
//
//  Created by lado tsivtsivadze on 7/17/21.
//

import UIKit

protocol GameCoordinatorProtocol: CoordinatorProtocol {
    func proceedToController<T: GameViewController>(controller vc: T.Type)
}
