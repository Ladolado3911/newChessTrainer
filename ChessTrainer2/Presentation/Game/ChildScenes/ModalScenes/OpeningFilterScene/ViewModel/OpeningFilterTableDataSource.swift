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
        print(indexPath.row)
        return realCell!
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    override func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? OpeningCell else { return }
        cell.selectionStyle = .none
        if cell.fancyView.backgroundColor == ProjectColors.purple {
            cell.fancyView.backgroundColor = .white
            cell.openingNameLabel.textColor = ProjectColors.purple
            print("Unhighlight")
            
//            let openingName = cell?.openingNameLabel.text
//            rootController.chosenOpenings = rootController.chosenOpenings.filter { $0 != openingName }
//            rootController.selectedRowCount -= 1
//            rootController.selectedItemsLabel.text = "\(rootController.selectedRowCount) items selected"
        }
        else {
            cell.fancyView.backgroundColor = ProjectColors.purple
            cell.openingNameLabel.textColor = .white
            print("Highlight")
            
//            let openingName = cell?.openingNameLabel.text
//            rootController.chosenOpenings.append(openingName!)
//            rootController.selectedRowCount += 1
//            rootController.selectedItemsLabel.text = "\(rootController.selectedRowCount) items selected"
        }
        //tableView.reloadData()
    }
}
