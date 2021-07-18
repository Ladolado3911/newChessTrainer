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

class MainViewModel {

    weak var distributor: DataDistributor!
    var openingParser: OpeningParser!
    
    weak var openingPicker: UIPickerView!
    weak var difficultyPicker: UIPickerView!
    
    lazy var openings: [String] = { [weak self] in
        guard let self = self else { return [""] }
        return self.openingParser.uniqueOpeningNames
    }()
    
    init(distributor object: DataDistributor,
         openingParser parser: OpeningParser,
         openingPicker picker1: UIPickerView,
         difficultyPicker picker2: UIPickerView) {
        distributor = object
        openingParser = parser
    }
}
