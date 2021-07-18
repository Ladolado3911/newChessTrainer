//
//  ComingSoonButton.swift
//  ChessTrainer2
//
//  Created by lado tsivtsivadze on 7/17/21.
//

import UIKit

class ComingSoonButton: UIButton {
    override init(frame fr: CGRect) {
        super.init(frame: fr)
        
        backgroundColor = .blue
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        backgroundColor = ProjectColors.white
        setTitleColor(UIColor.gray, for: .normal)
        layer.cornerRadius = 15
        layer.shadowOpacity = 0.3
        layer.shadowColor = UIColor.gray.cgColor
    }
}

