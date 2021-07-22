import UIKit
import Foundation

var data1: [String] = [
    "google",
    "google",
    "google, facebook",
    "google facebook amazon",
    "facebook",
    "facebook google",
    "amazon: google",
    "google: Lado",
    "amazon"
]

// result output should be:
// ["google: ["google", "google", "google facebook", "google facebook, amazon"],
//  "facebook": ["facebook", "facebook google"],
//  "amazon"" ["amazon google", "amazon"]]

var testResult: [String] = []

for itemIndex in 0..<data1.count {
    if itemIndex == data1.count - 1 {
        break
    }
    let item = data1[itemIndex]
    let itemLength = item.count
    
    for item2Index in 0..<data1.count {
        if item2Index == data1.count - 1 {
            break
        }
        if itemIndex == item2Index {
            continue
        }
        let secondItem = data1[item2Index]
        let secondItemLength = secondItem.count
        
        let shortItem = itemLength >= secondItemLength ? secondItem : item
        let longItem = itemLength >= secondItemLength ? item : secondItem
        
        if longItem.contains(shortItem) {
            testResult.append(shortItem)
        }
        
    }
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

var test: [String] = []
let data = fetchOpenings()

for a in 0..<data!.count {
    let item = data![a].name
    if item.contains(":") {
        let tempString = String(item.split(separator: ":")[0])
        if tempString.split(separator: " ").count > 2 {
            continue
        }
        test.append(tempString)
    }
    else if !item.contains(",") && item.contains(" ") {
        let array = item.split(separator: " ")
        let combined = String(array[0]) + " " + String(array[1])
        test.append(combined)
    }
    else {
        
    }
}

print(Array(Set(test)).sorted())
