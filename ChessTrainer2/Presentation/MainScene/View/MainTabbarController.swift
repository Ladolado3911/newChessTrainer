//
//  MainTabbarController.swift
//  LadoTsivtsivadze_51
//
//  Created by Ladolado3911 on 12.07.21.
//

import UIKit

class MainTabbarController: UITabBarController, Storyboarded, CoordinatorDelegate {
    var coordinator: CoordinatorProtocol?
    
    private var gameCoordinator = GameCoordinator()
    private var statsCoordinator = StatsCoordinator()
    private var leaderboardCoordinator = LeaderboardCoordinator()
    private var userCoordinator = UserCoordinator()


    override func viewDidLoad() {
        super.viewDidLoad()

        viewControllers = [
            gameCoordinator.navigationController!,
            statsCoordinator.navigationController!,
            leaderboardCoordinator.navigationController!,
            userCoordinator.navigationController!
        ]
        
        let selectedColor = ProjectColors.purple
        self.tabBar.tintColor = selectedColor
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: selectedColor], for: .selected)
    }
}
