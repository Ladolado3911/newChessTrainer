//
//  OpeningParser.swift
//  ChessTrainer2
//
//  Created by Guest User on 6/11/21.
//

import Foundation
import UIKit

class OpeningFilter {
    
    // filters
    var openingNameFilter: String!
    var difficultyFilter: Int!
    
    init(nameFilter name: String, difficultyFilter diff: Int) {
        openingNameFilter = name
        difficultyFilter = diff
    }
    
    func madeUnique(input arr: [Opening]) -> [Opening] {
        var tempDict: [String: Opening] = [:]
        var result: [Opening] = []
        for a in arr {
            tempDict[a.name] = a
        }
        for (_, opening) in tempDict {
            result.append(opening)
        }
        return result
    }
    
    
    func fetchData(completion: @escaping ([Opening]) -> Void) {
        let path = Bundle.main.path(forResource: "eco", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        
        do {
            let data = try Data(contentsOf: url)
            let openings = try JSONDecoder().decode([JsonOpening].self, from: data)
            let entireData = openings.map { Opening(with: $0) }
            let filter1 = entireData.filter { $0.name.contains(openingNameFilter!) }
            var filter2: [Opening] = []
            var result: [Opening] = []
//
//            if filter1.count >= 2 {
//                filter2.append(contentsOf: filter1.filter { $0.movesCount <= difficultyFilter! + 2 && $0.movesCount >= difficultyFilter! - 2 })
//
//                for _ in 0..<4 {
//                    if let random = filter2.randomElement() {
//                        result.append(random)
//                    }
//                }
//            }
//            else {
//                for _ in 0..<4 {
//                    if let random = filter1.randomElement() {
//                        result.append(random)
//                    }
//                }
//            }
            for _ in 0..<4 {
                if let random = filter1.randomElement() {
                    result.append(random)
                }
            }
            
            completion(madeUnique(input: result))
        }
        catch {
            print("Could not get data")
        }
    }
}
