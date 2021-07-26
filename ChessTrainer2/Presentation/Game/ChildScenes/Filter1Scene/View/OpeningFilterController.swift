//
//  PickOpeningController.swift
//  ChessTrainer2
//
//  Created by lado tsivtsivadze on 7/4/21.
//

import UIKit

class OpeningFilterController: GameViewController {
    
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var selectedItemsLabel: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var deselectButton: UIButton!
    

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print("Init")
        
        //fatalError("init(coder:) has not been implemented")
    }
    
    unowned var nextButtonCode: UIBarButtonItem {
        let nextButton = UIBarButtonItem(title: "Next",
                                         style: .done,
                                         target: self,
                                         action: #selector(onNextButton))
        nextButton.isEnabled = false
        return nextButton
    }
    
    unowned var backButtonCode: UIBarButtonItem {
        let backButton = UIBarButtonItem(title: "Back",
                                         style: .plain,
                                         target: self,
                                         action: #selector(onBackButton))
        return backButton
    }
    
    unowned var backButton: UIBarButtonItem {
        return navigationItem.leftBarButtonItem!
    }
    
    unowned var nextButton: UIBarButtonItem {
        return navigationItem.rightBarButtonItem!
    }

    var openingViewModel: OpeningFilterViewModel!
    var selectedRowCount: Int = 0

    var openings: [UniqueOpening] {
        let openingParser = OpeningParser()
        return openingParser.uniqueOpenings
    }

    var selectedOpenings: [UniqueOpening] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        print("didload")
        setUpLayout()
        configureViewModel()
        openingViewModel.createObjects()
    }

    func configureViewModel() {
        openingViewModel = OpeningFilterViewModel(with: tblView,
                                                  with: searchBar,
                                                  with: self)
    }
    
    func setUpLayout() {
        setUpButtons()
    }
    
    private func setUpButtons() {
        deselectButton.isEnabled = false
        
        navigationItem.rightBarButtonItem = nextButtonCode
        navigationItem.leftBarButtonItem = backButtonCode
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        openingViewModel.removeFilter()
    }
    
    @IBAction func onDeselectAll(_ sender: Any) {
        selectedOpenings = []
        openingViewModel.resetTable()
    }
    
    @objc func onNextButton(sender: UIBarButtonItem) {
        //let toBePrinted = selectedOpenings.map { $0.name }
//        print(toBePrinted)
//        print("Userdefaults: \(SelectedDataManager.shared.selectedOpeningNames)")
        coordinator?.proceedToDifficultyPicker(rootController: self)
    }
    
    @objc func onBackButton(sender: UIBarButtonItem) {
        openingViewModel.resetTable()
        coordinator?.popController()
    }
    
    deinit {
        print("filter1 deinit")
    }
}

