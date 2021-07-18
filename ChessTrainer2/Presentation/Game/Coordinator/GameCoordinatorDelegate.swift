//
//  GameCoordinatorDelegate.swift
//  ChessTrainer2
//
//  Created by lado tsivtsivadze on 7/17/21.
//

import UIKit

protocol GameCoordinatorDelegate: UIViewController {
    var coordinator: GameCoordinatorProtocol? { get set }
}

