//
//  OpeningFilterTableDataSource.swift
//  ChessTrainer2
//
//  Created by Ladolado3911 on 18.07.21.
//

import UIKit

class OpeningFilterTableDataSource: GenericTableDataSource<[String], OpeningFilterController, String.Type> {
    
    private var isCellHighlighted: Bool = false
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cellsArr.first
        let realCell = tableView.dequeueReusableCell(withIdentifier: (cell?.identifier)!) as? OpeningCell
        guard let data = data else { return realCell! }
        realCell!.openingName = data[indexPath.row]
        return realCell!
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    override func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? OpeningCell
        cell?.selectionStyle = .none
        if cell?.fancyView.backgroundColor == ProjectColors.purple {
            cell?.fancyView.backgroundColor = .white
            cell?.openingNameLabel.textColor = ProjectColors.purple
            tableview.reloadData()
            print("Unhighlight")
        }
        else {
            cell?.fancyView.backgroundColor = ProjectColors.purple
            cell?.openingNameLabel.textColor = .white
            tableview.reloadData()
            print("Highlight")
        }
    }
}
