//
//  FilterSearchbar.swift
//  ChessTrainer2
//
//  Created by Ladolado3911 on 23.07.21.
//

import UIKit

final class OpeningFilterSearchbar: NSObject, SearchbarProtocol {

    typealias RootController = OpeningFilterController
    typealias TableDataType = UniqueOpening
    
    var searchBar: UISearchBar!
    var data: [TableDataType]?
    var filteredData: [TableDataType]?
    var isSearchBarActive: Bool?
    var rootController: RootController?
    
    var dataSource: OpeningFilterTableDataSource? {
        guard let rootController = rootController else { return nil }
        return rootController.openingViewModel.dataSourceViewModel
    }
    
    init(searchBar search: UISearchBar,
         with data: [UniqueOpening],
         with rootController: OpeningFilterController) {
        super.init()
        
        self.searchBar = search
        self.data = data
        self.rootController = rootController
        
        self.isSearchBarActive = false
        self.searchBar.delegate = self
    }
    
    func disableFilter() {
        guard let dataSource = dataSource else { return }
        rootController!.view.endEditing(true)
        isSearchBarActive = false
        //print("disabling filter")
        dataSource.tableview.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        disableFilter()
    }
    
    func searchBarResultsListButtonClicked(_ searchBar: UISearchBar) {
        disableFilter()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        let filteredUniqueOpenings = (data!.filter { $0.name!.contains(searchText) || testIfArrayContains(input: $0.openings.map { $0.name }, testString: searchText) })
        let filteredUniqueOpenings = (data!.filter { $0.name!.lowercased().contains(searchText.lowercased()) })
        isSearchBarActive = true
        
        for opening in filteredUniqueOpenings {
            if opening.isSelected {
                SelectedDataManager.shared.removeFromSelections(openingName: opening.name!)
                //print("removed \(opening.name!)")
            }
        }

        filteredData = filteredUniqueOpenings
        dataSource?.updateTable(with: filteredData!)
        if searchText == "" {
            filteredData = data
            dataSource?.updateTable(with: data!)
        }
        //dataSource?.tableview.reloadData()
    }
    
    func testIfArrayContains(input arr: [String], testString item: String) -> Bool {
        for name in arr {
            if name.contains(item) {
                return true
            }
        }
        return false
    }
    
}
