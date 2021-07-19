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
        coordinator?.proceedToController(controller: OpeningFilterController.self,
                                         present: .push) {}
    }
}
