//
//  EventCell.swift
//  MarvelChallengeIT
//
//  Created by Santiago Rodriguez Affonso on 07/04/2022.
//

import UIKit

class EventCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var cellFrame: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cellFrame.layer.cornerRadius = 5
        eventImage.layer.cornerRadius = 5
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
