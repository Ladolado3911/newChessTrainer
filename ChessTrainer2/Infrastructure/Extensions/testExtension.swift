//
//  testExtension.swift
//  ChessTrainer2
//
//  Created by Ladolado3911 on 5/27/21.
//

import Foundation
import UIKit

extension Dictionary where Value : Hashable {

    func swap() -> [[String]: String] {
        assert(Set(self.values).count == self.keys.count, "Values must be unique")
        let defaultDict = [["No"]: "Data"]
        var newDict = [[String]: String]()

        for (key, value) in self {
            if let Key = key as? String {}
            else {
                return defaultDict
            }
            if let Value = value as? [String] {}
            else {
                return defaultDict
            }
            
            let newKey = key as? String
            let newValue = value as? [String]
            
            newDict[newValue ?? ["No Data"]] = newKey ?? "No Data"
        }
        return newDict
    }
}
