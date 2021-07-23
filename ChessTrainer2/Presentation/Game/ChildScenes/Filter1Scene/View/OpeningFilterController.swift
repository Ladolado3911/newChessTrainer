//
//  PickOpeningController.swift
//  ChessTrainer2
//
//  Created by lado tsivtsivadze on 7/4/21.
//

import UIKit

class OpeningFilterController: GameViewController {
    
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var selectedItemsLabel: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var openingViewModel: OpeningFilterViewModel!
    var selectedRowCount: Int = 0

    var openings: [UniqueOpening] {
        let openingParser = OpeningParser()
        return openingParser.uniqueOpenings
    }

    var selectedOpenings: [UniqueOpening] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewModel()
        openingViewModel.setUpLayout()
        openingViewModel.createObjects()
    }

    func configureViewModel() {
        openingViewModel = OpeningFilterViewModel(with: tblView,
                                                  with: searchBar,
                                                  with: self)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        openingViewModel.removeFilter()
    }
    
    @IBAction func onDeselectAll(_ sender: Any) {
        selectedOpenings = []
        openingViewModel.resetTable()
    }
    
    @objc func onNextButton(sender: UIBarButtonItem) {
        let toBePrinted = selectedOpenings.map { $0.name }
        print(toBePrinted)
        coordinator?.proceedToDifficultyPicker(rootController: self)
    }
    
    @objc func onBackButton(sender: UIBarButtonItem) {
        openingViewModel.resetTable()
        coordinator?.popController()
    }
}

