//
//  OpeningCell.swift
//  ChessTrainer2
//
//  Created by Ladolado3911 on 18.07.21.
//

import UIKit

class OpeningCell: UITableViewCell {
    
    @IBOutlet weak var fancyView: UIView!
    @IBOutlet weak var openingNameLabel: UILabel!
    var opening: UniqueOpening?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        guard let opening = opening else { return }
        
        openingNameLabel.text = opening.name
        fancyView.layer.shadowColor = ProjectColors.purple.cgColor
        fancyView.layer.shadowOpacity = 0.3
        fancyView.backgroundColor = ProjectColors.white
        openingNameLabel.textColor = ProjectColors.purple
        //openingNameLabel.frame = fancyView.bounds
        
        if opening.isSelected {
            fancyView.backgroundColor = ProjectColors.purple
            openingNameLabel.textColor = ProjectColors.white
        }
        else {
            fancyView.backgroundColor = ProjectColors.white
            openingNameLabel.textColor = ProjectColors.purple
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //guard let opening = opening else { return }
        //openingNameLabel.text = opening.name
//        fancyView.layer.shadowColor = ProjectColors.purple.cgColor
//        fancyView.layer.shadowOpacity = 0.3
//
//        if opening.isSelected {
//            fancyView.backgroundColor = ProjectColors.purple
//            openingNameLabel.textColor = ProjectColors.white
//        }
//        else {
//            fancyView.backgroundColor = ProjectColors.white
//            openingNameLabel.textColor = ProjectColors.purple
//        }
        //print("layout subiews")
        
    }
    
    override func dragStateDidChange(_ dragState: UITableViewCell.DragState) {
        print("drag")
    }
    
    override func didTransition(to state: UITableViewCell.StateMask) {
        print("changed state")
    }
    
    deinit {
        print("deinited cell")
    }
}
