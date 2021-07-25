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
    
    func getFilteredOpenings(movesCountFilter moves: Int) -> [Opening] {
        let simplifiedOpeningSequences = openingsArr.map { Array($0.moveSequence.prefix(moves)) }
        
        var openings: [Opening] = openingsArr
        
        for a in 0..<simplifiedOpeningSequences.count - 1 {
            openings[a].setMoveSequence(newSequence: simplifiedOpeningSequences[a])
        }

        let unifiedSequences = Array(Set(simplifiedOpeningSequences))
        var new: [Opening] = []
        var temp = unifiedSequences

        for a in 0..<openings.count - 1 {
            print(temp.count)
            if temp.isEmpty {
                print("0!")
                break
            }
            for b in 0..<unifiedSequences.count - 1 {
                if b > temp.count - 1 {
                    break
                }
                if temp[b] == openings[a].newMoveSequence {
                    new.append(openings[a])
                    temp.remove(at: b)
                }
            }
        }
        return new
    }

    @IBAction func onPlay(_ sender: GeneralStyleButton) {
        print(difficultyViewModel.getChosenMovesCount())
        let movesCountFilter = difficultyViewModel.getChosenMovesCount()
        let simplifiedOpeningSequences = getFilteredOpenings(movesCountFilter: movesCountFilter)
        coordinator?.proceedToGame(openingsData: simplifiedOpeningSequences)
    }

    @objc func onBackButton2(sender: UIBarButtonItem) {
        guard let prevController = previousController else { return }
        prevController.openingViewModel.resetTable()
        prevController.selectedOpenings = []
        UserDefaults.standard.setValue([], forKey: "SelectedOpeningNames")
        coordinator?.popController()
    }
}
