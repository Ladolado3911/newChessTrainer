//
//  PickDifficultyController.swift
//  ChessTrainer2
//
//  Created by lado tsivtsivadze on 7/4/21.
//

import UIKit

class DiffiucultyPickerController: UIViewController {

    @IBOutlet weak var difficultyPicker: UIPickerView!
    var difficultyViewModel: PickDifficultyViewModel!
    weak var rootController: StartController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let rootController = rootController else { return }
        difficultyViewModel = PickDifficultyViewModel(with: difficultyPicker, with: OpeningParser(), with: rootController)


    }
    
    @IBAction func onSetDifficulty(_ sender: Any) {
    }
}
