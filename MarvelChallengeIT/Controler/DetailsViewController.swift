//
//  DetailsViewController.swift
//  MarvelChallengeIT
//
//  Created by Santiago Rodriguez Affonso on 10/04/2022.
//

import UIKit

class DetailsViewController: UIViewController {
    
    let heroesVC = HeroesViewController()
    var charImage = UIImageView()
    
    var characterTitle: String?
    var receivedImage: UIImageView?
    var characterDescription: String?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = characterTitle
        descriptionLabel.text = characterDescription
        
        
    }
    
    func setUpImage() {
        let url = "\(heroesVC.imageURL)"
        charImage.loadImage(with: url)
    }
}
