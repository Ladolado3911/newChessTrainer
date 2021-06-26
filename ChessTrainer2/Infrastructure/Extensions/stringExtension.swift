//
//  stringExtension.swift
//  ChessTrainer2
//
//  Created by Guest User on 6/11/21.
//

import Foundation
import UIKit

extension String {
    var moves: [String] {
        self.split(separator: " ").filter { !$0.contains(".") }.map { String($0) }
    }
}
