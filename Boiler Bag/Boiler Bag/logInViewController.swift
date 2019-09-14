//
//  logInViewController.swift
//  Boiler Bag
//
//  Created by Kunwar Sahni on 9/14/19.
//  Copyright © 2019 hello world. All rights reserved.
//

import UIKit
import Firebase

class logInViewController: UIViewController {

    @IBOutlet weak var googleLogInButton: UIButton!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var emailLogIn: UITextField!
    @IBOutlet weak var passwordLogIn: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logInTouched(_ sender: Any) {
        guard let emailText = emailLogIn.text else {return}
        guard let passwordText = passwordLogIn.text else {return}
        logUserIn(withEmail: emailText, password: passwordText)
    }
    
    @IBAction func googleLogInTouch(_ sender: Any) {
        
    }
    
    func logUserIn(withEmail email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if let error = error{
                print("Failed to Log In user with error")
                return
            }
            print("Succesfully Log In User")
            self.performSegue(withIdentifier: "loginToRoot", sender: nil)
        }
    }
    
}
