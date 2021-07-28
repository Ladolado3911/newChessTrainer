//
//  ChooseGameController.swift
//  ChessTrainer2
//
//  Created by Ladolado3911 on 26.06.21.
//

import UIKit

class ChooseGameController: GameViewController {
    
    override func loadView() {
        super.loadView()
//        coordinator?.showLoadingScreen()
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) { [weak self] in
//            guard let self = self else { return }
//            self.coordinator?.dismissLoadingScreen()
//        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController!.navigationBar.prefersLargeTitles = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController!.navigationBar.prefersLargeTitles = false
    }
    
    @IBAction func onOpeningGame(_ sender: UIButton) {
//        coordinator?.proceedToController(controller: ChooseModeController.self,
//                                         present: .push) {}
        coordinator?.showLoadingScreen()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [weak self] in
            guard let self = self else { return }
            self.coordinator?.dismissLoadingScreen()
        }
        coordinator?.proceedToController(controller: OpeningFilterController.self,
                                         present: .push) {}
    }
}
