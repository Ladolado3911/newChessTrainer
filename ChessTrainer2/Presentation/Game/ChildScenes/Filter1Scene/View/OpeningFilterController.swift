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
    
    var dataSource: OpeningFilterTableDataSource!
    var openingViewModel: PickOpeningViewModel!
    var rootController: StartController!
    var selectedRowCount: Int = 0
    
    var nextButton: UIBarButtonItem!
    var backButton: UIBarButtonItem!
    
    var openings: [UniqueOpening] {
        let openingParser = OpeningParser()
        return openingParser.uniqueOpenings
    }
    
    var selectedOpenings: [UniqueOpening] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setBarButtons()
        
        let cell = Cell(nibName: "OpeningCell", identifier: "OpeningCell")
        dataSource = OpeningFilterTableDataSource(tableView: tblView,
                                                  cellsArray: [cell],
                                                  rootController: self,
                                                  dataArray: openings,
                                                  dataElement: String.self)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //rootController.chosenOpenings = chosenOpenings
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    func setBarButtons() {
        nextButton = UIBarButtonItem(title: "Next",
                                     style: .done,
                                     target: self,
                                     action: #selector(onNextButton))
        
        backButton = UIBarButtonItem(title: "Back",
                                         style: .plain,
                                         target: self,
                                         action: #selector(onBackButton))

        navigationItem.rightBarButtonItem = nextButton
        navigationItem.leftBarButtonItem = backButton
        
        nextButton.isEnabled = false
    }
    
    @IBAction func onDeselectAll(_ sender: Any) {
        selectedOpenings = []
        dataSource.resetTableView()
    }
    
    @objc func onNextButton(sender: UIBarButtonItem) {
        let toBePrinted = selectedOpenings.map { $0.name }
        print(toBePrinted)
        coordinator?.proceedToDifficultyPicker(rootController: self)
    }
    
    @objc func onBackButton(sender: UIBarButtonItem) {
        dataSource.resetTableView()
        coordinator?.popController()
    }
}

