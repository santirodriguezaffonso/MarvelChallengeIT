//
//  ViewController.swift
//  MarvelChallengeIT
//
//  Created by Santiago Rodriguez Affonso on 02/04/2022.
//

import UIKit
import Firebase

class SignInViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signInPressed(_ sender: UIButton) {
        
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print(e.localizedDescription)
                    Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                        self.performSegue(withIdentifier: "SignInHome", sender: self)
                    }
                } else {
                    self.performSegue(withIdentifier: "SignInHome", sender: self)
                }
            }
        }
    }
}

