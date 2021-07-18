//
//  UserCoordinatorDelegate.swift
//  ChessTrainer2
//
//  Created by lado tsivtsivadze on 7/18/21.
//

import UIKit

protocol UserCoordinatorDelegate: UIViewController {
    var coordinator: UserCoordinatorProtocol? { get set }
}
