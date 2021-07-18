//
//  ChooseGameController.swift
//  ChessTrainer2
//
//  Created by Ladolado3911 on 26.06.21.
//

import UIKit

class ChooseGameController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("didappear")
        navigationController!.navigationBar.prefersLargeTitles = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController!.navigationBar.prefersLargeTitles = false
    }
    
    @IBAction func onOpeningGame(_ sender: UIButton) {
        let vc = getController(storyboardID: .openingGame, controllerID: .ChooseModeController)
        navigationController?.pushViewController(vc, animated: true)
    }
}
