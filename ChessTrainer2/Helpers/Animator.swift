//
//  Animations.swift
//  ChessTrainer2
//
//  Created by Ladolado3911 on 6/6/21.
//

import Foundation
import UIKit

class Animator {
    static var shared = Animator()
    
    private init() {}
    
    func animateCell(isCorrect isRight: Bool, targetCell cell: UICollectionViewCell, completion: @escaping () -> Void) {
        cell.backgroundColor = isRight ? .green : .red
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            completion()
        }
    }
}
