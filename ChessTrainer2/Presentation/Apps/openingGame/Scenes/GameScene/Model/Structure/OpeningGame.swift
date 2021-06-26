//
//  Game.swift
//  ChessTrainer2
//
//  Created by Ladolado3911 on 5/27/21.
//

import Foundation
import UIKit



class OpeningGame {
    var data: [Opening]
    
    var openingsCount: Int {
        return data.count
    }

    init(data dt: [Opening]) {
        data = dt
    }
}

