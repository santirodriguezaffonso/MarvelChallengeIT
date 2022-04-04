//
//  HeroesViewController.swift
//  MarvelChallengeIT
//
//  Created by Santiago Rodriguez Affonso on 03/04/2022.
//

import UIKit

class HeroesViewController: UIViewController {
    
    var marvelManager = MarvelManager()
    
    @IBOutlet weak var tableView: UITableView!
    
    var characters: [CharacterModel] = [
        CharacterModel(id: 1, characterName: "Spider Man", description: "no one", image: "sdsdss")
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        title = "Pesonajes"
        marvelManager.delegate = self
        tableView.dataSource = self
        
    }
    
    
}

//MARK: – MarvelManagerDelegate –

extension HeroesViewController: MarvelManagerDelegate {
    func didUpdateEvent(_ marvelManager: MarvelManager, event: EventsModel) {
        DispatchQueue.main.async {
            
        }
    }
    
    func didUpdateCharacter(_ marvelManager: MarvelManager, character: CharacterModel) {
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}

//MARK: UITableView

extension HeroesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath)
        cell.textLabel?.text = "This is a cell"
        return cell
    }
    
}
