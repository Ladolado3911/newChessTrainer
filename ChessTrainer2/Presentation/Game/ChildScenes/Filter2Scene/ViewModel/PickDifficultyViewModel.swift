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


class PickDifficultyViewModel: PickerView {

    private var openingParser: OpeningParser = OpeningParser()
    private var data: [Opening]!
    weak var difficultyPicker: UIPickerView!
    weak var rootController: StartController!
    
    var minMaxMoves: MinMax {
        let minMovesCount = ( data!.map { $0.movesCount } ).min()
        let maxMovesCount = ( data!.map { $0.movesCount } ).max()
        
        return MinMax(minimum: minMovesCount!, maximum: maxMovesCount!)
    }

    init(with picker: UIPickerView, with data: [Opening]) {
        super.init()
        self.difficultyPicker = picker
        self.data = data
        configPicker()
    }
    
    private func configPicker() {
        difficultyPicker.dataSource = self
        difficultyPicker.delegate = self
    }

    func getLevelFilter() -> Int {
        let difficultyFilter = difficultyPicker.selectedRow(inComponent: 0) + 3
        return difficultyFilter
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        data.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        "\(row + 1) Moves"
    }
}
