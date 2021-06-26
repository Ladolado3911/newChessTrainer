//
//  openingGameColelctionDataSource.swift
//  ChessTrainer2
//
//  Created by Ladolado3911 on 6/6/21.
//

import Foundation
import UIKit

class OpeningGameCollectionDataSource: CollectDataSource {
    
    var collectView: UICollectionView!
    var rootController: OpeningGameController!
    var viewModel: OpeningViewModel!
    
    var game: OpeningGame?

    var currentOpening: Opening?
    var currentMove: String?
    var moveChoices: [String]?
    var chosenMove: String?
    
    var moveIndex: Int = 0
    var openingIndex: Int = 0
    var isCorrectMove: Bool = false
    
    var color1 = ProjectColors.purple
    var color2 = ProjectColors.white
    
    var correctMoveCount: Int = 0
    var correctOpeningCount: Int = 0
//    var correctCount: Int = 0
    
    init(collectView collect: UICollectionView, controller ctrl: OpeningGameController, viewModel model: OpeningViewModel) {
        super.init()
        collectView = collect
        rootController = ctrl
        viewModel = model
        
        collectView.dataSource = self
        collectView.delegate = self
    }
    
    func setInitialInfo() {
        viewModel.getData {[self] openings in
            // query openings here
            game = OpeningGame(data: openings)
            currentOpening = game!.data[0]
            currentMove = currentOpening!.moveSequence[0]
            moveChoices = currentOpening!.generate6ChoiceFor(correctMove: currentMove!)
            
            rootController.openingName.text = currentOpening!.name
            rootController.stats.text = "Moves: \(correctMoveCount) / \(currentOpening!.movesCount)"
            rootController.openingStats.text = "Openings: \(correctOpeningCount) / \(game!.data.count)"
            rootController.moveNum.text = "Move: \(moveIndex + 1)"
            print("reloaded")
            collectView.reloadData()
        }
    }
    
    func chooseMove() {
        moveIndex += 1
        if moveIndex >= currentOpening!.movesCount {
            openingIndex += 1
            moveIndex = 0
            
            if correctMoveCount == currentOpening!.movesCount {
                correctOpeningCount += 1
            }
            correctMoveCount = 0
            rootController.stats.text = "Moves: \(correctMoveCount) / \(currentOpening!.movesCount)"
            rootController.openingStats.text = "Openings: \(correctOpeningCount) / \(game!.data.count)"
            rootController.moveNum.text = "Move: \(moveIndex + 1)"
        }
        if openingIndex >= game!.openingsCount {
            openingIndex = 0
            moveIndex = 0
            correctMoveCount = 0
            correctOpeningCount = 0
            rootController.stats.text = "Moves: \(correctMoveCount) / \(currentOpening!.movesCount)"
            rootController.openingStats.text = "Openings: \(correctOpeningCount) / \(game!.data.count)"
            rootController.moveNum.text = "Move: \(moveIndex + 1)"
            print("time to quit")
            //rootController.dismiss(animated: true, completion: nil)
            popController(from: rootController, method: .withBackItem)
            return
        }
        currentOpening = game!.data[openingIndex]
        currentMove = currentOpening!.moveSequence[moveIndex]
        
        rootController.stats.text = "Moves: \(correctMoveCount) / \(currentOpening!.movesCount)"
        rootController.openingStats.text = "Openings: \(correctOpeningCount) / \(game!.data.count)"
        rootController.moveNum.text = "Move: \(moveIndex + 1)"

        moveChoices = currentOpening!.generate6ChoiceFor(correctMove: currentMove!)
        rootController.openingName.text = currentOpening!.name
        collectView.reloadData()
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
        
        if let moves = moveChoices {
            print("Unwrapped")
            cell!.text = moves[indexPath.item]

            if currentOpening!.moveSequence.firstIndex(of: currentMove!)!.isEven {
                cell!.backgroundColor = color2
                cell!.label.textColor = color1
                cell!.layer.borderWidth = 2
                cell!.layer.borderColor = color1.cgColor
            }
            else {
                cell!.backgroundColor = color1
                cell!.label.textColor = color2
            }
            return cell!
        }
        else {
            print("Not unwrapped")
            return cell!
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        chosenMove = moveChoices![indexPath.row]
        checkMove(chosenMove: chosenMove!)
        
        if isCorrectMove {
            correctMoveCount += 1
        }

        Animator.shared.animateCell(isCorrect: isCorrectMove, targetCell: cell!) {
            self.chooseMove()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - 75) / 2
        let height = width
//        let height = (collectionView.bounds.height - 40) / 3
//        let width = height
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
}
