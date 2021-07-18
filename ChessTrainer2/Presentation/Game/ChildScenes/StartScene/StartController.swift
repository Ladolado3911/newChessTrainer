//
//  ViewController.swift
//  ChessTrainer2
//
//  Created by Ladolado3911 on 5/27/21.
//

import UIKit

class StartController: GameViewController {

    @IBOutlet weak var start: UIButton!
    
    @IBOutlet weak var chosenOpening: UILabel!
    @IBOutlet weak var chosenDifficulty: UILabel!
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var nameFilter: String?
    var levelFilter: Int?
    
    lazy var openingGameController: OpeningGameController = {
        let vc = getController(storyboardID: .openingGame, controllerID: .openingGameController) as? OpeningGameController
        return vc!
    }()
    
    lazy var statsController: StatsController = {
        let vc = getController(storyboardID: .main, controllerID: .statsController) as? StatsController
        return vc!
    }()
    
    lazy var pickOpeningController: OpeningFilterController = {
        let vc = getController(storyboardID: .pickOpening, controllerID: .pickOpening) as? OpeningFilterController
        return vc!
    }()
    
    lazy var pickDifficultyController: DiffiucultyPickerController = {
        let vc = getController(storyboardID: .picDifficulty, controllerID: .pickDifficulty) as? DiffiucultyPickerController
        return vc!
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        spinner.isHidden = true

    }

    @IBAction func onStart(_ sender: Any) {
        //navigationController!.navigationBar.isHidden = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) { [weak self] in
            guard let self = self else { return }
            guard let nameFilter = self.nameFilter else { return }
            guard let levelFilter = self.levelFilter else { return }
            
            let filter = Filter(nameFilter: nameFilter, difficultyFilter: levelFilter)
            self.openingGameController.filters = filter
            pushController(from: self, to: self.openingGameController, method: .withBackItem)
        }
    }
    
    @IBAction func onChooseOpening(_ sender: Any) {
        view.isUserInteractionEnabled = false
        view.backgroundColor = .gray
        spinner.isHidden = false
        spinner.startAnimating()
        let vc = pickOpeningController
        vc.rootController = self

        self.present(vc, animated: true) { [weak self] in
            guard let self = self else { return }
            self.view.isUserInteractionEnabled = true
            self.view.backgroundColor = .white
            self.spinner.stopAnimating()
            self.spinner.isHidden = true
        }
    }
    
    @IBAction func onChooseDifficulty(_ sender: Any) {
        view.isUserInteractionEnabled = false
        view.backgroundColor = .gray
        spinner.isHidden = false
        spinner.startAnimating()
        
        let vc = pickDifficultyController
        vc.rootController = self
        present(vc, animated: true) { [weak self] in
            guard let self = self else { return }
            self.view.isUserInteractionEnabled = true
            self.view.backgroundColor = .white
            self.spinner.stopAnimating()
            self.spinner.isHidden = true
        }
    }
}

