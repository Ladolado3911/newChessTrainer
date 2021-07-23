//
//  OpeningParser.swift
//  ChessTrainer2
//
//  Created by lado tsivtsivadze on 6/13/21.
//

import Foundation
import UIKit

struct UniqueOpening {
    var name: String?
    var openings: [Opening] = []
    var isSelected: Bool = false
    
    mutating func changeStatus() {
        isSelected = !isSelected
    }
}

class OpeningParser {
    
    var uniqueOpeningNames: [String] {
        var result: [String] = []
        //var tempDict: [String: String] = [:]
        let datta = fetchOpenings()
        guard let data = datta else { return [] }
//        datta!.forEach {
//            let name = $0.name
//            let tempString = String(name.split(separator: ":")[0])
//
//            if tempString.contains(",") {
//                let newString = String(tempString.split(separator: ",")[0])
//                tempDict[newString] = ""
//            }
//            else {
//                tempDict[tempString] = ""
//            }
//        }
//        for (key, _) in tempDict {
//            result.append(key)
//        }
        
        for itemIndex in 0..<data.count {
            if itemIndex == data.count - 1 {
                break
            }
            let firstItem = data[itemIndex]
            let secondItem = data[itemIndex + 1]
            
            let firstItemLength = firstItem.name.count
            let secondItemLength = secondItem.name.count
            
            let shortItem = firstItemLength >= secondItemLength ? secondItem : firstItem
            let longItem = firstItemLength >= secondItemLength ? firstItem : secondItem
            
            if longItem.name.contains(shortItem.name) {
                result.append(shortItem.name)
            }
        }
        return Array(Set(result)).sorted { $0 < $1 }
    }
    
    var uniqueOpenings: [UniqueOpening] {
        guard let data = fetchUniqueOpenings() else { return [] }
        return data
    }
    
    func getUniqueNames(data arr: [JsonOpening]) -> [String] {
        var uniqueNames: [String] = []
        for itemIndex in 0..<arr.count {
            if itemIndex == arr.count - 1 {
                break
            }
            let firstItem = arr[itemIndex]
            let secondItem = arr[itemIndex + 1]
            
            let firstItemLength = firstItem.name!.count
            let secondItemLength = secondItem.name!.count
            
            let shortItem = firstItemLength >= secondItemLength ? secondItem : firstItem
            let longItem = firstItemLength >= secondItemLength ? firstItem : secondItem
            
            if longItem.name!.contains(shortItem.name!) {
                uniqueNames.append(shortItem.name!)
            }
        }
        return Array(Set(uniqueNames)).sorted { $0 < $1 }
    }
    
    func fetchOpenings() -> [Opening]? {
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
    
    func fetchUniqueOpenings() -> [UniqueOpening]? {
        let path = Bundle.main.path(forResource: "eco", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        
        do {
            let data = try Data(contentsOf: url)
            let openings = try JSONDecoder().decode([JsonOpening].self, from: data)
            
            var uniqueArray: [UniqueOpening] = []
            //let uniqueOpeningNames = getUniqueNames(data: openings)
            //print(uniqueOpeningNames)
            
            uniqueOpenings2.forEach { uniqueName in
                var uniqueOpening = UniqueOpening()
                openings.forEach { jsonOpening in
                    if jsonOpening.name!.contains(uniqueName) {
                        uniqueOpening.openings.append(Opening(with: jsonOpening))
                    }
                }
                uniqueOpening.name = uniqueName
                uniqueArray.append(uniqueOpening)
            }
            return uniqueArray
            
            
        }
        catch {
            print("Could not get data")
            return nil
        }
    }
}

