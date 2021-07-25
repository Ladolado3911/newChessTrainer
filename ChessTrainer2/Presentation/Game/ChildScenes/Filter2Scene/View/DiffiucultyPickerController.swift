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
    
    private var openingsArr: [Opening] {
        var result: [Opening] = []
        selectedOpenings.forEach { uniqueOpening in
            uniqueOpening.openings.forEach { opening in
                result.append(opening)
            }
        }
        return result
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBarButtons()
        difficultyViewModel = PickDifficultyViewModel(with: difficultyPicker,
                                                      with: openingsArr)

    }
    
    func setBarButtons() {
        let backButton = UIBarButtonItem(title: "Back",
                                         style: .plain,
                                         target: self,
                                         action: #selector(onBackButton2))

        navigationItem.leftBarButtonItem = backButton
    }
    
    @IBAction func onPlay(_ sender: GeneralStyleButton) {
        print(difficultyViewModel.getChosenMovesCount())
    }

    @objc func onBackButton2(sender: UIBarButtonItem) {
        guard let prevController = previousController else { return }
        prevController.openingViewModel.resetTable()
        prevController.selectedOpenings = []
        UserDefaults.standard.setValue([], forKey: "SelectedOpeningNames")
        coordinator?.popController()
    }
}
