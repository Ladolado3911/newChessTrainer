//
//  ChooseModeController.swift
//  ChessTrainer2
//
//  Created by Ladolado3911 on 26.06.21.
//

import UIKit

class ChooseModeController: GameViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
        
    @IBAction func onTrainingMode(_ sender: UIButton) {
        
        
    }

    @IBAction func onChallengeMode(_ sender: UIButton) {
        let vc = getController(storyboardID: .openingGame, controllerID: .start)
        navigationController?.pushViewController(vc, animated: true)
        
    }
}
