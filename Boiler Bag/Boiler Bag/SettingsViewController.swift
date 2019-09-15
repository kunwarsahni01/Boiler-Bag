//
//  SettingsViewController.swift
//  Boiler Bag
//
//  Created by Kunwar Sahni on 9/15/19.
//  Copyright © 2019 hello world. All rights reserved.
//

import UIKit
import Firebase

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func logOutTouched(_ sender: Any) {
        try! Auth.auth().signOut()
    self.performSegue(withIdentifier: "settToHom", sender: nil)
    }
}
