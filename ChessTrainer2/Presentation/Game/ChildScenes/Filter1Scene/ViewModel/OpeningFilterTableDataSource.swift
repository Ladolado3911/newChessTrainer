//
//  OpeningFilterTableDataSource.swift
//  ChessTrainer2
//
//  Created by Ladolado3911 on 18.07.21.
//

import UIKit

class OpeningFilterTableDataSource: GenericTableDataSource<[UniqueOpening], OpeningFilterController, String.Type> {
    
    private var isCellHighlighted: Bool = false
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cellsArr.first
        let realCell = tableView.dequeueReusableCell(withIdentifier: (cell?.identifier)!) as? OpeningCell
        guard let data = data else { return realCell! }
        realCell!.opening = data[indexPath.row]
        return realCell!
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
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
                    rootController.selectedRowCount += 1
                    rootController.selectedItemsLabel.text = "\(rootController.selectedRowCount) items selected"
                }
                else {
                    rootController.selectedRowCount -= 1
                    rootController.selectedItemsLabel.text = "\(rootController.selectedRowCount) items selected"
                }
            }
            else {
                tempData.append(opening)
            }
        }
        data = tempData
        tableView.reloadData()
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
        rootController.selectedRowCount = 0
        rootController.selectedItemsLabel.text = "\(rootController.selectedRowCount) items selected"
        tableview.reloadData()
    }
}
