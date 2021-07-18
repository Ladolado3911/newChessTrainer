//
//  Opening.swift
//  ChessTrainer2
//
//  Created by Ladolado3911 on 5/27/21.
//

import Foundation
import UIKit

struct Filter {
    var nameFilter: String
    var difficultyFilter: Int
    
    init(nameFilter name: String, difficultyFilter difficulty: Int) {
        nameFilter = name
        difficultyFilter = difficulty
    }
}
