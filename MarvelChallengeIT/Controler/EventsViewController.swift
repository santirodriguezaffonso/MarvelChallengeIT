//
//  EventsViewController.swift
//  MarvelChallengeIT
//
//  Created by Santiago Rodriguez Affonso on 04/04/2022.
//

import UIKit

class EventsViewController: UIViewController {
    
    let appearance = UINavigationBarAppearance()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Eventos"
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.hidesBackButton = true

    }
    

}
