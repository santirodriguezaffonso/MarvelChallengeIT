//
//  CharacterCell.swift
//  MarvelChallengeIT
//
//  Created by Santiago Rodriguez Affonso on 04/04/2022.
//

import UIKit

class CharacterCell: UITableViewCell {

    
    @IBOutlet weak var cellFrame: UIView!
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var characterDescriptionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cellFrame.layer.cornerRadius = 5
        characterImageView.layer.cornerRadius = 5
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
