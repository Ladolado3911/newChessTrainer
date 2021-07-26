//
//  PickOpeningViewModel.swift
//  ChessTrainer2
//
//  Created by lado tsivtsivadze on 7/4/21.
//

import Foundation
import UIKit

class OpeningFilterViewModel {

    unowned var rootController: OpeningFilterController!
    var dataSourceViewModel: OpeningFilterTableDataSource!
    var searchBarViewModel: OpeningFilterSearchbar!
    unowned var tableView: UITableView!
    unowned var searchBar: UISearchBar!
    
    unowned var nextButton: UIBarButtonItem!
    unowned var backButton: UIBarButtonItem!
    
    var openings: [UniqueOpening] {
        let openingParser = OpeningParser()
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
    
    func removeFilter() {
        searchBarViewModel.disableFilter()
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
