//
//  IDs.swift
//  LadoTsivtsivadze_15
//
//  Created by Ladolado3911 on 5/19/21.
//

import Foundation
import UIKit

enum ControllerID: String {
    case start = "StartController"
    case openingGameController = "OpeningGameController"
    case statsController = "StatsController"
    case ChooseModeController = "ChooseModeController"
    case pickOpening = "PickOpeningController"
    case pickDifficulty = "PickDifficultyController"
}

enum StoryboardID: String {
    case main = "Main"
    case openingGame = "OpeningGame"
    case pickOpening = "PickOpeningController"
    case picDifficulty = "PickDifficultyController"
}

enum TabBarControllerID: String {
    case tabBar = "TabBarController"
}
