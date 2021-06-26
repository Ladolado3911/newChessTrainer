//
//  GeneralStyleLabel.swift
//  ChessTrainer
//
//  Created by Ladolado3911 on 5/22/21.
//

import UIKit


class GeneralStyleLabel: UILabel {
    override init(frame fr: CGRect) {
        super.init(frame: fr)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        font = UIFont(name: "Helvetica Neue Bold", size: 22)
        
    }
}
