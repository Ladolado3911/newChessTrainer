//
//  OpeningParser.swift
//  ChessTrainer2
//
//  Created by lado tsivtsivadze on 6/13/21.
//

import Foundation
import UIKit


class OpeningParser {
    
    var uniqueOpeningNames: [String] {
        var result: [String] = []
        var tempDict: [String: String] = [:]
        let datta = fetchData()
        datta!.map {
            let name = $0.name
            let tempString = String(name.split(separator: ":")[0])
            
            if tempString.contains(",") {
                let newString = String(tempString.split(separator: ",")[0])
                tempDict[newString] = ""
            }
            else {
                tempDict[tempString] = ""
            }
        }
        for (key, _) in tempDict {
            result.append(key)
        }
        return result.sorted { $0 < $1 }
    }
    
    func fetchData() -> [Opening]? {
        let path = Bundle.main.path(forResource: "eco", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        
        do {
            let data = try Data(contentsOf: url)
            let openings = try JSONDecoder().decode([JsonOpening].self, from: data)
            let entireData = openings.map { Opening(with: $0) }
            
            return entireData
            
        }
        catch {
            print("Could not get data")
            return nil
        }
    }
}

