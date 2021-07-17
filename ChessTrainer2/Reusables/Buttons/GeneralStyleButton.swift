//
//  GeneralStyleButton.swift
//  ChessTrainer
//
//  Created by Ladolado3911 on 5/22/21.
//

import UIKit

class GeneralStyleButton: UIButton {
    override init(frame fr: CGRect) {
        super.init(frame: fr)
        
        backgroundColor = .blue
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        backgroundColor = ProjectColors.white
        setTitleColor(ProjectColors.purple, for: .normal)
        layer.cornerRadius = 15
        layer.shadowOpacity = 0.3
        layer.shadowColor = ProjectColors.purple.cgColor
    }
}
