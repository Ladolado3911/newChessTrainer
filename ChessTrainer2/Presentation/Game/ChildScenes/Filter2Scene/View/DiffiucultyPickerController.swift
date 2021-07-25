//
//  PickDifficultyController.swift
//  ChessTrainer2
//
//  Created by lado tsivtsivadze on 7/4/21.
//

import UIKit

class DiffiucultyPickerController: GameViewController {

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
        //difficultyViewModel = PickDifficultyViewModel(with: difficultyPicker,
  //                                                    with: openingsArr)

    }
    
    func setBarButtons() {
        let backButton = UIBarButtonItem(title: "Back",
                                         style: .plain,
                                         target: self,
                                         action: #selector(onBackButton2))

        navigationItem.leftBarButtonItem = backButton
    }
    
    @IBAction func onEasy(_ sender: Any) {
        let level = 3
        coordinator?.proceedToGame(arr: openingsArr, movesCountFilter: level)
    }
    
    @IBAction func onMedium(_ sender: Any) {
        let level = 5
        coordinator?.proceedToGame(arr: openingsArr, movesCountFilter: level)
    }
    
    
    @IBAction func onHard(_ sender: Any) {
        let level = 10
        coordinator?.proceedToGame(arr: openingsArr, movesCountFilter: level)
    }
    
    
    @IBAction func onLegendary(_ sender: Any) {
//        let level = 30
 //       coordinator?.proceedToGame(arr: openingsArr, movesCountFilter: level)
    }
    
    @IBAction func onPlay(_ sender: GeneralStyleButton) {
//        print(difficultyViewModel.getChosenMovesCount())
//        let movesCountFilter = difficultyViewModel.getChosenMovesCount()
//        let simplifiedOpeningSequences = getFilteredOpenings(movesCountFilter: movesCountFilter)
//        coordinator?.proceedToGame(openingsData: simplifiedOpeningSequences)
    }

    @objc func onBackButton2(sender: UIBarButtonItem) {
        guard let prevController = previousController else { return }
        prevController.openingViewModel.resetTable()
        prevController.selectedOpenings = []
        UserDefaults.standard.setValue([], forKey: "SelectedOpeningNames")
        coordinator?.popController()
    }
}
