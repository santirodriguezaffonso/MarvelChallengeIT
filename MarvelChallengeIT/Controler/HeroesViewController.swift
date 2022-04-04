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
    
    
    var characters = [CharacterModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        marvelManager.delegate = self
//        tableView.delegate = self
        tableView.dataSource = self
        
    }
}

//MARK: – UITableViewDataSource –

extension HeroesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath)
//        cell.textLabel?.text = "characters[indexPath.row]."
        return UITableViewCell()
    }
}

//MARK: – UITableViewDelegate –

 // This is to interact with each cell
extension HeroesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "HeroesToDetails", sender: self)
    }

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let destination = segue.destination as? HeroesViewController {
//            destination.characters = characters[tableView.indexPathForSelectedRow?.row]
//        }
//    }
}




////MARK: – MarvelManagerDelegate –
//
//extension HeroesViewController: MarvelManagerDelegate {
//    func didUpdateEvent(_ marvelManager: MarvelManager, event: EventsModel) {
//        }
//
//    func didUpdateCharacter(_ marvelManager: MarvelManager, character: CharacterModel) {
//        DispatchQueue.main.async {
//
//        }
//    }
//
//    func didFailWithError(error: Error) {
//        print(error)
//    }
//}
