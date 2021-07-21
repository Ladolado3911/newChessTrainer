//
//  PickDifficultyViewModel.swift
//  ChessTrainer2
//
//  Created by lado tsivtsivadze on 7/4/21.
//

import Foundation
import UIKit

class PickDifficultyViewModel: PickerView {

    weak var openingParser: OpeningParser!
    weak var difficultyPicker: UIPickerView!
    weak var rootController: StartController!
    
    lazy var openings: [String] = { [weak self] in
        guard let self = self else { return [""] }
        return self.openingParser.uniqueOpeningNames
    }()
    
    init(with picker: UIPickerView, with openingParser: OpeningParser, with rootController: StartController) {
        super.init()
        self.difficultyPicker = picker
        self.openingParser = openingParser
        self.rootController = rootController 
        configPicker()
    }
    
    func configPicker() {
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
        4
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        "Level \(row + 1)"
    }
}
