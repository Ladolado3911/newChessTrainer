//
//  OpeningFilterTableDataSource.swift
//  ChessTrainer2
//
//  Created by Ladolado3911 on 18.07.21.
//

import UIKit

class OpeningFilterTableDataSource: GenericTableDataSource<[UniqueOpening], OpeningFilterController, String.Type> {
        
    var nothingIsSelected: Bool {
        let boolData = data!.map { $0.isSelected }
        if boolData.contains(true) {
            return false
        }
        else {
            return true
        }
    }
    
//    var searchBarViewModel: OpeningFilterSearchbar? {
//        guard let rootController = rootController else { return nil }
//        return rootController.openingViewModel.searchBarViewModel
//    }
//    
//    var filtered: [UniqueOpening] {
//        guard let searchBarViewModel = searchBarViewModel else { return [] }
//        guard let filtered = searchBarViewModel.filteredData else { return [] }
//        return filtered
//    }
//    
//    var isSearchBarActive: Bool {
//        guard let searchBarViewModel = searchBarViewModel else { return false }
//        guard let isActive = searchBarViewModel.isSearchBarActive else { return false }
//        return isActive
//    }
    
    func updateTable(with data: [UniqueOpening]) {
        self.data = data
        self.tableview.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cellsArr.first
        let realCell = tableView.dequeueReusableCell(withIdentifier: (cell?.identifier)!) as? OpeningCell
        guard let data = data else { return realCell! }
        realCell!.opening = data[indexPath.row]
        return realCell!
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let unwrappedData = data else { return }
        let targetOpening = unwrappedData[indexPath.row]
        var tempData: [UniqueOpening] = []
        
        for opening in data! {
            if opening.name == targetOpening.name {
                var newOpening = opening
                newOpening.changeStatus()
                tempData.append(newOpening)
                
                if newOpening.isSelected {
                    rootController.selectedOpenings.append(newOpening)
                    rootController.selectedRowCount += 1
                    rootController.selectedItemsLabel.text = "\(rootController.selectedRowCount) items selected"
                }
                else {
                    rootController.selectedOpenings = rootController.selectedOpenings.filter { $0.name != newOpening.name }
                    rootController.selectedRowCount -= 1
                    rootController.selectedItemsLabel.text = "\(rootController.selectedRowCount) items selected"
                }
            }
            else {
                tempData.append(opening)
            }
        }
        data = tempData
        setNextButtonState()
        tableView.reloadData()
    }
    
    func setNextButtonState() {
        if nothingIsSelected {
            rootController.openingViewModel.nextButton.isEnabled = false
        }
        else {
            rootController.openingViewModel.nextButton.isEnabled = true
        }
    }
    
    func resetTableView() {
        guard let unwrappedData = data else { return }
        var tempData: [UniqueOpening] = []

        unwrappedData.forEach { uniqueOpening in
            if uniqueOpening.isSelected {
                var newOpening = uniqueOpening
                newOpening.isSelected = false
                tempData.append(newOpening)
            }
            else {
                tempData.append(uniqueOpening)
            }
        }
        data = tempData
        setNextButtonState()
        rootController.selectedRowCount = 0
        rootController.selectedItemsLabel.text = "\(rootController.selectedRowCount) items selected"
        tableview.reloadData()
    }
}
