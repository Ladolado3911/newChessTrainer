//
//  asnwerCell.swift
//  ChessTrainer2
//
//  Created by Ladolado3911 on 5/27/21.
//

import UIKit

class AnswerCell: UICollectionViewCell {
    
    let label: UILabel = UILabel()
    var text: String?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        label.text = text
        label.frame = bounds
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 30)
        addSubview(label)
    }
}
