//
//  HeroesViewController.swift
//  MarvelChallengeIT
//
//  Created by Santiago Rodriguez Affonso on 03/04/2022.
//

import UIKit
import Firebase
import CryptoKit

class HeroesViewController: UIViewController {
    
    var mManager = MarvelKeys()
    
    let appearance = UINavigationBarAppearance()
    
    var characters = [MarvelCharacterData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Personajes"
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.hidesBackButton = true
        
        setupTable()
        fetchCharacter()
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
    
    private func setupTable() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CharacterCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
    }
    
    private func fetchCharacter() {
        let ts = String(Date().timeIntervalSince1970)
        let hash = MD5(data: "\(ts)\(mManager.publicK)\(mManager.privateK)")
        
        let url = URL(string: "https://gateway.marvel.com:443/v1/public/characters?orderBy=name&ts=\(ts)&apikey=\(mManager.publicK)&hash=\(hash)")
        
        URLSession.shared.dataTask(with: URLRequest(url: url!)) { data, _, error in
            if error != nil {
                print(String(describing: error))
                return
            }
            
            do {
                self.characters = try JSONDecoder().decode([MarvelCharacterData].self, from: data!)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            catch {
                print(String(describing: error))
            }
        }
        .resume()
    }
    
    func MD5(data: String) -> String {
        let hash = Insecure.MD5.hash(data: data.data(using: .utf8) ?? Data())
        return hash.map {
            String(format: "%02hhx", $0)
        }
        .joined()
    }
    
}



//MARK: – UITableViewDataSource –

// This lines of code help you to populate the TableView
extension HeroesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! CharacterCell
        cell.characterNameLabel.text = characters[indexPath.row].data.results[0].name
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
