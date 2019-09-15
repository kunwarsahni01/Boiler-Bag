//
//  StoreViewController.swift
//  Boiler Bag
//
//  Created by Kunwar Sahni on 9/14/19.
//  Copyright © 2019 hello world. All rights reserved.
//

import UIKit

class StoreViewController: UIViewController {
    
    var storeName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "storeToProfile"){
            let displayVC = segue.destination as! StoreProfileViewController
            displayVC.storeNameDetail = storeName
        }
    }
    
    @IBAction func thirdStreet(_ sender: Any) {
        storeName = "Third Street Market"
        self.performSegue(withIdentifier: "storeToProfile", sender: self)
    }
    
    @IBAction func starbucks(_ sender: Any) {
        
    }
    
    @IBAction func urbanMarket(_ sender: Any) {
        
    }
    
    @IBAction func stewart(_ sender: Any) {
        
        
    }
    
    @IBAction func earhart(_ sender: Any) {
        
    }
    
    @IBAction func ford(_ sender: Any) {
        
    }
    
    @IBAction func windsor(_ sender: Any) {
        
    }
}
