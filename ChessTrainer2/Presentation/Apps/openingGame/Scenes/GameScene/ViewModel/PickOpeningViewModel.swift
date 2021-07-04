//
//  PickOpeningViewModel.swift
//  ChessTrainer2
//
//  Created by lado tsivtsivadze on 7/4/21.
//

import Foundation
import UIKit

class PickOpeningViewModel: PickerView {

    weak var openingParser: OpeningParser!
    weak var openingPicker: UIPickerView!
    weak var rootController: StartController!
    
    lazy var openings: [String] = { [weak self] in
        guard let self = self else { return [""] }
        return self.openingParser.uniqueOpeningNames
    }()
    
    init(with picker: UIPickerView, with openingParser: OpeningParser, with rootController: StartController) {
        super.init()
        self.openingPicker = picker
        self.openingParser = openingParser
        self.rootController = rootController
        configPicker()
    }
    
    func configPicker() {
        openingPicker.dataSource = self
        openingPicker.delegate = self
    }
    
    func getNameFilter() -> String { 
        let nameFilter = openings[openingPicker.selectedRow(inComponent: 0)]
        return nameFilter
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        openings.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        openings[row]
    }
}
