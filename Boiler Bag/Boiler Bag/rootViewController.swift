//
//  rootViewController.swift
//  Boiler Bag
//
//  Created by Kunwar Sahni on 9/14/19.
//  Copyright © 2019 hello world. All rights reserved.
//

import UIKit
import Firebase

class rootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        authenticateUserAndConfigureView()
    }
    
    
    func authenticateUserAndConfigureView(){
        if Auth.auth().currentUser == nil{
            DispatchQueue.main.async{

                self.performSegue(withIdentifier: "signSegue", sender: nil)
            }
        } else{
            guard let uid = Auth.auth().currentUser?.uid else {return}
            Database.database().reference().child("users").child(uid).child("delivery").observeSingleEvent(of: .value) { (snapshot) in
                guard let delivery = snapshot.value as? String else {return}
                
                if(delivery == "True"){
                    //print("True")
                    self.performSegue(withIdentifier: "rootToDeliv", sender: nil)
                }else if (delivery == "False"){
                    //print("False")
                    self.performSegue(withIdentifier: "rootToStore", sender: nil)
                } else {
                    print("error in devliery determination")
                }
            }
            print("User is already Loged In")
        }
    }
}
