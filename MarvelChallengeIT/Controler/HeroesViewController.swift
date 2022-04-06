//
//  HeroesViewController.swift
//  MarvelChallengeIT
//
//  Created by Santiago Rodriguez Affonso on 03/04/2022.
//

import UIKit
import Firebase

class HeroesViewController: UIViewController {
    
    var marvelManager = MarvelManager()
    let appearance = UINavigationBarAppearance()
    
    var characters = [CharacterModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Personajes"
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.hidesBackButton = true
        
        tableView.register(UINib(nibName: "CharacterCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
        
//        marvelManager.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        
        do {
            try Auth.auth().signOut()
            dismiss(animated: true)
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
}


//MARK: – UITableViewDataSource –

// This lines of code help you to populate the TableView
extension HeroesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! CharacterCell
        cell.characterNameLabel.text = "Spider Man"
        return cell
    }
}

//MARK: – UITableViewDelegate –

// This is to interact with each cell
extension HeroesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ToDetails", sender: self)
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
