//
//  MainViewModel.swift
//  ChessTrainer2
//
//  Created by lado tsivtsivadze on 6/12/21.
//

import Foundation
import UIKit

protocol ViewModel: AnyObject {
    
}

typealias PickerView = UIPickerViewDataSource & UIPickerViewDelegate & NSObject
typealias CollectView = UICollectionViewDataSource & UICollectionViewDelegate
typealias CollectDataSource = CollectView & NSObject

class MainViewModel: PickerView {

    var distributor: DataDistributor!
    var openingParser: OpeningParser!
    
    var openingPicker: UIPickerView!
    var difficultyPicker: UIPickerView!
    
    lazy var openings: [String] = {
        openingParser.uniqueOpeningNames
    }()
    
    init(distributor object: DataDistributor,
         openingParser parser: OpeningParser,
         openingPicker picker1: UIPickerView,
         difficultyPicker picker2: UIPickerView) {
        super.init()
        distributor = object
        openingParser = parser
        
        openingPicker = picker1
        difficultyPicker = picker2
        
        configPickers()
    }

    func configPickers() {
        openingPicker.dataSource = self
        openingPicker.delegate = self
        openingPicker.tag = 1
        
        difficultyPicker.dataSource = self
        difficultyPicker.delegate = self
        difficultyPicker.tag = 2
    }
    
    func getFilters() -> Filter {
        let nameFilter = openings[openingPicker.selectedRow(inComponent: 0)]
        let difficultyFilter = difficultyPicker.selectedRow(inComponent: 0) + 3
        
        return Filter(nameFilter: nameFilter, difficultyFilter: difficultyFilter)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return openings.count
        }
        else {
            return 4
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            return openings[row]
        }
        else {
            return "Level \(row + 1)"
        }
    }
}
