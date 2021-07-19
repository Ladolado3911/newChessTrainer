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
    var openingName: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        guard let openingName = openingName else { return }
        fancyView.layer.shadowOpacity = 0.3
        fancyView.layer.shadowColor = ProjectColors.purple.cgColor
        if fancyView.backgroundColor == ProjectColors.purple {
            openingNameLabel.textColor = .white
        }
        else {
            openingNameLabel.textColor = ProjectColors.purple
        }
        openingNameLabel.text = openingName
    }
}
