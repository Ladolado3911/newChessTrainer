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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBarButtons()
        //difficultyViewModel = PickDifficultyViewModel(with: difficultyPicker, with: OpeningParser(), with: previousController)


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
        prevController.dataSource.resetTableView()
        prevController.selectedOpenings = []
        coordinator?.popController()
    }
}
