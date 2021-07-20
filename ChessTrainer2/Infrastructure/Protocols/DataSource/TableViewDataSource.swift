//
//  TableDataSource.swift
//  LadoTsivtsivadze_51
//
//  Created by lado tsivtsivadze on 7/13/21.
//

import UIKit


protocol TableViewDataSource: TableDataSource {
    
    associatedtype DataArray
    associatedtype RootController
    associatedtype Element
    
    var tableview: UITableView! { get set }
    var cellsArr: [Cell]! { get set }

    init(tableView tblView: UITableView,
         cellsArray arr: [Cell],
         rootController controller: RootController,
         dataArray data: DataArray,
         dataElement element: Element)
    
    init(tableView tblView: UITableView,
         cellsArray arr: [Cell],
         rootController controller: RootController,
         count data: Int)
    
    func configTable()
    func configCells()
}

extension TableViewDataSource {
    
    func configTable() {
        self.tableview.dataSource = self
        self.tableview.delegate = self
    }
    
    func configCells() {
        cellsArr.forEach { cell in
            let nib = UINib(nibName: cell.nibName, bundle: nil)
            self.tableview.register(nib, forCellReuseIdentifier: cell.identifier)
        }
    }
}

class GenericTableDataSource<T, E, F>: NSObject, TableViewDataSource {
    
    typealias DataArray = T
    typealias RootController = E
    typealias Element = F
    
    var tableview: UITableView!
    var cellsArr: [Cell]!
    var rootController: RootController!
    var data: DataArray?
    var element: Element!
    var count: Int?
    
    var counter: Int {
        if let data = self.data as? Array<Any> {
            return data.count
        }
        else {
            return count ?? 0
        }
    }

    required init(tableView tblView: UITableView,
         cellsArray arr: [Cell],
         rootController controller: RootController,
         dataArray data: DataArray,
         dataElement element: Element) {
        
        super.init()
        self.tableview = tblView
        self.cellsArr = arr
        self.rootController = controller
        self.data = data
        self.element = element
        self.configTable()
        self.configCells()
        self.tableview.reloadData()
    }
    
    required init(tableView tblView: UITableView,
         cellsArray arr: [Cell],
         rootController controller: RootController,
         count counter: Int) {
        
        super.init()
        self.tableview = tblView
        self.cellsArr = arr
        self.rootController = controller
        self.count = counter
        self.configTable()
        self.configCells()
        self.tableview.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return counter
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        
    }
    
    
}

