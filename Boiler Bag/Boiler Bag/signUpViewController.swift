//
//  signUpViewController.swift
//  Boiler Bag
//
//  Created by Kunwar Sahni on 9/14/19.
//  Copyright © 2019 hello world. All rights reserved.
//

import UIKit
import Firebase


class signUpViewController: UIViewController {

    @IBOutlet weak var googleSignUpButt: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var SignEmail: UITextField!
    @IBOutlet weak var SignPassword: UITextField!
    @IBOutlet weak var delivSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUpTouched(_ sender: Any) {
        var deliverTF = "False"
        guard let emailText = SignEmail.text else {return}
        guard let passwordText = SignPassword.text else {return}
        if(delivSwitch.isOn){
            deliverTF = "True"
        }
        createUser(withEmail: emailText, password: passwordText, delivery: deliverTF)
    }
    
    @IBAction func googleButtTapped(_ sender: Any) {
        
    }
    
    func createUser(withEmail email: String, password: String, delivery: String){
        
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let error = error{
                print("Failed to sign up user with error")
                return
            }
            
            guard let uid = result?.user.uid else {
                return
            }
            
            let values = ["email": email, "delivery": delivery]
            
            Database.database().reference().child("users").child(uid).updateChildValues(values, withCompletionBlock: { (error, ref) in
                if let error = error {
                    print("Failed to update databse with errors:", error.localizedDescription)
                    return
                }
                
                print("Succesfuly Signed User up")
                self.performSegue(withIdentifier: "signToRoot", sender: nil)

            })
            
        }
        
    } 
}
