//
//  SearchbarProtocol.swift
//  ChessTrainer2
//
//  Created by Ladolado3911 on 23.07.21.
//

import UIKit

protocol SearchbarProtocol: UISearchBarDelegate {
    
    associatedtype tableDataType
    associatedtype rootController
    
    var searchBar: UISearchBar! { get set }
    
    var data: [tableDataType]? { get set }
    var filteredData: [tableDataType]? { get set }
    var isSearchBarActive: Bool? { get set }
    var rootController: rootController? { get set }
    
    init(searchBar search: UISearchBar,
         with data: [tableDataType],
         with rootController: rootController)
    
}
