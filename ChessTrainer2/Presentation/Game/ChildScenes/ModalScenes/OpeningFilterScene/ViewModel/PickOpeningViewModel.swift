//
//  PickOpeningViewModel.swift
//  ChessTrainer2
//
//  Created by lado tsivtsivadze on 7/4/21.
//

import Foundation
import UIKit

class PickOpeningViewModel: PickerView {

    var openingParser: OpeningParser?
    weak var openingPicker: UIPickerView!
    var rootController1: StartController!
    var rootController2: OpeningFilterController!
    
    var openings: [String] {
        guard let openingParser = self.openingParser else { return [""] }
        return openingParser.uniqueOpeningNames
    }
    
    init(with picker: UIPickerView,
         with openingParser: OpeningParser,
         with rootController1: StartController,
         with rootController2: OpeningFilterController) {
        
    super.init()
        self.openingPicker = picker
        self.openingParser = openingParser
        self.rootController1 = rootController1
        self.rootController2 = rootController2

        self.configPicker()
        print("initialized")


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
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }
}
