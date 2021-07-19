//
//  PickOpeningController.swift
//  ChessTrainer2
//
//  Created by lado tsivtsivadze on 7/4/21.
//

import UIKit

class OpeningFilterController: GameViewController {
    
    @IBOutlet weak var tblView: UITableView!
    
    private var dataSource: OpeningFilterTableDataSource!
    var openingViewModel: PickOpeningViewModel!
    var rootController: StartController!
    
    var openings: [String] {
        let openingParser = OpeningParser()
        return openingParser.uniqueOpeningNames
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
    
    func resetTableView() {
        guard let tableCells = tblView.visibleCells as? [OpeningCell] else { return }
        tableCells.forEach { cell in
            if cell.fancyView.backgroundColor == ProjectColors.purple {
                cell.fancyView.backgroundColor = .white
                cell.openingNameLabel.textColor = ProjectColors.purple
                tblView.reloadData()
            }
        }
    }
    
    @objc func onNextButton(sender: UIBarButtonItem) {
        coordinator?.proceedToController(controller: DiffiucultyPickerController.self,
                                         present: .push) {}
    }
    
    @objc func onBackButton(sender: UIBarButtonItem) {
        resetTableView()
        coordinator?.popController()
    }
}

