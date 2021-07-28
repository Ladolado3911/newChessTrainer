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
    @IBOutlet weak var variations: UILabel!
    @IBOutlet weak var mastery: UILabel!
    
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
        variations.text = "\(opening.openings.count) Variations"
    
        //fancyView.layer.shadowColor = ProjectColors.purple.cgColor
        fancyView.layer.shadowOpacity = 0.5
        fancyView.backgroundColor = ProjectColors.white
        openingNameLabel.textColor = ProjectColors.purple
        variations.textColor = .gray
        mastery.textColor = .gray
        //openingNameLabel.frame = fancyView.bounds
        
        if opening.isSelected {
//            DispatchQueue.main.asyncAfter(deadline: .now()) { [weak self] in
//                guard let self = self else { return }
//                UIView.animate(withDuration: 0.1) {
//                    print("inside animation")
//                    self.fancyView.layer.shadowColor = UIColor.black.cgColor
//                    self.fancyView.backgroundColor = ProjectColors.purple
//                    self.openingNameLabel.textColor = ProjectColors.white
//                    self.variations.textColor = .white
//                    self.mastery.textColor = .white
//                }
//            }
            fancyView.layer.shadowColor = UIColor.black.cgColor
            fancyView.backgroundColor = ProjectColors.purple
            openingNameLabel.textColor = ProjectColors.white
            variations.textColor = .white
            mastery.textColor = .white
        }
        else {
//            DispatchQueue.main.asyncAfter(deadline: .now()) { [weak self] in
//                guard let self = self else { return }
//                UIView.animate(withDuration: 0.1) {
//                    print("inside animation")
//                    self.fancyView.layer.shadowColor = ProjectColors.purple.cgColor
//                    self.fancyView.backgroundColor = ProjectColors.white
//                    self.openingNameLabel.textColor = ProjectColors.purple
//                    self.variations.textColor = .gray
//                    self.mastery.textColor = .gray
//                }
//            }
            
            
            
            fancyView.layer.shadowColor = ProjectColors.purple.cgColor
            fancyView.backgroundColor = ProjectColors.white
            openingNameLabel.textColor = ProjectColors.purple
            variations.textColor = .gray
            mastery.textColor = .gray
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
