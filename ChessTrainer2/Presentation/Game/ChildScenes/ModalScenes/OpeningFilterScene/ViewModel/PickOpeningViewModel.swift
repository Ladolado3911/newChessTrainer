//
//  PickOpeningViewModel.swift
//  ChessTrainer2
//
//  Created by lado tsivtsivadze on 7/4/21.
//

import Foundation
import UIKit

class PickOpeningViewModel {

    var openingParser: OpeningParser?
    var rootController1: StartController!
    var rootController2: OpeningFilterController!
    
    var openings: [String] {
        guard let openingParser = self.openingParser else { return [""] }
        return openingParser.uniqueOpeningNames
    }
    
    init(with tableDataSource: UIPickerView,
         with openingParser: OpeningParser,
         with rootController1: StartController,
         with rootController2: OpeningFilterController) {
        
        self.openingParser = openingParser
        self.rootController1 = rootController1
        self.rootController2 = rootController2
    }
//
//    func getNameFilter() -> String {
//        let nameFilter = openings[openingPicker.selectedRow(inComponent: 0)]
//        return nameFilter
//    }

}
