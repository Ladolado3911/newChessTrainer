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
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cell = Cell(nibName: "OpeningCell", identifier: "OpeningCell")
        dataSource = OpeningFilterTableDataSource(tableView: tblView,
                                                  cellsArray: [cell],
                                                  rootController: self,
                                                  dataArray: openings,
                                                  dataElement: String.self)

//        guard let rootController = self.rootController else { return }
//        let parser = OpeningParser()
//        self.openingViewModel = PickOpeningViewModel(with: self.openingPicker, with: parser, with: rootController, with: self)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func onSetOpening(_ sender: Any) {
        dismiss(animated: true) { [weak self] in
            guard let self = self else { return }
            guard let rootController = self.rootController else { return }
            //let name = self.openingViewModel.getNameFilter()
//            rootController.nameFilter = name
//            rootController.chosenOpening.text = name
        }
    }
}

