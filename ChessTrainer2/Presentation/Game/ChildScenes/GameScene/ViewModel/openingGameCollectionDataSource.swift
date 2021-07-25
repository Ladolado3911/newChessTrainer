//
//  openingGameColelctionDataSource.swift
//  ChessTrainer2
//
//  Created by Ladolado3911 on 6/6/21.
//

import Foundation
import UIKit

class OpeningGameCollectionDataSource: CollectDataSource {
    
    weak var collectView: UICollectionView!
    weak var rootController: OpeningGameController!
    weak var viewModel: OpeningViewModel!
    
    private var openingsData: [Opening]!
    private var movesCountFilter: Int!
    
    var game: OpeningGame?

    var currentOpening: Opening?
    var currentMove: String?
    var moveChoices: [String]?
    var chosenMove: String?
    
    var moveIndex: Int = 0
    var openingIndex: Int = 0
    var isCorrectMove: Bool = false
    
    weak var color1 = ProjectColors.purple
    weak var color2 = ProjectColors.white
    
    var correctMoveCount: Int = 0
    var correctOpeningCount: Int = 0
//    var correctCount: Int = 0
    
    init(collectView collect: UICollectionView,
         controller ctrl: OpeningGameController,
         openingsData data: [Opening]) {
        
        super.init()
        collectView = collect
        rootController = ctrl

        openingsData = data
        
        collectView.dataSource = self
        collectView.delegate = self
    }
    
    func updateLabels() {
        rootController.stats.text = "Moves: \(correctMoveCount) / \(currentOpening!.newMovesCount)"
        rootController.openingStats.text = "Openings: \(correctOpeningCount) / \(game!.data.count)"
        rootController.moveNum.text = "Move: \(moveIndex + 1)"
    }
    
    func setInitialInfo() {
//        viewModel.getData {[self] openings in
//            // query openings here
//            game = OpeningGame(data: openings)
//            currentOpening = game!.data[0]
//            currentMove = currentOpening!.moveSequence[0]
//            moveChoices = currentOpening!.generate6ChoiceFor(correctMove: currentMove!)
//
//            DispatchQueue.main.async {
//                rootController.openingName.text = currentOpening!.name
//                updateLabels()
//                collectView.reloadData()
//            }
//        }
        game = OpeningGame(data: openingsData)
        currentOpening = game!.data[0]
        currentMove = currentOpening!.newMoveSequence[0]
        moveChoices = currentOpening!.generate6ChoiceFor(correctMove: currentMove!)
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.rootController.openingName.text = self.currentOpening!.name
            self.updateLabels()
            self.collectView.reloadData()
        }
    }
    
    func chooseMove() {
        moveIndex += 1
        if moveIndex >= currentOpening!.newMovesCount {
            openingIndex += 1
            moveIndex = 0
            if correctMoveCount == currentOpening!.newMovesCount {
                correctOpeningCount += 1
            }
            correctMoveCount = 0
            updateLabels()
        }
        if openingIndex >= game!.openingsCount {
            openingIndex = 0
            moveIndex = 0
            correctMoveCount = 0
            correctOpeningCount = 0
            updateLabels()
            popController(from: rootController, method: .withBackItem)
            return
        }
        currentOpening = game!.data[openingIndex]
        currentMove = currentOpening!.newMoveSequence[moveIndex]
        
        updateLabels()

        moveChoices = currentOpening!.generate6ChoiceFor(correctMove: currentMove!)
        rootController.openingName.text = currentOpening!.name
        collectView.reloadData()
        rootController.view.isUserInteractionEnabled = true
    }
    
    func checkMove(chosenMove move: String) {
        isCorrectMove = move == currentMove ? true : false
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnswerCell", for: indexPath) as? AnswerCell
        
        cell!.layer.cornerRadius = 20
        cell!.layer.masksToBounds = false
        cell!.layer.shadowOpacity = 0.3
        cell!.layer.shouldRasterize = true
        cell!.layer.rasterizationScale = UIScreen.main.scale
        
        if let moves = moveChoices {
            cell!.text = moves[indexPath.item]
            
            if currentOpening!.newMoveSequence.firstIndex(of: currentMove!)!.isEven {
                cell!.backgroundColor = color2
                cell!.label.textColor = color1
                cell!.layer.shadowColor = color1?.cgColor
            }
            else {
                cell!.backgroundColor = color1
                cell!.label.textColor = color2
            }
            return cell!
        }
        else {
            return cell!
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        rootController.view.isUserInteractionEnabled = false
        let cell = collectionView.cellForItem(at: indexPath) as? AnswerCell
        chosenMove = moveChoices![indexPath.row]
        checkMove(chosenMove: chosenMove!)
        
        if isCorrectMove {
            correctMoveCount += 1
        }
        
        let isEven = currentOpening!.newMoveSequence.firstIndex(of: currentMove!)!.isEven
        Animator.shared.animateCell(isCorrect: isCorrectMove, targetCell: cell!, isEven: isEven) {
            self.chooseMove()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - 75) / 2
        let height = (collectionView.bounds.height - 40) / 3
 
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 20, bottom: 0, right: 20)
    }
}
