//
//  GameController.swift
//  ChessTrainer2
//
//  Created by Ladolado3911 on 5/27/21.
//

import UIKit

class OpeningGameController: UIViewController {

    @IBOutlet weak var collectView: UICollectionView!
    @IBOutlet weak var openingName: UILabel!
    @IBOutlet weak var moveNum: UILabel!
    @IBOutlet weak var stats: UILabel!
    @IBOutlet weak var openingStats: UILabel!
    
    private var openingFilter: OpeningFilter!
    private var openingParser: OpeningParser!
    private var viewModel: OpeningViewModel!
    private var dataSource: OpeningGameCollectionDataSource!
    
    // filters
    var filters: Filter?

    override func viewDidLoad() {
        super.viewDidLoad()
        //configViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
 
        configViewModel()
        dataSource.setInitialInfo()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController!.navigationBar.prefersLargeTitles = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController!.navigationBar.prefersLargeTitles = true
    }
    
    func configViewModel() {
        openingFilter = OpeningFilter(nameFilter: filters!.nameFilter, difficultyFilter: filters!.difficultyFilter)
        openingParser = OpeningParser()
        viewModel = OpeningViewModel(with: openingFilter, with2: openingParser)
        dataSource = OpeningGameCollectionDataSource(collectView: collectView, controller: self, viewModel: viewModel)
    }
}
