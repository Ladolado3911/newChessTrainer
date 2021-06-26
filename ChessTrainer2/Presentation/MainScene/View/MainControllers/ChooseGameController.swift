//
//  ChooseGameController.swift
//  ChessTrainer2
//
//  Created by Ladolado3911 on 26.06.21.
//

import UIKit

class ChooseGameController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func onOpeningGame(_ sender: UIButton) {
        let vc = getController(storyboardID: .openingGame, controllerID: .ChooseModeController)
        navigationController?.pushViewController(vc, animated: true)
    }
}
