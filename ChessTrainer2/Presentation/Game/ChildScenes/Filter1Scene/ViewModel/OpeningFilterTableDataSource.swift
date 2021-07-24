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

    func updateTable(with data: [UniqueOpening]) {
        var newData = data
        //let originalData = self.data!
        
        let newDataNames = data.map { $0.name }
        //let originalDataNames = self.data!.map { $0.name }
        guard let selectedOpeningNames = UserDefaults.standard.value(forKey: "SelectedOpeningNames") as? [String] else { return }
        
        for item in 0..<selectedOpeningNames.count {
            let openingName = selectedOpeningNames[item]

            if newDataNames.contains(openingName) {
                newData[item].isSelected = true
            }
        }
        self.data = newData
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
                    SelectedDataManager.shared.addToSelections(openingName: newOpening.name!)
                    rootController.selectedRowCount += 1
                    rootController.selectedItemsLabel.text = "\(rootController.selectedRowCount) items selected"
                }
                else {
                    rootController.selectedOpenings = rootController.selectedOpenings.filter { $0.name != newOpening.name }
                    SelectedDataManager.shared.removeFromSelections(openingName: newOpening.name!)
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
        
//        let selectedNames = rootController?.selectedOpenings.map { $0.name }
//        UserDefaults.standard.setValue(selectedNames, forKey: "SelectedOpeningNames")
    }
    
    func setNextButtonState() {
        if nothingIsSelected {
            rootController.nextButton.isEnabled = false
            rootController.deselectButton.isEnabled = false
        }
        else {
            rootController.nextButton.isEnabled = true
            rootController.deselectButton.isEnabled = true
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
        
        UserDefaults.standard.setValue([], forKey: "SelectedOpeningNames")
        tableview.reloadData()
    }
}
