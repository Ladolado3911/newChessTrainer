import UIKit
import PlaygroundSupport

extension String {
    var moves: [String] {
        self.split(separator: " ").filter { !$0.contains(".") }.map { String($0) }
    }
}

struct JsonOpening: Codable {
    var name: String?
    var moves: String?
}


struct Opening {
    
    var jsonOpening: JsonOpening
    var name: String {
        jsonOpening.name ?? ""
    }
    var moveSequence: [String] {
        (jsonOpening.moves ?? "").moves
    }
    
    var movesCount: Int {
        return moveSequence.count
    }

    init(with opening: JsonOpening) {
        jsonOpening = opening
    }

    func generate6ChoiceFor(correctMove move: String) -> [String] {
        var moves2: [String] = []
        var temp = Moves.moves
        if temp.contains(move) {
            temp = temp.filter { $0 != move }
        }
        for _ in 0..<5 {
            moves2.append(temp.randomElement()!)
        }
        moves2.append(move)
        return moves2.shuffled()
    }
}

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

let parser2 = OpeningParser()
let datta = parser2.uniqueOpeningNames
for a in datta {
    print(a)
}
print(datta.count)
