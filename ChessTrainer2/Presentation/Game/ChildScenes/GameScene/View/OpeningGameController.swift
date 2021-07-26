//
//  GameController.swift
//  ChessTrainer2
//
//  Created by Ladolado3911 on 5/27/21.
//

import UIKit

class OpeningGameController: GameViewController {

    @IBOutlet weak var collectView: UICollectionView!
    @IBOutlet weak var openingName: UILabel!
    @IBOutlet weak var moveNum: UILabel!
    @IBOutlet weak var stats: UILabel!
    @IBOutlet weak var openingStats: UILabel!
    
    private var openingFilter: OpeningFilter!
    private var openingParser: OpeningParser!
    private var viewModel: OpeningViewModel!
    private var dataSource: OpeningGameCollectionDataSource!
    
    var openingsData: [Opening]?
    
    // filters
    var filters: Filter?

    override func viewDidLoad() {
        super.viewDidLoad()
        //configViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configViewModel()
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let self = self else { return }
            self.dataSource.setInitialInfo()
        }
    }

    func configViewModel() {
        guard let openingsData = openingsData else { return }
        
//        openingFilter = OpeningFilter(nameFilter: filters!.nameFilter, difficultyFilter: filters!.difficultyFilter)
//        openingParser = OpeningParser()
//        viewModel = OpeningViewModel(with: openingFilter, with2: openingParser)
        dataSource = OpeningGameCollectionDataSource(collectView: collectView,
                                                     controller: self,
                                                     openingsData: openingsData)
    }
    
    deinit {
        print("game deinit")
    }
}
