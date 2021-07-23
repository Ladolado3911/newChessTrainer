//
//  PickDifficultyController.swift
//  ChessTrainer2
//
//  Created by lado tsivtsivadze on 7/4/21.
//

import UIKit

class DiffiucultyPickerController: GameViewController {

    @IBOutlet weak var difficultyPicker: UIPickerView!
    var difficultyViewModel: PickDifficultyViewModel!
    var previousController: OpeningFilterController?
    
    private var selectedOpenings: [UniqueOpening] {
        guard let previousController = previousController else { return [] }
        return previousController.selectedOpenings
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBarButtons()
        //difficultyViewModel = PickDifficultyViewModel(with: difficultyPicker, with: OpeningParser(), with: previousController)
        selectedOpenings.forEach { uniqueOpening in
            print(uniqueOpening.openings.count)
        }
    }
    
    func setBarButtons() {
        let nextButton = UIBarButtonItem(title: "Next",
                                     style: .done,
                                     target: self,
                                     action: #selector(onNextButton2))
        
        let backButton = UIBarButtonItem(title: "Back",
                                         style: .plain,
                                         target: self,
                                         action: #selector(onBackButton2))

        navigationItem.rightBarButtonItem = nextButton
        navigationItem.leftBarButtonItem = backButton
    }
 
    @objc func onNextButton2(sender: UIBarButtonItem) {

    }
    
    @objc func onBackButton2(sender: UIBarButtonItem) {
        guard let prevController = previousController else { return }
        prevController.openingViewModel.resetTable()
        prevController.selectedOpenings = []
        coordinator?.popController()
    }
}
