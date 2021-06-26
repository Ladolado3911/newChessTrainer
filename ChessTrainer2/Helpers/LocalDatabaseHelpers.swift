//
//  LocalDatabaseHelpers.swift
//  ChessTrainer
//
//  Created by Ladolado3911 on 5/5/21.
//

import Foundation
import UIKit

func isFirstLaunch() -> Bool {
    let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
    if launchedBefore  {
        return false
    }
    else {
        UserDefaults.standard.set(true, forKey: "launchedBefore")
        return true
    }
}
