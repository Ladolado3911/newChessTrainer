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
    
    private var dataSource: OpeningFilterTableDataSource!
    var openingViewModel: PickOpeningViewModel!
    var rootController: StartController!
    var selectedRowCount: Int = 0
    
    var openings: [UniqueOpening] {
        let openingParser = OpeningParser()
        return openingParser.uniqueOpenings
    }
    
    var chosenOpenings: [String] = []
        
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
        let nextButton = UIBarButtonItem(title: "Next",
                                     style: .done,
                                     target: self,
                                     action: #selector(onNextButton))
        
        let backButton = UIBarButtonItem(title: "Back",
                                         style: .plain,
                                         target: self,
                                         action: #selector(onBackButton))

        navigationItem.rightBarButtonItem = nextButton
        navigationItem.leftBarButtonItem = backButton
    }
    
    @IBAction func onDeselectAll(_ sender: Any) {
        dataSource.resetTableView()
    }
    
    @objc func onNextButton(sender: UIBarButtonItem) {
        coordinator?.proceedToController(controller: DiffiucultyPickerController.self,
                                         present: .push) {}
    }
    
    @objc func onBackButton(sender: UIBarButtonItem) {
        dataSource.resetTableView()
        coordinator?.popController()
    }
}

