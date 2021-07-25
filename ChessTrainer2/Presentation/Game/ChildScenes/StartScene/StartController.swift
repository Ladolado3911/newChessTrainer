//
//  ViewController.swift
//  ChessTrainer2
//
//  Created by Ladolado3911 on 5/27/21.
//

import UIKit

class StartController: GameViewController {

    @IBOutlet weak var start: UIButton!
    @IBOutlet weak var chooseDifficultyButton: GeneralStyleButton!
    
    @IBOutlet weak var chosenOpening: UILabel!
    @IBOutlet weak var chosenDifficulty: UILabel!
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var nameFilter: String?
    var levelFilter: Int?
    
    private var startButtonState: Bool = false
    private var difficultyButtonState: Bool = false
    
    var chosenOpenings: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        spinner.isHidden = true
        disableButton(button: start, state: &startButtonState)
        disableButton(button: chooseDifficultyButton, state: &difficultyButtonState)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func enableButton(button: UIButton, state: inout Bool) {
        state = true
        updateButtonStyle(button: button, state: state)
    }
    
    func disableButton(button: UIButton, state: inout Bool) {
        state = false
        updateButtonStyle(button: button, state: state)
    }
    
    func updateButtonStyle(button: UIButton, state: Bool) {
        if state {
            button.isEnabled = true
            button.backgroundColor = ProjectColors.white
            button.setTitleColor(ProjectColors.purple, for: .normal)
            button.layer.cornerRadius = 15
            button.layer.shadowOpacity = 0.3
            button.layer.shadowColor = ProjectColors.purple.cgColor
        }
        else {
            button.isEnabled = false
            button.backgroundColor = ProjectColors.white
            button.setTitleColor(UIColor.gray, for: .normal)
            button.layer.cornerRadius = 15
            button.layer.shadowOpacity = 0.3
            button.layer.shadowColor = UIColor.gray.cgColor
        }
    }
    
    @IBAction func onTempTest(_ sender: Any) {
        print(chosenOpenings)
    }
    

    @IBAction func onStart(_ sender: Any) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) { [weak self] in
            guard let self = self else { return }
            guard let nameFilter = self.nameFilter else { return }
            guard let levelFilter = self.levelFilter else { return }
            
            let filter = Filter(nameFilter: nameFilter, difficultyFilter: levelFilter)
            //self.coordinator?.proceedToGame(filters: filter)
        }
    }
    
    @IBAction func onChooseOpening(_ sender: Any) {
        view.isUserInteractionEnabled = false
        spinner.isHidden = false
        spinner.startAnimating()

        coordinator?.proceedToOpeningPicker(rootController: self, completion: { [weak self] in
            guard let self = self else { return }
            self.view.isUserInteractionEnabled = true
            self.spinner.stopAnimating()
            self.spinner.isHidden = true
        })
    }
    
    @IBAction func onChooseDifficulty(_ sender: Any) {
        view.isUserInteractionEnabled = false
        spinner.isHidden = false
        spinner.startAnimating()

//        coordinator?.proceedToDifficultyPicker(rootController: self, completion: { [weak self] in
//            guard let self = self else { return }
//            self.view.isUserInteractionEnabled = true
//            self.spinner.stopAnimating()
//            self.spinner.isHidden = true
//        })
    }
}

