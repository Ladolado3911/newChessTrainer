//
//  TestOpenings.swift
//  ChessTrainer2
//
//  Created by Ladolado3911 on 5/27/21.
//

import Foundation
import UIKit


//let oneMoveOpenings = [Opening(name: "King's Pawn Opening", moveSequence: ["e4", "d5"]),
//                       Opening(name: "Queen's Pawn Opening", moveSequence: ["d4"])]

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
