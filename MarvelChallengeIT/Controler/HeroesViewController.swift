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
    
    var signInClear = SignInViewController()
    var mManager = MarvelKeys()
    
    let appearance = UINavigationBarAppearance()
    
    var characters: [Character] = []
    
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
        let hash = MD5(data: "\(ts)\(mManager.privateK)\(mManager.publicK)")
        
        let url = URL(string: "https://gateway.marvel.com:443/v1/public/characters?&ts=\(ts)&apikey=\(mManager.publicK)&hash=\(hash)")
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url!)) { data, _, error in
            if error != nil {
                print(String(describing: error))
                return
            }
            
            do {
                let decoded = try JSONDecoder().decode(MarvelCharacterData.self, from: data!)
                self.characters = decoded.data.results
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            catch {
                print(String(describing: error))
            }
        }
        task.resume()
    }
    
    func MD5(data: String) -> String {
        let hash = Insecure.MD5.hash(data: data.data(using: .utf8) ?? Data())
        return hash.map {
            String(format: "%02hhx", $0)
        } .joined()
    }
}

//MARK: Image Donwloader

var imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    func loadImage(with urlString: String) {
        if let image = imageCache.object(forKey: urlString as NSString) as? UIImage {
            self.image = image
            return
        }
        let url = URL(string: urlString)
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url!) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        imageCache.setObject(image, forKey: urlString as NSString)
                        self?.image = image
                    }
                }
            }
        }
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
        cell.characterNameLabel.text = characters[indexPath.row].name
        cell.characterDescriptionLabel.text = characters[indexPath.row].description
        cell.characterImageView.loadImage(with: "\(characters[indexPath.row].thumbnail.path)/standard_large.\(characters[indexPath.row].thumbnail.extension)")
        return cell
    }
}

//MARK: – UITableViewDelegate

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
