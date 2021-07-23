//
//  PickOpeningViewModel.swift
//  ChessTrainer2
//
//  Created by lado tsivtsivadze on 7/4/21.
//

import Foundation
import UIKit

class OpeningFilterViewModel {

    var openingParser: OpeningParser = OpeningParser()
    var rootController: OpeningFilterController!
    var dataSourceViewModel: OpeningFilterTableDataSource!
    var searchBarViewModel: OpeningFilterSearchbar!
    var tableView: UITableView!
    var searchBar: UISearchBar!
    
    var nextButton: UIBarButtonItem!
    var backButton: UIBarButtonItem!
    
    var openings: [UniqueOpening] {
        let openingParser = openingParser
        return openingParser.uniqueOpenings
    }
    
    init(with tableView: UITableView,
         with searchBar: UISearchBar,
         with rootController: OpeningFilterController) {
        
        self.tableView = tableView
        self.searchBar = searchBar
        self.rootController = rootController
        
    }
    
    func createObjects() {
        let cell = Cell(nibName: "OpeningCell", identifier: "OpeningCell")
        dataSourceViewModel = OpeningFilterTableDataSource(tableView: tableView,
                                                           cellsArray: [cell],
                                                           rootController: rootController,
                                                           dataArray: openings,
                                                           dataElement: String.self)
        
        searchBarViewModel = OpeningFilterSearchbar(searchBar: searchBar,
                                                    with: openings,
                                                    with: rootController)
    }
    
    func setUpLayout() {
        setUpButtons()
    }
    
    private func setUpButtons() {
        nextButton = UIBarButtonItem(title: "Next",
                                     style: .done,
                                     target: self,
                                     action: #selector(rootController.onNextButton))
        
        backButton = UIBarButtonItem(title: "Back",
                                     style: .plain,
                                     target: self,
                                     action: #selector(rootController.onBackButton))
        
        nextButton.isEnabled = false
        
        rootController.navigationItem.rightBarButtonItem = nextButton
        rootController.navigationItem.leftBarButtonItem = backButton
    }
    
    func resetTable() {
        dataSourceViewModel.resetTableView()
    }
//
//    func getNameFilter() -> String {
//        let nameFilter = openings[openingPicker.selectedRow(inComponent: 0)]
//        return nameFilter
//    }

}
