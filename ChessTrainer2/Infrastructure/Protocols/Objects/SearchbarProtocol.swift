//
//  SearchbarProtocol.swift
//  ChessTrainer2
//
//  Created by Ladolado3911 on 23.07.21.
//

import UIKit

protocol SearchbarProtocol: UISearchBarDelegate {
    
    associatedtype TableDataType
    associatedtype RootController
    
    var searchBar: UISearchBar! { get set }
    
    var data: [TableDataType]? { get set }
    var filteredData: [TableDataType]? { get set }
    var isSearchBarActive: Bool? { get set }
    var rootController: RootController? { get set }
    
    init(searchBar search: UISearchBar,
         with data: [TableDataType],
         with rootController: RootController)
    
}
