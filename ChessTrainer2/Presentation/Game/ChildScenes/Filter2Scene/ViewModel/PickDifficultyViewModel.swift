//
//  PickDifficultyViewModel.swift
//  ChessTrainer2
//
//  Created by lado tsivtsivadze on 7/4/21.
//

import Foundation
import UIKit

struct MinMax {
    var min: Int!
    var max: Int!
    
    init(minimum min: Int, maximum max: Int) {
        self.min = min
        self.max = max
    }
}


class PickDifficultyViewModel {

    private var openingParser: OpeningParser = OpeningParser()
    private var data: [Opening]!
    weak var difficultyPicker: UIPickerView!
    weak var rootController: StartController!
    
    var minMaxMoves: MinMax {
        let testArr = data!.map { $0.movesCount }
        let minMovesCount = testArr.min()
        let maxMovesCount = testArr.max()
        
        return MinMax(minimum: minMovesCount!, maximum: maxMovesCount!)
    }

    init(with data: [Opening]) {
        self.data = data
    }
}
