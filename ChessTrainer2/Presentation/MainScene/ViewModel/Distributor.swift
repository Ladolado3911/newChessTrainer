//
//  Distributor.swift
//  ChessTrainer2
//
//  Created by lado tsivtsivadze on 6/12/21.
//

import Foundation
import UIKit

protocol Distributor {
    
}

class DataDistributor {
    var controllers: [UIViewController] = []
    
    func addController(controller ctrl: UIViewController) {
        controllers.append(ctrl)
    }
    
    func removeController(controller ctrl: UIViewController) {
        controllers = controllers.filter { $0 != ctrl }
    }
    
    func transferData(from controller1: UIViewController, to controller2: UIViewController) {
        
    }
}
