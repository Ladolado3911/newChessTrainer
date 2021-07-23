//
//  SelectedDataManager.swift
//  ChessTrainer2
//
//  Created by Ladolado3911 on 23.07.21.
//

import UIKit

class SelectedDataManager {
    static let shared = SelectedDataManager()
    private let key = "SelectedOpeningNames"
    private let base = UserDefaults.standard
    
    var selectedOpeningNames: [String] {
        guard let selectedOpeningNames = base.value(forKey: key) as? [String] else { return [] }
        return selectedOpeningNames
    }
    
    private init() {}
    
    func addToSelections(openingName name: String) {
        guard let selectedOpeningNames = base.value(forKey: key) as? [String] else { return }
        var selected = selectedOpeningNames
        selected.append(name)
        base.setValue(selected, forKey: key)
    }
    
    func removeFromSelections(openingName name: String) {
        guard let selectedOpeningNames = base.value(forKey: key) as? [String] else { return }
        let selected = selectedOpeningNames.filter { $0 != name }
        base.setValue(selected, forKey: key)
    }
}
