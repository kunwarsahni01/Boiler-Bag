//
//  DeliveryViewController.swift
//  Boiler Bag
//
//  Created by Kunwar Sahni on 9/15/19.
//  Copyright © 2019 hello world. All rights reserved.
//

import UIKit
import Firebase

class DeliveryViewController: UIViewController {
    @IBOutlet weak var delivTableVIew: UITableView!
    var orderNumber: Int?
    var tblArray: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Database.database().reference().child("random").child("random").observeSingleEvent(of: .value) { (snapshot) in
            guard let random = snapshot.value as? Int else {return}
            self.orderNumber = random + 1
        }
        
        Database.database().reference().child("random").child("random").child("\(orderNumber!)").observeSingleEvent(of: .value, with: { (snapshot) in
            if snapshot.exists(){
                self.tblArray.append("\(self.orderNumber)")
            }else{
                print("doesnt exist yet")
            }
        })
        print(tblArray)
    }
}
