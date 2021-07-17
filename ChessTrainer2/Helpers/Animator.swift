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
    
    func animateCell(isCorrect isRight: Bool, targetCell cell: AnswerCell, isEven iseven: Bool, completion: @escaping () -> Void) {
        //cell.backgroundColor = isRight ? .green : .red
        if isRight && iseven {
            cell.backgroundColor = ProjectColors.purple
            cell.label.textColor = .white
        }
        else if isRight {
            cell.backgroundColor = ProjectColors.white
            cell.label.textColor = ProjectColors.purple
        }
        else {
            cell.backgroundColor = .red
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            completion()
        }
    }
}
