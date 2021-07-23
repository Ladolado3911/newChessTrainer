//
//  FilterSearchbar.swift
//  ChessTrainer2
//
//  Created by Ladolado3911 on 23.07.21.
//

import UIKit

final class OpeningFilterSearchbar: NSObject, SearchbarProtocol {

    typealias rootController = OpeningFilterController
    typealias tableDataType = UniqueOpening
    
    var searchBar: UISearchBar!
    var data: [UniqueOpening]?
    var filteredData: [UniqueOpening]?
    var isSearchBarActive: Bool?
    var rootController: OpeningFilterController?
    
    init(searchBar search: UISearchBar,
         with data: [UniqueOpening],
         with rootController: OpeningFilterController) {
        
        self.searchBar = search
        self.data = data
        self.rootController = rootController
        self.isSearchBarActive = false
    }
}
