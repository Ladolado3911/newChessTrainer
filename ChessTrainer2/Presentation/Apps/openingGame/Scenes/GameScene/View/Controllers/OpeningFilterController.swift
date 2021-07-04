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
    var rootController: StartController?
    @IBOutlet weak var spinner: UIActivityIndicatorView!
        
    override func loadView() {
        super.loadView()

        view.isUserInteractionEnabled = false
        view.backgroundColor = .gray
        spinner.isHidden = false
        spinner.startAnimating()
        print("here")
        
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let self = self else { return }
            guard let rootController = self.rootController else { return }
            let parser = OpeningParser()
            self.openingViewModel = PickOpeningViewModel(with: self.openingPicker, with: parser, with: rootController, with: self)
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.view.isUserInteractionEnabled = true
                self.view.backgroundColor = .white
                self.spinner.stopAnimating()
                self.spinner.isHidden = true
                print("init2")
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        guard let rootController = rootController else { return }
//        openingViewModel = PickOpeningViewModel(with: openingPicker, with: OpeningParser(), with: rootController)
//        print(openingViewModel.openings)
//        print("appeared")
    }
    
    @IBAction func onSetOpening(_ sender: Any) {
        dismiss(animated: true) { [weak self] in
            guard let self = self else { return }
            guard let rootController = self.rootController else { return }
            let name = self.openingViewModel.getNameFilter()
            rootController.nameFilter = name
            rootController.chosenOpening.text = name
        }
    }
}
