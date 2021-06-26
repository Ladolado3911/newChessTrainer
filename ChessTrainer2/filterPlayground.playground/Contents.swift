import UIKit

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
            let filter2 = filter1.filter { $0.movesCount <= difficultyFilter! && $0.movesCount >= difficultyFilter! - 2 }
            
            var result: [Opening] = []
            for _ in 0..<4 {
                result.append(filter2.randomElement()!)
            }
            completion(madeUnique(input: result))
            
        }
        catch {
            print("Could not get data")
        }
    }
}


let parser = OpeningFilter(nameFilter: " ", difficultyFilter: 3)
parser.fetchData { data in
    data.map { print($0.name) }
    data.map { print($0.moveSequence) }
    print(data.count)
}
