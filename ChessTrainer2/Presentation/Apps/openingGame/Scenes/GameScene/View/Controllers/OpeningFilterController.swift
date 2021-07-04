//
//  PickOpeningController.swift
//  ChessTrainer2
//
//  Created by lado tsivtsivadze on 7/4/21.
//

import UIKit

class OpeningFilterController: UIViewController {
    
    @IBOutlet weak var openingPicker: UIPickerView!
    var openingViewModel: PickOpeningViewModel!
    weak var rootController: StartController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let rootController = rootController else { return }
        openingViewModel = PickOpeningViewModel(with: openingPicker, with: OpeningParser(), with: rootController)

    }
    
    @IBAction func onSetOpening(_ sender: Any) {
        dismiss(animated: true) { [weak self] in
            guard let self = self else { return }
            guard let rootController = self.rootController else { return }
            rootController.nameFilter = self.openingViewModel.getNameFilter()
        }
    }
}
