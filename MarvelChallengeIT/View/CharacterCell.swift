//
//  CharacterCell.swift
//  MarvelChallengeIT
//
//  Created by Santiago Rodriguez Affonso on 04/04/2022.
//

import UIKit

class CharacterCell: UITableViewCell {

    
    @IBOutlet weak var cellFrame: UIView!
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var characterDescriptionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layoutCorners()
        
    }
    
    func layoutCorners() {
        cellFrame.layer.cornerRadius = 4
        cellImage.layer.cornerRadius = 4
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
