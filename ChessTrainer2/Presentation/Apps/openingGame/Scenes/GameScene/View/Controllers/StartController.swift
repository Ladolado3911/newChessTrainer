//
//  ViewController.swift
//  ChessTrainer2
//
//  Created by Ladolado3911 on 5/27/21.
//

import UIKit

class StartController: UIViewController {

    @IBOutlet weak var start: UIButton!
    
    @IBOutlet weak var openingPicker: UIPickerView!
    @IBOutlet weak var difficultyPicker: UIPickerView!
    
    private var mainViewModel: MainViewModel!
    
    lazy var openingGameController: OpeningGameController = {
        let vc = getController(storyboardID: .openingGame, controllerID: .openingGameController) as? OpeningGameController
        return vc!
    }()
    
    lazy var statsController: StatsController = {
        let vc = getController(storyboardID: .main, controllerID: .statsController) as? StatsController
        return vc!
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configViewModel()

    }
    
    func configViewModel() {
        mainViewModel = MainViewModel(distributor: DataDistributor(), openingParser: OpeningParser(), openingPicker: openingPicker, difficultyPicker: difficultyPicker)
    }

    @IBAction func onStart(_ sender: Any) {
        //navigationController!.navigationBar.isHidden = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
            self.openingGameController.filters = self.mainViewModel.getFilters()
            pushController(from: self, to: self.openingGameController, method: .withBackItem)
        }
//        openingGameController.filters = mainViewModel.getFilters()
//        pushController(from: self, to: openingGameController, method: .withBackItem)
    }
}

