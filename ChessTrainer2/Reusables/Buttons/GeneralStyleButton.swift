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
        
        backgroundColor = ProjectColors.purple
        setTitleColor(ProjectColors.white, for: .normal)
        layer.cornerRadius = 20
    }
}
